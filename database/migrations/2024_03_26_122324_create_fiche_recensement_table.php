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
        Schema::create('ficheRecensements', function (Blueprint $table) {
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
            $table->foreign("idExcedent")->references("idExcedent")->on("excedents");
            $table->foreign("idEtat")->references("idEtat")->on("etats");
            $table->foreign("idSousMatiere")->references("idSousMatiere")->on("sousmatieres");
            $table->foreign("idDeficit")->references("idDeficit")->on("deficits");
            $table->timestamps();
        });
        DB::statement("alter table ficherecensements change idFicheRecensement idFicheRecensement smallint(7) not null auto_increment ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ficheRecensements');
    }
};