@extends('layout.main')

@section('content')

<section class="inventaire-attente">
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

    </div>
</section>

@endsection