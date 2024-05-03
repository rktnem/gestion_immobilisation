<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FicheDetenteur extends Model
{
    use HasFactory;

    protected $fillable = ['employee_id', 'sous_matiere_id'];
}