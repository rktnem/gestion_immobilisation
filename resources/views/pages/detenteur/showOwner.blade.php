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
            <form action="">
                <table>
                    <tr>
                        <th>#</th>
                        <th>Designation</th>
                        <th>Specification technique</th>
                        <th>Quantité</th>
                        <th>Valeur d'acquisition</th>
                        <th>Etat</th>
                        <th>Fournisseur</th>
                        <th>Date de prise en charge</th>
                    </tr>
                    <tr>
                        <input type="hidden" name="id-1" value="125">
                        <td>125</td>
                        <td>Imprimante Acer</td>
                        <td>450x2 en plastique</td>
                        <td>1</td>
                        <td>{{ formatPrix(2520.04) }} Ar</td>
                        <td>
                            <select name="etat" id="">
                                <option value="Neuf">Neuf</option>
                                <option value="Bon">Bon</option>
                                <option value="Abime">Abimé</option>
                                <option value="Mauvais">Mauvais</option>
                            </select>
                        </td>
                        <td>FTM</td>
                        <td>13 decembre 2014</td>
                    </tr>
                    <tr>
                        <td colspan="3">Total des matieres detenus</td>
                        <td></td>
                        <td>2 506 000,40 Ar</td>
                        <td></td>
                        <td></td>
                        <td>
                            <input type="submit" value="MODIFIER">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</section>

@endsection