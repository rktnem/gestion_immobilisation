<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Reception extends Model
{
    use HasFactory;

    protected $fillable = ['referenceDAO', 'objet', 'nombreLot'];

    /**
     * Get all of the matieres for the Reception
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function matieres(): HasMany
    {
        return $this->hasMany(Matiere::class);
    }
}