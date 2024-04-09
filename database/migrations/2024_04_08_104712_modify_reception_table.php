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
        Schema::table("reception", function (Blueprint $table) {
            $table->dropForeign("reception_idpiece_foreign");
            $table->dropUnique(['idPiece']);
            $table->dropColumn("idPiece");
            $table->dropColumn("titreArticle");
            $table->dropColumn("detail");
            $table->string("referenceDAO", 30);
            $table->string("objet", 150);
            $table->smallInteger("nombreLot");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table("reception", function (Blueprint $table) {
            $table->dropColumn("nombreLot");
            $table->dropColumn("objet");
            $table->dropColumn("referenceDAO");
            $table->string("detail", 50);
            $table->string("titreArticle", 50);
            $table->smallInteger("idPiece")->nullable(FALSE)->unique();
            $table->foreign("idPiece")->references("idPiece")->on("piecejustificative");
        });
    }
};
