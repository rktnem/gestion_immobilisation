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
        Schema::create('ficheDetenteurs', function (Blueprint $table) {
            $table->smallInteger('idFicheDetenteur')->autoIncrement();
            $table->smallInteger("quantite");
            $table->foreignId("idEmployee")->constrained()->onDelete('cascade');
            $table->foreignId("idSousMatiere")->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ficheDetenteurs');
    }
};