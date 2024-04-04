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
        Schema::table("matiere", function (Blueprint $table) {
            $table->smallInteger("idDossierReference");
            $table->foreign("idDossierReference")->references("idDossierReference")->on("dossierreference");
            // Ajout colonne etape
            $table->integer("etape");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table("matiere", function (Blueprint $table) {
            $table->dropForeign("matiere_iddossierreference_foreign");
        });
    }
};
