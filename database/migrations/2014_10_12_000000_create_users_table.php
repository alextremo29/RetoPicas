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
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('email', 255)->unique();
            $table->string('nombre', 255);
            $table->string('apellido', 255);
            $table->date('fecha')->nullable();
            $table->timestamps();
        });

        // Establecer el motor de almacenamiento InnoDB y el conjunto de caracteres latin1
        DB::statement('ALTER TABLE users ENGINE = InnoDB');
        DB::statement('ALTER TABLE users CONVERT TO CHARACTER SET latin1 COLLATE latin1_general_ci');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
