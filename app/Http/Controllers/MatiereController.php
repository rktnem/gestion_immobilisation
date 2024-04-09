<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

class MatiereController extends Controller
{
    public function newInsert(Request $request) {
        $type = $request->typeEntree;

        return view('pages/newInsert', [
            "type" => $type,
            "step" => "pvreception"
        ]);
    }

    public function saveReception(Request $request) {
        // $rules = [
        //     'ref' => ['required','max:1'],
        //     'number' => ['required','max:100'],
        // ];

        // $request->validate($rules);

        $type = $request->typeEntree;

        return view('pages/newInsert', [
            "type" => $type,
            "step" => "validation"
        ]);
    }

    public function showInsert(Request $request) {
        $type = $request->typeEntree;

        return view('pages/newInsert', [
                "type" => $type,
                "step" => "insertion"
        ]);
    }

    public function saveMatiere(Request $request) {
        $type = $request->typeEntree;

        return redirect()->route('home')->with("success","Nouveau matiére inclus dans la comptabilité matiere du FTM");
    }

    public function showInventaire() {
        return view('pages/displayImmo');
    }

    public function detailMatiere(int $id) {
        return view('pages/inventaire/showDetail' , ["id" => $id]);
    }

    public function showJournal() {
        return view('pages/inventaire/journal');
    }

    public function displayAmmortissement() {
        return view('pages/displayAmmortissement');
    }
}