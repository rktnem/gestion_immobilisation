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
                <th>Quantite</th>
                <th>Unite</th>
                <th>Prix</th>
                <th>Prix total</th>
                <th>Mode d'acquisition</th>
                <th>Date d'acquisition</th>
            </tr>
            <tr onclick="window.location.href='{{ route('inventaire.detail', ['id' => 1]) }}'">
                <td>
                    Imprimante 3D Acer Treva maxi, 1990*260 importe d'allemagne
                </td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
            </tr>
            <tr onclick="window.location.href='{{ route('inventaire.detail', ['id' => 2]) }}'">
                <td>
                    Imprimante 3D Acer Treva maxi, 1990*260 importe d'allemagne
                </td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
                <td>Test lesy ty eee</td>
            </tr>
        </table>
    </div>
</section>

@endsection