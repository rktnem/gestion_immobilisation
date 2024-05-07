@php
use Carbon\Carbon;
use App\Models\Employee;
@endphp
@extends('layout.main')

@section('content')

<section class="show-detail">
    <nav>
        <div class="breadcrumbs">
            <a href={{ route('inventaire.show') }}>Inventaire</a>
            <a href={{ route('inventaire.show') }}>Listes des matieres</a>
            <a href="">
                <span class="breadcrumbs-active">Matiere n°{{ $id }}</span>
            </a>
        </div>
        <div class="searchbar">
            <input type="text" name="" id="" placeholder="Rechercher...">
        </div>
    </nav>
    <div class="display-content">
        <div class="detail-part">
            <div>
                <h3>{{ $matiere->designation }}, {{ $matiere->specification }}</h3>
            </div>
            <div>
                <p><strong>Nomenclature:</strong> classe <strong>{{ $matiere->categorie->id }}</strong></p>
                <p><strong>Mode d'acquisition:</strong> {{ $matiere->typeEntree->typeEntree }}</p>
                <p><strong>Date d'acquisition:</strong> {{ Carbon::parse($matiere->updated_at)->format('d-M-Y') }}</p>
                <p><strong>Valeurs d'acquisition:</strong> {{ Number::format($matiere->prix, precision:'2', locale:'de')
                    }} Ar</p>
                <p><strong>Quantite:</strong> {{ $matiere->quantite }}</p>
                <p><strong>Espece d'unite:</strong> {{ $matiere->especeUnite->typeUnite }}</p>
                <p><strong>Total de l'acquisition:</strong> {{ Number::format(($matiere->prix * $matiere->quantite),
                    precision:'2', locale:'de') }} Ar</p>
                <p><strong>Rubrique:</strong> {{ $matiere->tauxAmortissement->rubrique }}</p>
                <p><strong>Taux d'amortissement:</strong> {{ $matiere->tauxAmortissement->taux }}%</p>
                <p><strong>Societe d'achat:</strong> {{ $matiere->societeAchat }}</p>
                <p><strong>Reference du bon de livraison:</strong> {{ $matiere->bonLivraison }}</p>
                <p><strong>Numero de facture:</strong> {{ $matiere->facture }}</p>
                <p><strong>Observation:</strong> {{ $matiere->observation }}</p>
            </div>
        </div>
        <div class="owner-part">
            <h3>Listes des detenteurs @if ($sous_matieres->count() < 1) <span class="no-result">
                    Aucun resultat
                    </span>@endif
            </h3>
            <table>
                <tr>
                    <th>IM</th>
                    <th>Nom et Prenom</th>
                    <th>Direction</th>
                    <th>Nombre de matiere detenus</th>
                    <th>Etat</th>
                </tr>
                @foreach ($sous_matieres as $sous_matiere)
                <tr>
                    <td>{{ $sous_matiere->employee->matricule }}</td>
                    <td><span class="name">{{ $sous_matiere->employee->nom }}</span> {{ $sous_matiere->employee->prenom
                        }}</td>
                    <td>{{ $sous_matiere->employee->departement->sigle }}</td>
                    <td>{{ $sous_matiere->quantite }} {{ $sous_matiere->matiere->especeUnite->typeUnite }}</td>
                    <td>{{ $sous_matiere->etat->typeEtat }}</td>
                </tr>
                @endforeach
            </table>
        </div>
    </div>
</section>

@endsection