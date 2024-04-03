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
        $type = $request->typeEntree;

        return view('pages/newInsert', [
            "type" => $type,
            "step" => "validation"
        ]);
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