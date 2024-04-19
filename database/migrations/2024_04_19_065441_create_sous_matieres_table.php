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
        Schema::create('sous_matieres', function (Blueprint $table) {
            $table->smallInteger("idSousMatiere")->autoIncrement();
            $table->date("datePriseEnCharge");
            $table->foreignId("idEtat")->constrained()->onDelete('cascade');
            $table->foreignId("idMatiere")->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sous_matieres');
    }
};