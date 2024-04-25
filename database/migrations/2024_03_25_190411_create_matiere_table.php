<?php

use Carbon\Carbon;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('matieres', function (Blueprint $table) {
            $table->id();
            $table->string("designation");
            $table->string("specification")->nullable()->default('Aucune specification');
            $table->date("dateAcquisition");
            $table->string("prix", 10);
            $table->integer("prixMinimal")->nullable()->default(0);
            $table->integer("prixMaximal")->nullable()->default(0);
            $table->string("societeAchat", 50);
            $table->smallInteger("quantite");
            $table->dateTime("dateActualisation");
            $table->date("dateSortie");
            $table->smallInteger("numeroFolio");
            $table->string("facture");
            $table->string("bonLivraison");
            $table->text("observation");
            $table->smallInteger('etape');
            $table->smallInteger('validate')->default(0);
            $table->foreignId("reception_id")->constrained()->onDelete("cascade");
            $table->foreignId("type_entree_id")->constrained()->onDelete('cascade');
            $table->foreignId("taux_amortissement_id")->constrained()->onDelete('cascade');
            $table->foreignId("table_amortissement_id")->constrained()->onDelete('cascade');
            $table->foreignId("espece_unite_id")->constrained()->onDelete('cascade');
            $table->foreignId("categorie_id")->constrained()->onDelete('cascade');
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