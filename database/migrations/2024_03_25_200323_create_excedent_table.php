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
        Schema::create('excedent', function (Blueprint $table) {
            $table->integer("idExcedent")->autoIncrement();
            $table->integer("quantite");
            $table->smallInteger("idMatiere");
            $table->foreign("idMatiere")->references("idMatiere")->on("matiere");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('excedent');
    }
};
