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
        Schema::create('reception', function (Blueprint $table) {
            $table->smallInteger("idReception")->autoIncrement();
            $table->string("titreArticle", 50);
            $table->string("detail", 50);
            $table->smallInteger("idPiece")->nullable(FALSE)->unique();
            $table->foreign("idPiece")->references("idPiece")->on("piecejustificative");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reception');
    }
};
