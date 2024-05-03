<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Etat;
use App\Models\Matiere;
use App\Models\Employee;
use App\Models\Categorie;
use App\Models\Reception;
use App\Models\TypeEntree;
use App\Models\EspeceUnite;
use App\Models\SousMatiere;
use Illuminate\Http\Request;
use App\Models\FicheDetenteur;
use App\Models\TauxAmortissement;
use App\Models\TableAmortissement;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

class MatiereController extends Controller
{
    // Les fonctions controller pour l'INSERTION de nouveau matiere

    public function createReception(Request $request) {
        $type = $request->get('type');

        return view('pages/newInsert', [
            "type" => $type,
            "step" => "pvreception"
        ]);
    }

    public function storeReception(Request $request) {
        $number = $request->number;

        // Inserer dans la base les donnees de la table receptions
        $reception = Reception::create([
            'referenceDAO' => $request->ref,
            'objet' => $request->objet,
            'nombreLot' => $request->number,
        ]);
        
        // Inserer une matiere en boucle
        for($i = 1; $i <= $number; $i++) {
            $designation = "designation-$i";
            $specification = "specification-$i";
            $minimal = "prix-minimal-$i";
            $maximal = "prix-maximal-$i";
            $quantite = "quantite-$i";

            $matiere = Matiere::create([
                'designation' => $request->$designation,
                'specification' => $request->$specification,
                'dateAcquisition' => Carbon::now(),
                'prix' => 0,
                'prixMinimal' => $request->$minimal,
                'prixMaximal' => $request->$maximal,
                'societeAchat' => '',
                'quantite' => $request->$quantite,
                'dateActualisation' => Carbon::now(),
                'dateSortie' => Carbon::now(),
                'numeroFolio' => 1,
                'facture' => '',
                'bonLivraison' => '',
                'observation' => '',
                'etape' => 1,
                'reception_id' => $reception->id,
                'type_entree_id' => 0,
                'taux_amortissement_id' => 0,
                'table_amortissement_id' => 0,
                'espece_unite_id' => 0,
                'categorie_id' => 0,
            ]);
        }

        if($matiere && $reception) {
            return to_route('validate.show', [
                'number' => $number,
                'last_insert' => $matiere->id,
            ]);
        }
        else {
            return redirect()->back();
        }
    }

    public function showValidate(Request $request) {
        $last_insert = $request->get('last_insert');
        
        $matiere = Matiere::findorFail($last_insert);
        $prmp = Employee::where('poste', "Personne responsables des marchés publiques")->first();
        $gac = Employee::where('poste', "Directeur générale")->first();
        $dcm = Employee::where('poste', "Depositaire comptable")->first();

        return view('pages/newInsert', [
            'type' => 'achat',
            "number" => $request->get('number'),
            "last_insert" => $last_insert,
            "matiere" => $matiere,
            "step" => "validation",
            "prmp" => $prmp,
            "gac" => $gac,
            "dcm" => $dcm,
        ]);
    }

    public function storeValidate(Request $request) {
        $matiere = Matiere::find($request->last_insert);

        $matiere->validate += 1;
        $matiere->save();

        if($matiere->validate >= 3) {
            $matiere->etape = 2;
            $matiere->save();

            return to_route('matiere.create', [
                'last_insert' => $matiere->id,
            ]);
        }

        return to_route('home');
    }

    public function createMatiere(Request $request) {
        $amortissements = TauxAmortissement::all();
        $classes = Categorie::all();
        $types = TypeEntree::all();
        $unites = EspeceUnite::all();
        $matiere = Matiere::find($request->last_insert);
        $etats = Etat::all();
        $employees = Employee::all();

        $number = $request->number;

        return view('pages/newInsert', [
                'type' => 'achat',
                "number" => $number,
                "step" => "insertion",
                "amortissements" => $amortissements,
                "classes" => $classes,
                'types' => $types,
                'unites' => $unites,
                'matiere' => $matiere,
                'etats' => $etats,
                'employees' => $employees,
                'id' => $request->get('last_insert'),
        ]);
    }

    public function storeMatiere(Request $request) {
        // insertion dans la table matiere
        $matiere = Matiere::find($request->id)
                    ->update([
                        'prix' => $request->price,
                        'societeAchat' => $request->fournisseur,
                        'facture' => $request->facture,
                        'bonLivraison' => $request->bonLivraison,
                        'observation' => $request->observation,
                        'etape' => 3,
                        'type_entree_id' => $request->typeEntree,
                        'taux_amortissement_id' => $request->rubrique,
                        'espece_unite_id' => $request->unite,
                        'categorie_id' => $request->nomenclature,
        ]);

        // insertion dans la table table_amortissement
        $table = TableAmortissement::create([
            'amortissementAnterieur' => 0,
            'dotationExercice' => dotationExercice($request->price, $request->taux),
            'matiere_id' => $request->id,
            'taux_amortissement_id' => $request->rubrique,
        ]);

        // insertion dans la table pivot et la table sous_matiere
        for ($i = 1; $i <= $request->nombre_detenteur; $i++) {
            $id_emp = "id-$i";
            $quantite = "quantite-$i";
            $etat = "etat-$i";

            $sous_matiere = SousMatiere::create([
                'quantite' => $request->$quantite,
                'etat_id' => $request->$etat,
                'matiere_id' => $request->id
            ]);

            $fiche_detenteur = FicheDetenteur::create([
                'employee_id' => $request->$id_emp,
                'sous_matiere_id' => $sous_matiere->id
            ]);
        }

        return redirect()->route('home')->with("success","Nouveau matiére inclus dans la comptabilité matiere du FTM");
        
    }

    // Fin des fonctions controller pour l'INSERTION


    // Les fonctions controller pour l'INVENTAIRE des matieres

    public function showInventaire() {
        $matieres = Matiere::all();

        return view('pages/displayImmo', [
            'matieres' => $matieres
        ]);
    }

    public function detailMatiere(int $id) {
        return view('pages/inventaire/showDetail' , ["id" => $id]);
    }

    public function showJournal() {
        return view('pages/inventaire/journal');
    }

    public function showWaiting() {
        $matieres_first = Matiere::where('etape', 1)->get();
        $matieres_second = Matiere::where('etape', 2)->get();

        return view('pages/inventaire/attente', [
            'matieres_first' => $matieres_first,
            'matieres_second' => $matieres_second,
        ]);
    }

    // Fin des fonctions controller pour l'INVENTAIRE

    // Les fonctions controller pour l'ETAT FINANCIER

    public function displayAmmortissement() {
        return view('pages/displayAmmortissement');
    }

    // Fin des fonctions controller pour l'ETAT FINANCIER

    // Les fonction controller pour les RAPPORT 

    public function makeRecensement() {
        return view('pages/rapport/recensement');
    }

    public function makeDemolition() {
        return view('pages/rapport/demolition');
    }

    // Fin des fonctions controller pour les RAPPORT
}