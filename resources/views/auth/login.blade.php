@extends('layout.guest')

@section('content')

<section class="login-section">
    <div class="app-logo">
        <h2>FTM</h2>
    </div>
    <h2>S'authentifier</h2>
    @if ($errors->any())
    @foreach ($errors->all() as $error)
    <p>{{ $error }}</p>
    @endforeach
    @endif
    <form action={{ route('login') }} method="post">
        @csrf
        <div class="form-group">
            <label for="matricule">Matricule</label>
            <input type="text" name="matricule" id="matricule" placeholder="Matricule..." autofocus>
        </div>
        <div class="form-group">
            <label for="pseudo">Pseudo</label>
            <input type="text" name="pseudo" id="pseudo" placeholder="Appelation...">
        </div>
        <div class="form-group">
            <label for="sigle">Departement</label>
            <select name="sigle" id="sigle">
                @foreach ($departements as $departement)
                <option value={{ $departement->sigle }}>{{ $departement->sigle }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label for="password">Mot de passe</label>
            <input type="password" name="password" id="password" placeholder="Mot de passe...">
        </div>
        <div class="form-group">
            <label for="remember_me">
                <input type="checkbox" name="remember" id="remember_me">
                <span>Se souvenir de moi</span>
            </label>
        </div>
        <div class="form-button">
            <button type="submit">Log in</button>
        </div>
    </form>
</section>

@php
$depart = json_encode($departements);
$users = json_encode($users);
@endphp

<script>
    let matricule = document.getElementById('matricule');
    let departs = <?php echo $depart; ?>;
    let users = <?php echo $users; ?>;

    matricule.onkeypress = (e) => {
        if(e.key === "Enter") {
            e.preventDefault();
            for(user of users) {
                if(user.matricule === e.target.value) {
                    $('#pseudo').val(user.pseudo);
                    $('#sigle').val(user.sigle);
                }
            }
            // console.log(JSON.parse("{{ $depart }}") 225263)
        }
    }
</script>

@endsection