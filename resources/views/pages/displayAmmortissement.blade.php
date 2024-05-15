@php
use Carbon\Carbon;
use App\Models\TableAmortissement;
@endphp
@extends('layout.main')

@section('content')

<section class="display-ammortissement">
    <nav>
        <div class="breadcrumbs">
            <a href="">Etat financier</a>
            <a href="">
                <span class="breadcrumbs-active">Table d'ammortissement</span>
            </a>
        </div>
        <div class="searchbar">
            <input type="text" name="" id="" placeholder="Rechercher...">
        </div>
    </nav>
    <div class="display-content">
        @foreach ($tauxAmortissements as $taux)
        <table>
            @php
            $tables = TableAmortissement::where('taux_amortissement_id', $taux->id)->get();
            @endphp
            @if (!$tables->count() < 1) <span class="rubrique">{{ $taux->rubrique }}</span>
                <tr>
                    <th>Designation</th>
                    <th>Date <br>d'acquisition</th>
                    <th>Valeur <br>d'acquisition</th>
                    <th>Taux <br>d'ammortissement</th>
                    <th>Ammortissement <br>anterieur</th>
                    <th>Dotation de <br>l'exercice</th>
                    <th>Totaux des <br>amortissement</th>
                    <th>Valeur nette <br>comptable</th>
                </tr>
                @foreach ($tables as $table)
                <tr>
                    <td class="left">
                        {{ $table->matiere->designation }}, {{ $table->matiere->specification }}
                    </td>
                    <td>{{ Carbon::parse($table->matiere->created_at)->format('d/M/Y') }}</td>
                    <td>{{ Number::format($table->matiere->prix, precision:'2', locale:'de') }} Ar</td>
                    <td>{{ $table->tauxAmortissement->taux }} %</td>
                    <td>{{ $table->amortissementAnterieur }} Ar</td>
                    <td>{{ Number::format($table->dotationExercice, precision:'2', locale:'de') }} Ar</td>
                    <td>{{ Number::format(totalAmortissement($table->amortissementAnterieur, $table->dotationExercice),
                        precision:'2', locale:'de') }} Ar</td>
                    <td>{{ Number::format(netteComptable($table->matiere->prix,
                        totalAmortissement($table->amortissementAnterieur, $table->dotationExercice)), precision:'2',
                        locale:'de') }} Ar</td>
                </tr>
                @endforeach
                <tr>
                    <td class="left">
                        Total <span>" {{ $taux->rubrique }} "</span>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                @endif
        </table>
        @endforeach
    </div>
</section>

@endsection