<?php

namespace App\Models;

use App\Models\Matiere;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Reception extends Model
{
    use HasFactory;

    protected $fillable = ['referenceDAO', 'objet', 'nombreLot'];
}