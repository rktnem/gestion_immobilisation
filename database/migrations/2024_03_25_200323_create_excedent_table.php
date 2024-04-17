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
        Schema::create('excedents', function (Blueprint $table) {
            $table->integer("idExcedent")->autoIncrement();
            $table->integer("quantite");
            $table->smallInteger("idMatiere");
            $table->foreign("idMatiere")->references("idMatiere")->on("matieres");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('excedents');
    }
};