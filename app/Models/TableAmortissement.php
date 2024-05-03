<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TableAmortissement extends Model
{
    use HasFactory;

    protected $fillable = ['amortissementAnterieur', 'dotationExercice', 'matiere_id', 'taux_amortissement_id'];
}