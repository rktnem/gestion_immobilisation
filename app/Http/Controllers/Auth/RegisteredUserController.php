<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\Employee;
use App\Models\Departement;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Validation\Rules;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\Registered;

class RegisteredUserController extends Controller
{
    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        // dd($request);
        $request->validate([
            'name' => ['required'],
            'last_name' => ['required'],
            'pseudo' => ['required'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', Rules\Password::defaults()],
            'matricule' => ['required'],
            'sigle' => ['required'],
            'poste' => ['required'],
        ]);

    $user = User::create([
        'name' => $request->name,
        'last_name' => $request->last_name,
        'pseudo' => $request->pseudo,
        'email' => $request->email,
        'password' => Hash::make($request->password),
        'matricule' => $request->matricule,
        'sigle' => $request->sigle,
        'poste' => $request->poste,
        'idEmployee' => $request->id_emp,
    ]);

        event(new Registered($user));

        Auth::login($user);

        return to_route('login');
    }
}