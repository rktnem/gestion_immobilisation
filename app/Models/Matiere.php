<?php

namespace App\Models;

use App\Models\Reception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Matiere extends Model
{
    use HasFactory;

    protected $fillable = [
        'designation',
        'specification',
        'dateAcquisition',
        'prix',
        'prixMinimal',
        'prixMaximal',
        'societeAchat',
        'quantite',
        'dateActualisation',
        'dateSortie',
        'numeroFolio',
        'observation',
        'etape',
        'reception_id',
        'type_entree_id',
        'table_amortissement_id',
        'espece_unite_id',
        'categorie_id',
    ];

    /**
     * Get the reception that owns the Matiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function reception()
    {
        return $this->belongsTo(Reception::class, 'reception_id');
    }
}