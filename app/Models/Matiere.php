<?php

namespace App\Models;

use App\Models\Categorie;
use App\Models\Reception;
use App\Models\TypeEntree;
use App\Models\EspeceUnite;
use App\Models\TauxAmortissement;
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
        'facture',
        'bonLivraison',
        'observation',
        'etape',
        'reception_id',
        'type_entree_id',
        'taux_amortissement_id',
        'table_amortissement_id',
        'espece_unite_id',
        'categorie_id',
    ];

    /**
     * Get the typeEntree that owns the Matiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function typeEntree()
    {
        return $this->belongsTo(TypeEntree::class);
    }

    /**
     * Get the especeUnite that owns the Matiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function especeUnite()
    {
        return $this->belongsTo(EspeceUnite::class);
    }

    /**
     * Get the categorie that owns the Matiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function categorie()
    {
        return $this->belongsTo(Categorie::class);
    }

    /**
     * Get the tauxAmortissement that owns the Matiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function tauxAmortissement()
    {
        return $this->belongsTo(TauxAmortissement::class);
    }

    /**
     * Get the reception that owns the Matiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function reception()
    {
        return $this->belongsTo(Reception::class);
    }
}