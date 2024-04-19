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
        Schema::create('employees', function (Blueprint $table) {
            $table->smallInteger("idEmployee")->autoIncrement();
            $table->string("matricule", 7)->unique();
            $table->string('nom', 150);
            $table->string('prenom', 250);
            $table->string('email')->unique();
            $table->string('genre', 10);
            $table->string('poste', 150);
            $table->foreignId("idDepartement")->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('employees');
    }
};