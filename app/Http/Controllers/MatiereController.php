<?php

namespace App\Http\Controllers;

use App\Models\Categorie;
use App\Models\TypeEntree;
use App\Models\EspeceUnite;
use Illuminate\Http\Request;
use App\Models\TauxAmortissement;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

class MatiereController extends Controller
{
    // Les fonctions controller pour l'INSERTION de nouveau matiere

    public function newInsert(Request $request) {
        $type = $request->typeEntree;

        return view('pages/newInsert', [
            "type" => 'achat',
            "step" => "pvreception"
        ]);
    }

    public function saveReception(Request $request) {
        $number = $request->number;

        return view('pages/newInsert', [
            'type' => 'achat',
            "number" => $number,
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
            $amortissements = TauxAmortissement::all();
            $classes = Categorie::all();
            $types = TypeEntree::all();
            $unites = EspeceUnite::all();

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
        // dd(Auth::user()->poste);

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