<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('ficheRecensement', function (Blueprint $table) {
            $table->string("idAgentRecenseur", 50);
            $table->integer("idExcedent");
            $table->smallInteger("idEtat");
            $table->smallInteger("idSousMatiere");
            $table->integer("idDeficit");
            $table->smallInteger("idFicheRecensement")->unique();
            $table->date("dateRecensement");
            $table->text("observation");
            $table->string("exercice", 15);
            $table->primary(["idAgentRecenseur", "idExcedent", "idEtat", "idSousMatiere", "idDeficit"]);
            $table->foreign("idAgentRecenseur")->references("idAgentRecenseur")->on("agentRecenseur");
            $table->foreign("idExcedent")->references("idExcedent")->on("excedent");
            $table->foreign("idEtat")->references("idEtat")->on("etat");
            $table->foreign("idSousMatiere")->references("idSousMatiere")->on("sousmatiere");
            $table->foreign("idDeficit")->references("idDeficit")->on("deficit");
        });
        DB::statement("alter table ficherecensement change idFicheRecensement idFicheRecensement smallint(7) not null auto_increment ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ficheRecensement');
    }
};
