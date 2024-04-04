<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DetenteurController extends Controller
{
    public function displayOwner() {
        return view('pages/displayOwner');
    }

    public function detailOwner(int $id) {
        return view('pages/detenteur/showOwner');
    }
}