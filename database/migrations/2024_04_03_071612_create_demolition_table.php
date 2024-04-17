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
        Schema::create('demolitions', function (Blueprint $table) {
            $table->smallInteger("idType")->autoIncrement();
            $table->lineString("type", 15);
            $table->date("dateDemolition");
            $table->string("quantite", 50);
            $table->smallInteger("idMatiere")->nullable(FALSE);
            $table->foreign("idMatiere")->references("idMatiere")->on("matieres");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('demolitions');
    }
};