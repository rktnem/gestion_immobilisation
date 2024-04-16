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
        <form action="">
            <div class="check-demolition">
                <input type="submit" value="A Demolir">
            </div>
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
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
                <tr>
                    <td onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                        Imprimante 3D Acer Treva maxi
                    </td>
                    <td>1990*260 importe d'allemagne</td>
                    <td>3</td>
                    <td>piece</td>
                    <td>{{ formatPrix(1250000,50) }} Ar</td>
                    <td>{{ formatPrix(7500015,00) }} Ar</td>
                    <td>Titre honnereux</td>
                    <td>13 decembre 2024</td>
                </tr>
            </table>
        </form>
    </div>
</section>

@endsection