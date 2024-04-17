<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Employee;
use App\Models\Departement;
use Illuminate\Http\Request;

class AuthViewController extends Controller
{
    public function loginView() {
        $departements = Departement::all();
        $users = User::all();

        return view('auth.login', [
            'departements' => $departements,
            'users' => $users,
        ]);
    }

    public function registerView() {
        $departements = Departement::all();
        $employees = Employee::all();

        return view('auth.register', [
            'departements' => $departements,
            'employees' => $employees,
        ]);
    }

    public function dashboardView() {
        return view('auth.login');
    }
}