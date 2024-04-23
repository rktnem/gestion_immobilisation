@extends('layout.guest')

@section('content')

<section class="register-section">
    <div class="app-logo">
        <h2>FTM</h2>
    </div>
    <h2>Creer un compte</h2>
    @if ($errors->any())
    @foreach ($errors->all() as $error)
    <p>{{ $error }}</p>
    @endforeach
    @endif
    <form action={{ route('register') }} method="post">
        @csrf
        <div class="form-register">
            <div class="form-user">
                <div class="form-group">
                    <input type="hidden" name="id_emp" id="id_emp">
                </div>
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
                        @foreach ($departements as $departement)
                        <option value={{ $departement->sigle }}>{{ $departement->sigle }}</option>
                        @endforeach
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

@php
$depart = json_encode($departements);
$employee = json_encode($employees);
@endphp

<script>
    let matricule = document.getElementById('matricule');
    let departs = <?php echo $depart; ?>;
    let employees = <?php echo $employee; ?>;

    matricule.onkeypress = (e) => {
        if(e.key === "Enter") {
            e.preventDefault();
            for(employee of employees) {
                if(employee.matricule === e.target.value) {
                    $('#id_emp').val(employee.idEmployee);
                    $('#name').val(employee.nom);
                    $('#last_name').val(employee.prenom);
                    $('#email').val(employee.email);
                    $('#sigle').val(departs[employee.idDepartement - 1].sigle);                    $('#departement').val(departs[employee.idDepartement - 1].departement);
                    $('#poste').val(employee.poste);     
                }
            }
            // console.log(JSON.parse("{{ $depart }}") 225263)
        }
    }
</script>

@endsection