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
        Schema::create('ficheDetenteur', function (Blueprint $table) {
            $table->smallInteger("idEmployee");
            $table->smallInteger("idSousMatiere");
            $table->smallInteger("idFicheDetenteur")->unique();
            $table->smallInteger("quantite");
            $table->primary(['idEmployee', "idSousMatiere"]);
            $table->foreign("idEmployee")->references("idEmployee")->on("employee");
            $table->foreign("idSousMatiere")->references("idSousMatiere")->on("sousmatiere");
            $table->timestamps();
        });
        DB::statement("alter table fichedetenteur change idFicheDetenteur idFicheDetenteur smallint(7) not null auto_increment ");
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ficheDetenteur');
    }
};