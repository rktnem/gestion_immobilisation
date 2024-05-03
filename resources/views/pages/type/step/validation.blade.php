@php
	use Illuminate\Support\Carbon;
	$user = Auth::user();
	$arr_validate = str_split($matiere->validate);
	$len = count($arr_validate);
@endphp
<h3>Validation du PV de reception <span class="info-validation">{{ $matiere->validate }}/3</span></h3>
<form class="validation-list" action={{ route('validate.store') }} method="POST">
    @csrf
    <input type="hidden" name="number" value={{ $number }}>
    <input type="hidden" name="last_insert" value={{ $last_insert }}>
<!-- ETO NY AN'I NEHEMIA -->

    <div class="validation-item">
        <div>
            <h4>En attente de validation de {{ ($prmp->genre === 'Female') ? 'Mme' : 'Mr' }} {{ $prmp->prenom }}</h4>
            <p><strong><u>Objet :</u></strong> {{ $matiere->reception->objet }}</p>
            <p><strong><u>Declaré le :</u></strong> {{ Carbon::parse($matiere->reception->created_at)->format('d M. Y à
                H:i') }}</p>
        </div>
        <div>
            <input type="submit" value="VALIDER" {{ (Auth::user()->poste === $prmp->poste) ? '' : 'disabled'}}>
        </div>
    </div>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de {{ ($gac->genre === 'Female') ? 'Mme' : 'Mr' }} {{ $gac->prenom }}</h4>
            <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
            <p><strong><u>Declaré le :</u></strong> {{ Carbon::parse($matiere->reception->created_at)->format('d M. Y à
                H:i') }}</p>
        </div>
        <div>
            <input type="submit" value="VALIDER" {{ (Auth::user()->poste === $gac->poste) ? 'disabled' : ''}}>
        </div>
    </div>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de {{ ($dcm->genre === 'Female') ? 'Mme' : 'Mr' }} {{ $dcm->prenom }}</h4>
            <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
            <p><strong><u>Declaré le :</u></strong> {{ Carbon::parse($matiere->reception->created_at)->format('d M. Y à
                H:i') }}</p>
        </div>
        <div>
            <input type="submit" value="VALIDER" {{ (Auth::user()->poste === $dcm->poste) ? '' :
            'disabled'}}>
        </div>
    </div>
<!-- ETO NY FARANY @ AN'I NEHEMIA -->
<!-- ETO NY AN'I AROTOBY -->
	@if ($user->poste === "Depositaire comptable" && $arr_validate[$len - 1] !== '1')
		<div class="validation-item">
            <div>
                <h4>En attente de votre validation. {{ (Auth::user()->employee->genre === 'Male') ? 'Mr' : 'Mme' }} {{ Auth::user()->name }} {{ Auth::user()->last_name }} ({{ Auth::user()->poste }})</h4>
                <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
            </div>
            <div>
            	<input type="hidden" name="validate" value="1">
                <input type="submit" value="VALIDER" >
            </div>
        </div>
	@elseif ($user->poste === "Personne responsables des marchés publiques" && ($len < 2 || $arr_validate[$len - 2] !== '1'))
		<div class="validation-item">
            <div>
                <h4>En attente de votre validation. {{ (Auth::user()->employee->genre === 'Male') ? 'Mr' : 'Mme' }} {{ Auth::user()->name }} {{ Auth::user()->last_name }} ({{ Auth::user()->poste }})</h4>
                <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
            </div>
            <div>
            	<input type="hidden" name="validate" value="10">
                <input type="submit" value="VALIDER" >
            </div>
        </div>
	@elseif ($user->poste === "Directeur générale" && ($len < 3 || $arr_validate[$len - 3] !== '1'))
		<div class="validation-item">
            <div>
                <h4>En attente de votre validation. {{ (Auth::user()->employee->genre === 'Male') ? 'Mr' : 'Mme' }} {{ Auth::user()->name }} {{ Auth::user()->last_name }} ({{ Auth::user()->poste }})</h4>
                <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
            </div>
            <div>
            	<input type="hidden" name="validate" value="100">
                <input type="submit" value="VALIDER" >
            </div>
        </div>
	@elseif ($user->poste === "Agent de l'UGPM" && ($len < 4 || $arr_validate[$len - 4] !== '1'))
		<div class="validation-item">
            <div>
                <h4>En attente de votre validation. {{ (Auth::user()->employee->genre === 'Male') ? 'Mr' : 'Mme' }} {{ Auth::user()->name }} {{ Auth::user()->last_name }} ({{ Auth::user()->poste }})</h4>
                <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
            </div>
            <div>
            	<input type="hidden" name="validate" value="1000">
                <input type="submit" value="VALIDER" >
            </div>
        </div>
	@else
		<div class="validation-item">
            <div>
                <h4>Pas de validation</h4>
                <p>Aucune validation à effectuer</p>
            </div>
        </div>
	@endif
<!-- ETO NY FARANY @ AN'I AROTOBY -->
</form>