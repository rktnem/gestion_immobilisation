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
        Schema::create('dossierReference', function (Blueprint $table) {
            $table->smallInteger("idDossierReference")->autoIncrement();
            $table->string("DAO")->nullable(TRUE);
            $table->string("PVR")->nullable(FALSE);
            $table->string("paiement")->nullable(TRUE);
            $table->string("OE")->nullable(FALSE);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dossierReference');
    }
};
