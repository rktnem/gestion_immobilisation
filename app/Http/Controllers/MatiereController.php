<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Matiere;
use App\Models\Categorie;
use App\Models\Reception;
use App\Models\TypeEntree;
use App\Models\EspeceUnite;
use Illuminate\Http\Request;
use App\Models\TauxAmortissement;
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
                'observation' => '',
                'etape' => 1,
                'reception_id' => $reception->id,
                'type_entree_id' => 0,
                'table_amortissement_id' => 0,
                'espece_unite_id' => 0,
                'categorie_id' => 0,
            ]);
        }

        if($matiere && $reception) {
            return to_route('validate.show', [
                'number' => $number,
            ]);
        }
        else {
            return redirect()->back();
        }
    }

    public function showValidate(Request $request) {
        return view('pages/newInsert', [
            'type' => 'achat',
            "number" => $request->get('number'),
            "step" => "validation",
        ]);
    }

    public function showInsert(Request $request) {
        $amortissements = TauxAmortissement::all();
        $classes = Categorie::all();
        $types = TypeEntree::all();
        $unites = EspeceUnite::all();

        $number = $request->number;

        return view('pages/newInsert', [
                'type' => 'achat',
                "number" => $number,
                "step" => "insertion",
                "amortissements" => $amortissements,
                "classes" => $classes,
                'types' => $types,
                'unites' => $unites,
        ]);
    }

    public function saveMatiere(Request $request) {
        $number = $request->number;

        $number = $number - 1;

        if($number != 0) {

            return redirect()->route('newInsert.insert', [
                'type' => 'achat',
                'number' => $number,
            ]);
        }
        else {
            return redirect()->route('home')->with("success","Nouveau matiére inclus dans la comptabilité matiere du FTM");
        }
    }

    // Fin des fonctions controller pour l'INSERTION


    // Les fonctions controller pour l'INVENTAIRE des matieres

    public function showInventaire() {
        return view('pages/displayImmo');
    }

    public function detailMatiere(int $id) {
        return view('pages/inventaire/showDetail' , ["id" => $id]);
    }

    public function showJournal() {
        return view('pages/inventaire/journal');
    }

    public function showAttente() {
        return view('pages/inventaire/attente');
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