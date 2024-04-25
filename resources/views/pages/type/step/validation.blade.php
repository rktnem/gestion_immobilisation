<h3>Validation du PV de reception <span class="info-validation">{{ $matiere->validate }}/3</span></h3>
<form class="validation-list" action={{ route('validate.store') }} method="POST">
    @csrf
    <input type="hidden" name="number" value={{ $number }}>
    <input type="hidden" name="last_insert" value={{ $last_insert }}>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de mr Toby</h4>
            <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
        </div>
        <div>
            <input type="submit" value="VALIDER" {{ (Auth::user()->poste === "") }}>
        </div>
    </div>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de mr Nehemia</h4>
            <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
        </div>
        <div>
            <input type="submit" value="VALIDER">
        </div>
    </div>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de mme Milou</h4>
            <p><strong><u>Objet :</u></strong>{{ $matiere->reception->objet }}</p>
        </div>
        <div>
            <input type="submit" value="VALIDER">
        </div>
    </div>
</form>