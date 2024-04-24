<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\TypeEntree;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(User $user) {
        
        return view('welcome');
    }
}