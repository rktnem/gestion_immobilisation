@php
use Carbon\Carbon;
use Illuminate\Support\Number;
@endphp

@extends('layout.main')

@section('content')

<section class="display-immobilisation">
    <nav>
        <div class="breadcrumbs">
            <a href="">Inventaire</a>
            <a href="">
                <span class="breadcrumbs-active">Liste des matieres</span>
            </a>
        </div>
        <div class="search-bar">
            <input type="text" name="" id="" placeholder="Rechercher...">
        </div>
    </nav>
    <div class="display-content">
        <table>
            <tr>
                <th>Designation</th>
                <th>Specification technique</th>
                <th>Quantite</th>
                <th>Unite</th>
                <th>Prix</th>
                <th>Prix total</th>
                <th>Mode d'acquisition</th>
                <th>Date d'acquisition</th>
            </tr>
            @foreach ($matieres as $matiere)
            <tr>
                <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => $matiere->id]) }}'">
                    {{ $matiere->designation }}
                </td>
                <td>{{ $matiere->specification }}</td>
                <td>{{ $matiere->quantite }}</td>
                <td>{{ $matiere->especeUnite->typeUnite }}</td>
                <td>{{ Number::format($matiere->prix, precision:'2', locale:'de') }} Ar</td>
                <td>{{ Number::format(($matiere->prix * $matiere->quantite), precision:'2', locale:'de') }} Ar</td>
                <td>{{ $matiere->typeEntree->typeEntree }}</td>
                <td>{{ Carbon::parse($matiere->create_at)->format('d-M-Y') }}</td>
            </tr>
            @endforeach
        </table>
    </div>
</section>

@endsection