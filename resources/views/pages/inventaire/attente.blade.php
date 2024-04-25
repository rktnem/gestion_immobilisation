@php
use Carbon\Carbon;
@endphp
@extends('layout.main')

@section('content')

<section class="attente-section">
    <nav>
        <div class="breadcrumbs">
            <a href={{ route('inventaire.show') }}>Inventaire</a>
            <a href="">
                <span class="breadcrumbs-active">En attente</span>
            </a>
        </div>
        <div class="searchbar">
            <input type="text" name="" id="" placeholder="Rechercher...">
        </div>
    </nav>
    <div class="display-content">
        <div class="first-step step">
            <h4>Validation du pv de reception</h4>
            @foreach ($matieres_first as $first)
            <div class="waiting-content">
                <a class="waiting-box" href={{ route('validate.show', ['last_insert'=> $first->id]) }}>
                    <p><strong>Designation:</strong> {{ $first->designation }} - {{$first->specification}}</p>
                    <p><strong>Convention N°:</strong> {{ $first->reception->referenceDAO }}</p>
                    <p><strong>Objet:</strong> {{ $first->reception->objet }} </p>
                    <p><strong>Declaré le:</strong> {{ Carbon::parse($first->reception->created_at)->format('d M. Y') }}
                    </p>
                </a>
            </div>
            @endforeach
            @if ($matieres_first->count() < 1) <p>Aucun resultat</p> @endif
        </div>
        <div class="second-step step">
            <h4>Insertion des matieres</h4>
            @foreach ($matieres_second as $second)
            <div class="waiting-content">
                <a class="waiting-box" href={{ route('validate.show', ['last_insert'=> $second->id]) }}>
                    <p><strong>Designation:</strong> {{ $second->designation }}</p>
                    <p><strong>Convention N°:</strong> {{ $second->reception->objet }}</p>
                    <p><strong>Objet:</strong> Acquisition et reception de materiel informatique repartit
                        en deux lot
                    </p>
                    <p><strong>Declaré le:</strong> {{ Carbon::parse($first->reception->created_at)->format('d M. Y') }}
                    </p>
                </a>
            </div>
            @endforeach
            @if ($matieres_second->count() < 1) <p>Aucun resultat</p> @endif
        </div>

    </div>
</section>

@endsection