<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AuthViewController extends Controller
{
    public function loginView() {
        return view('auth.login');
    }

    public function registerView() {
        return view('auth.register');
    }
}