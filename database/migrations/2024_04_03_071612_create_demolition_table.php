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
        Schema::create('demolitions', function (Blueprint $table) {
            $table->id();
            $table->lineString("type", 15);
            $table->date("dateDemolition");
            $table->string("quantite", 50);
            $table->foreignId('matiere_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('demolitions');
    }
};