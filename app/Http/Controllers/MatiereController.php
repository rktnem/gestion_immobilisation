<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use App\Models\TypeEntree;
use App\Models\EspeceUnite;
use Illuminate\Http\Request;
use App\Models\TauxAmortissement;
use Illuminate\Support\Facades\Route;

class MatiereController extends Controller
{
    // Les fonctions controller pour l'INSERTION de nouveau matiere

    public function newInsert(Request $request) {
        $type = $request->typeEntree;

        return view('pages/newInsert', [
            "type" => $type,
            "step" => "pvreception"
        ]);
    }

    public function saveReception(Request $request) {
        $type = $request->typeEntree;

        return view('pages/newInsert', [
            "type" => $type,
            "step" => "validation"
        ]);
    }

    public function showInsert(Request $request) {
        $amortissements = TauxAmortissement::all();
        $classes = Categorie::all();
        $types = TypeEntree::all();
        $unites = EspeceUnite::all();

        $type = $request->typeEntree;

        return view('pages/newInsert', [
                "type" => $type,
                "step" => "insertion",
                "amortissements" => $amortissements,
                "classes" => $classes,
                'types' => $types,
                'unites' => $unites,
        ]);
    }

    public function saveMatiere(Request $request) {
        $type = $request->typeEntree;

        return redirect()->route('home')->with("success","Nouveau matiére inclus dans la comptabilité matiere du FTM");
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