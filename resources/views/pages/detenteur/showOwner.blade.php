@extends('layout.main')

@section('content')

<section class="owner-section">
    <nav>
        <div class="breadcrumbs">
            <a href={{ route('owner.show') }}>Détenteurs</a>
            <a href={{ route('owner.show') }}>Listes des detenteurs</a>
            <a href="">
                <span class="breadcrumbs-active">Fiche de detenteur</span>
            </a>
        </div>
        <div class="searchbar">
            <input type="text" name="" id="" placeholder="Rechercher...">
        </div>
    </nav>
    <div class="owner-show">
        <div>
            <p><strong>Nom et prenom: </strong><span class="name">Rakotondramanantsoa </span>Sarobidiniaina Nehemia</p>
            <p><strong>Fonction: </strong>Directeur de cabinet</p>
        </div>
        <div>
            <table>
                <tr>
                    <th>#</th>
                    <th>Designation</th>
                    <th>Quantité</th>
                    <th>Valeur d'acquisition</th>
                    <th>Etat</th>
                    <th>Fournisseur</th>
                    <th>Date de prise en charge</th>
                </tr>
                <tr>
                    <td>125</td>
                    <td>Imprimante Acer 450*2</td>
                    <td>1</td>
                    <td>{{ resultFormat(2520.04) }} Ar</td>
                    <td>Bon</td>
                    <td>FTM</td>
                    <td>13 decembre 2014</td>
                </tr>
                <tr>
                    <td colspan="3">Total des matieres detenus</td>
                    <td>2 506 000,40 Ar</td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
</section>

@endsection