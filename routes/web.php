<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MatiereController;
use App\Http\Controllers\DetenteurController;

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
})->name('home');

Route::controller(MatiereController::class)->group(function () {
    // Cette portion est le route de l'accueil et d'ajout de nouveau matiere
    Route::post('/', 'newInsert')->name('newInsert.reception');
    Route::post('/achat/validation', 'saveReception')->name('newInsert.validate');
    Route::post('/achat/insertion', 'insertMatiere')->name('newInsert.insert');

    // Routes de la section inventaire
    Route::get('/inventaire/Liste des matiere', 'showInventaire')->name('inventaire.show');
    Route::get('/inventaire/Liste des matiere/{id}', 'detailMatiere')->name('inventaire.detail');
    Route::get('/inventaire/Journal', 'showJournal')->name('inventaire.journal');
    Route::get('/inventaire/Grand-Livre', 'showLivre')->name('inventaire.grandlivre');
    Route::get('/inventaire/En-attente', 'showAttente')->name('inventaire.attente');

    // Routes de la section financier
    Route::get("/Etat financier/Table d'ammortissement", 'displayAmmortissement')->name('displayAmmortissement');
});

Route::controller(DetenteurController::class)->group(function () {
    // Routes de la section detenteur
    Route::get('/detenteur/Liste des detenteurs', 'displayOwner')->name('owner.show');
    Route::get('/detenteur/Liste des detenteurs/{id}', 'detailOwner')->name('owner.detail');
});