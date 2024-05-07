<?php

namespace App\Models;

use App\Models\Etat;
use App\Models\Matiere;
use App\Models\Employee;
use App\Models\Departement;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class SousMatiere extends Model
{
    use HasFactory;

    protected $fillable = ['quantite', 'etat_id', 'matiere_id', 'employee_id'];

    /**
     * Get the matiere associated with the SousMatiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function matiere()
    {
        return $this->belongsTo(Matiere::class);
    }

    /**
     * Get the employee that owns the SousMatiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public function employeeDepartement() 
    {
        return $this->hasOneThrough(Departement::class, Employee::class);
    }

    /**
     * Get the etat that owns the SousMatiere
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function etat()
    {
        return $this->belongsTo(Etat::class);
    }
}