<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MatiereController;
use App\Http\Controllers\DetenteurController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware(['auth'])->group(function () {
    Route::controller(HomeController::class)->group(function () {
        Route::get('/', 'index')->name('home');
    });
    
    Route::controller(MatiereController::class)->group(function () {
        // Cette portion est le route de l'accueil et d'ajout de nouveau matiere
        Route::get('/reception', 'createReception')->name('reception.create')->middleware('is.person.public');
        Route::post('/reception', 'storeReception')->name('reception.store')->middleware('is.person.public');

        Route::get('/achat/validation', 'showValidate')->name('validate.show')->middleware("role:Depositaire comptable;Personne responsables des marchés publiques;Directeur générale;Agent de l'UGPM");
        Route::post('/achat/validation', 'storeValidate')->name('validate.store')->middleware("role:Depositaire comptable;Personne responsables des marchés publiques;Directeur générale;Agent de l'UGPM");

        Route::get('/achat/insertion', 'createMatiere')->name('matiere.create')->middleware('is.depositaire.comptable');
        Route::post('/achat/insertion', 'storeMatiere')->name('matiere.store')->middleware('is.depositaire.comptable');
        
        // Routes de la section inventaire
        Route::middleware("role:Depositaire comptable;Personne responsables des marchés publiques;Directeur générale;Agent de l'UGPM")->group(function () {
            Route::get('/inventaire/liste des matiere', 'showInventaire')->name('inventaire.show');
            Route::get('/inventaire/liste des matiere/{id}', 'detailMatiere')->name('inventaire.detail');
            Route::get('/inventaire/journal', 'showJournal')->name('inventaire.journal');
            Route::get('/inventaire/grand-Livre', 'showLivre')->name('inventaire.grandlivre');
            Route::get('/inventaire/en-attente', 'showWaiting')->name('inventaire.wait');
        });
        
        // Routes de la section financier
        Route::get("/Etat financier/Table d'ammortissement", 'displayAmmortissement')->name('displayAmmortissement')->middleware('is.finance');
        
        // Routes de la section rapport
        Route::get('/rapport/recensement', 'makeRecensement')->name('rapport.recensement');
        Route::get('/rapport/demolition', 'makeDemolition')->name('rapport.demolition');
    });
    
    Route::controller(DetenteurController::class)->group(function () {
        // Routes de la section detenteur
        Route::middleware('is.depositaire.comptable')->group(function () {
            Route::get('/detenteur/Liste des detenteurs', 'displayOwner')->name('owner.show');
            Route::get('/detenteur/Liste des detenteurs/{id}', 'detailOwner')->name('owner.detail');
        });
    });
});

require __DIR__.'/auth.php';