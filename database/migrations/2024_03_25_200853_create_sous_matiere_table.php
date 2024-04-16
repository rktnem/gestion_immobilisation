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
        Schema::create('sousMatiere', function (Blueprint $table) {
            $table->smallInteger("idSousMatiere")->autoIncrement();
            $table->date("datePriseEnCharge");
            $table->smallInteger("idEtat");
            $table->smallInteger("idMatiere");
            $table->foreign("idEtat")->references("idEtat")->on("etat");
            $table->foreign("idMatiere")->references("idMatiere")->on("matiere");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sousMatiere');
    }
};