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
        Schema::create('tableAmortissement', function (Blueprint $table) {
            $table->smallInteger("idTableAmortissement")->autoIncrement();
            $table->integer("amortissementAnterieur");
            $table->integer("dotationExercice");
            $table->smallInteger("idTauxAmortissement");
            $table->foreign("idTauxAmortissement")->references("idTauxAmortissement")->on("tauxamortissement");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tableAmortissement');
    }
};