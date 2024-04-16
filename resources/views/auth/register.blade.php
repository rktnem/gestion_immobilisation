@extends('layout.guest')

@section('content')

<section class="register-section">
    <div class="app-logo">
        <h2>FTM</h2>
    </div>
    <h2>Creer un compte</h2>
    <form action={{ route('login') }} method="post">
        <div class="form-register">
            <div class="form-user">
                <div class="form-group">
                    <label for="name">Nom</label>
                    <input type="text" name="name" id="name" placeholder="Nom...">
                </div>
                <div class="form-group">
                    <label for="last_name">Prenom</label>
                    <input type="text" name="last_name" id="last_name" placeholder="Prenom...">
                </div>
                <div class="form-group">
                    <label for="pseudo">Pseudo</label>
                    <input type="text" name="pseudo" id="pseudo" placeholder="Appelation...">
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" placeholder="Email@gmail.com...">
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <input type="password" name="password" id="password" placeholder="Mot de passe...">
                </div>
            </div>
            <div class="form-employee">
                <div class="form-group">
                    <label for="matricule">Matricule</label>
                    <input type="text" name="matricule" id="matricule" placeholder="Matricule..." autofocus>
                </div>
                <div class="form-group">
                    <label for="sigle">Sigle du departement</label>
                    <select name="sigle" id="sigle">
                        <option value="DG">DG</option>
                        <option value="DAF">DAF</option>
                        <option value="DIGH">DIGH</option>
                        <option value="DMOSP">DMOSP</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="departement">Departement</label>
                    <input type="text" name="departement" id="departement" placeholder="Departement..." disabled>
                </div>
                <div class="form-group">
                    <label for="poste">Poste occupé</label>
                    <input type="text" name="poste" id="poste" placeholder="Poste occupé...">
                </div>
            </div>
        </div>
        <div class="form-button">
            <button type="submit">creer</button>
        </div>
    </form>
</section>

@endsection