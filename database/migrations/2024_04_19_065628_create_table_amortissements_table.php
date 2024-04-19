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
        Schema::create('table_amortissements', function (Blueprint $table) {
            $table->smallInteger("idTableAmortissement")->autoIncrement();
            $table->integer("amortissementAnterieur");
            $table->integer("dotationExercice");
            $table->foreignId("idTauxAmortissement")->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('table_amortissements');
    }
};