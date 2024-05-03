<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SousMatiere extends Model
{
    use HasFactory;

    protected $fillable = ['quantite', 'etat_id', 'matiere_id'];
}