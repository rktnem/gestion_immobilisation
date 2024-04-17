<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\Departement;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\Auth\LoginRequest;

class AuthenticatedSessionController extends Controller
{
    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request)
    {
        // dd($request);
        // $request->validate([
        //     'matricule' => ['required'],
        //     'pseudo' => ['required'],
        // ])

        $request->authenticate();

        $request->session()->regenerate();

        return to_route('home');
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request)
    {
        $departements = Departement::all();
        $users = User::all();

        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return to_route('login', [
            'departements' => $departements,
            'users' => $users,
        ]);
    }
}