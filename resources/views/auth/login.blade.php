@extends('layout.guest')

@section('content')

<section class="login-section">
    <div class="app-logo">
        <h2>FTM</h2>
    </div>
    <h2>S'authentifier</h2>
    <form action={{ route('login') }} method="post">
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
                <option value="DG">DG</option>
                <option value="DAF">DAF</option>
                <option value="DIGH">DIGH</option>
                <option value="DMOSP">DMOSP</option>
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

@endsection