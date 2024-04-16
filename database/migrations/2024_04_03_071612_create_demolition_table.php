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
        Schema::create('demolition', function (Blueprint $table) {
            $table->smallInteger("idType")->autoIncrement();
            $table->lineString("type", 15);
            $table->date("dateDemolition");
            $table->string("quantite", 50);
            $table->smallInteger("idMatiere")->nullable(FALSE);
            $table->smallInteger("idAgentDemolisseur")->nullable(FALSE);
            $table->foreign("idMatiere")->references("idMatiere")->on("matiere");
            $table->foreign("idAgentDemolisseur")->references("idAgentDemolisseur")->on("agentdemolisseur");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('demolition');
    }
};