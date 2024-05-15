<?php

namespace App\Models;

use App\Models\Matiere;
use App\Models\TauxAmortissement;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class TableAmortissement extends Model
{
    use HasFactory;

    protected $fillable = ['amortissementAnterieur', 'dotationExercice', 'matiere_id', 'taux_amortissement_id'];

    /**
     * Get the matiere that owns the TableAmortissement
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function matiere()
    {
        return $this->belongsTo(Matiere::class);
    }

    /**
     * Get the tauxAmortissement that owns the TableAmortissement
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tauxAmortissement()
    {
        return $this->belongsTo(TauxAmortissement::class);
    }
}