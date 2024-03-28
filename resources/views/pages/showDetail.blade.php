@extends('layout.main')

@section('content')

<section class="show-detail">
    <nav>
        <div class="breadcrumbs">
            <a href="">Inventaire</a>
            <a href="">Listes des matieres</a>
            <a href="">
                <span class="breadcrumbs-active">Matiere n°1</span>
            </a>
        </div>
    </nav>
    <div class="display-content">
        <div class="detail-part">
            <h3>Imprimante 3D Acer Treva maxi, 1990*260 importe d'allemagne</h3>
            <div>
                <p><strong>Nomenclature:</strong> classe <strong>2</strong></p>
                <p><strong>Mode d'acquisition:</strong> titre honnereux</p>
                <p><strong>Date d'acquisition:</strong> 13 Janvier 2021</p>
                <p><strong>Valeurs d'acquisition:</strong> 2 000 000,00 Ar</p>
                <p><strong>Quantite:</strong> 5</p>
                <p><strong>Espece d'unite:</strong> pieces</p>
                <p><strong>Total de l'acquisition:</strong> 10 000 000,00 Ar</p>
                <p><strong>Rubrique:</strong> Materiel informatique</p>
                <p><strong>Taux d'amortissement:</strong> 10%</p>
                <p><strong>Societe d'achat:</strong> Google</p>
                <p><strong>Reference du bon de livraison:</strong> 400 411</p>
                <p><strong>Numero de facture:</strong> 5002-6250</p>
                <p><strong>Observation:</strong> Il est estime plus chere que prevus car la definition ne le permet pas
                </p>
            </div>
        </div>
        <div class="owner-part">
            <h3>Listes des detenteurs</h3>
            <table>
                <tr>
                    <th>IM</th>
                    <th>Nom et Prenom</th>
                    <th>Direction</th>
                    <th>Nombre de matiere detenus</th>
                    <th>Etat</th>
                </tr>
                <tr>
                    <td>350 251</td>
                    <td><span class="name">Rakotondramanantsoa</span> Sarobidiniaina Nehemia</td>
                    <td>DIGH</td>
                    <td>1 matiere</td>
                    <td>Bon</td>
                </tr>
                <tr>
                    <td>350 251</td>
                    <td><span class="name">Rakotondramanantsoa</span> Sarobidiniaina Nehemia</td>
                    <td>DIGH</td>
                    <td>1 matiere</td>
                    <td>Bon</td>
                </tr>
            </table>
        </div>
    </div>
</section>

@endsection