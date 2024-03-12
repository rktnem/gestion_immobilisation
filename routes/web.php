<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/create', function () {
    return view('create');
})->name('create.show');

Route::post('create', function () {
    $pdf = Pdf::loadView('welcome');

    return $pdf->download('invoice.pdf');
})->name('create.send');
