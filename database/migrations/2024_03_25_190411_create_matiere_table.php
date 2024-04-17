<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('matieres', function (Blueprint $table) {
            $table->smallInteger("idMatiere")->autoIncrement();
            $table->string("designation");
            $table->date("dateAcquisition");
            $table->string("prix", 10);
            $table->string("societeAchat", 50);
            $table->string("dossierReference", 4);
            $table->smallInteger("quantite");
            $table->dateTime("dateActualisation");
            $table->date("dateSortie");
            $table->smallInteger("numeroFolio");
            $table->text("observation");
            $table->string("phase");
            $table->smallInteger("idTypeEntree")->unique();
            $table->smallInteger("idTableAmortissement")->unique();
            $table->smallInteger("idPiece");
            $table->smallInteger("idEspeceUnite")->unique();
            $table->smallInteger("idCategorie");
            $table->foreign("idTypeEntree")->references("idTypeEntree")->on("typeentrees");
            $table->foreign("idTableAmortissement")->references("idTableAmortissement")->on("tableamortissements");
            $table->foreign("idEspeceUnite")->references("idEspeceUnite")->on("especeunites");
            $table->foreign("idCategorie")->references("idCategorie")->on("categories");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('matieres');
    }
};