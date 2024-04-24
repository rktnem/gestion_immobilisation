<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('fiche_recensements', function (Blueprint $table) {
            $table->id();
            $table->date("dateRecensement");
            $table->text("observation");
            $table->string("exercice", 15);
            $table->foreignId("sous_matiere_id")->constrained()->onDelete('cascade');
            $table->foreignId("excedent_id")->constrained()->onDelete('cascade');
            $table->foreignId("deficit_id")->constrained()->onDelete('cascade');
            $table->foreignId("etat_id")->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('fiche_recensements');
    }
};