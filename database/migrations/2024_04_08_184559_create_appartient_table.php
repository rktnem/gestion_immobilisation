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
        Schema::create('matiereReception', function (Blueprint $table) {
            $table->smallInteger("idMatiere");
            $table->smallInteger("idReception");
            $table->primary(["idMatiere", "idReception"]);
            $table->foreign("idReception")->references("idReception")->on("reception");
            $table->foreign("idMatiere")->references("idMatiere")->on("matiere");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('appartient');
    }
};