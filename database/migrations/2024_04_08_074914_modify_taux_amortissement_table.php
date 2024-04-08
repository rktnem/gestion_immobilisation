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
        Schema::table("tauxamortissement", function (Blueprint $table) {
            $table->string("rubrique", 200)->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $table->string("rubrique", 30)->change();
    }
};
