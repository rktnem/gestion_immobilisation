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
        Schema::create('ficheRecensements', function (Blueprint $table) {
            $table->smallInteger('idFicheRecensement')->autoIncrement();
            $table->date("dateRecensement");
            $table->text("observation");
            $table->string("exercice", 15);
            $table->foreignId("idSousMatiere")->constrained()->onDelete('cascade');
            $table->foreignId("idExcedent")->constrained()->onDelete('cascade');
            $table->foreignId("idDeficit")->constrained()->onDelete('cascade');
            $table->foreignId("idEtat")->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ficheRecensements');
    }
};