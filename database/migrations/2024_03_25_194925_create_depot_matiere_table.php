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
        Schema::create('depotMatiere', function (Blueprint $table) {
            $table->smallInteger("idDepotMatiere")->autoIncrement();
            $table->smallInteger("idEmployee")->unique();
            $table->smallInteger("idMatiere");
            $table->foreign("idEmployee")->references("idEmployee")->on("employee");
            $table->foreign("idMatiere")->references("idMatiere")->on("matiere");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('depotMatiere');
    }
};
