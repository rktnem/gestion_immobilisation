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
        Schema::create('tauxAmortissements', function (Blueprint $table) {
            $table->smallInteger("idTauxAmortissement")->autoIncrement();
            $table->string("rubrique", 30);
            $table->tinyInteger("taux");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tauxAmortissements');
    }
};