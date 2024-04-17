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
            $table->string("specification")->nullable()->default('Aucune specification');
            $table->date("dateAcquisition");
            $table->string("prix", 10);
            $table->integer("prixMinimal")->nullable()->default(0);
            $table->integer("prixMaximal")->nullable()->default(0);
            $table->string("societeAchat", 50);
            $table->string("dossierReference", 4);
            $table->smallInteger("quantite");
            $table->dateTime("dateActualisation");
            $table->date("dateSortie");
            $table->smallInteger("numeroFolio");
            $table->text("observation");
            $table->smallInteger('etape');
            $table->foreignId("idTypeEntree")->constrained()->onDelete('cascade');
            $table->foreignId("idTableAmortissement")->constrained()->onDelete('cascade');
            $table->foreignId("idEspeceUnite")->constrained()->onDelete('cascade');
            $table->foreignId("idCategorie")->constrained()->onDelete('cascade');
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