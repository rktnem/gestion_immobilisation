<h3>Validation du PV de reception</h3>
<form class="validation-list" action={{ route('newInsert.insert') }} method="GET">
    @csrf
    <input type="hidden" name="typeEntree" value={{ $type }}>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de mr Toby</h4>
            <p><strong><u>Objet :</u></strong> Acquisition et livraison de materiel informatique repartit en 3 lots</p>
        </div>
        <div>
            <input type="submit" value="VALIDER">
        </div>
    </div>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de mr Nehemia</h4>
            <p><strong><u>Objet :</u></strong> Acquisition et livraison de materiel informatique repartit en 3 lots</p>
        </div>
        <div>
            <input type="submit" value="VALIDER">
        </div>
    </div>
    <div class="validation-item">
        <div>
            <h4>En attente de validation de mme Milou</h4>
            <p><strong><u>Objet :</u></strong> Acquisition et livraison de materiel informatique repartit en 3 lots</p>
        </div>
        <div>
            <input type="submit" value="VALIDER">
        </div>
    </div>
</form>