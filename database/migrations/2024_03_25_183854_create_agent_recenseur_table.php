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
        Schema::create('agentRecenseurs', function (Blueprint $table) {
            $table->string("idAgentRecenseur", 50)->primary();
            $table->smallInteger("idEmployee");
            $table->foreign("idEmployee")->references("idEmployee")->on("employee");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('agentRecenseurs');
    }
};