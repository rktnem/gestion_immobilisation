@php
use Illuminate\Support\Carbon;
@endphp
<h3>Validation du PV de reception <span class="info-validation">{{ $matiere->validate }}/3</span></h3>
<form class="validation-list" action={{ route('validate.store') }} method="POST">
    @csrf
    <input type="hidden" name="number" value={{ $number }}>
    <input type="hidden" name="last_insert" value={{ $last_insert }}>

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
</form>