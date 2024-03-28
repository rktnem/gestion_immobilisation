@vite('resources/css/pages/type.css')

<section class="achat-section">
    <div class="display-content">
        <ul class="step-part">
            <li class="step-item current-item">
                <span class="count">1</span>
                <span class="label">PV de réception</span>
            </li>
            <li class="step-item">
                <span class="count">2</span>
                <span class="label">Validation</span>
            </li>
            <li class="step-item">
                <span class="count">3</span>
                <span class="label">Insertion</span>
            </li>
        </ul>
        <div class="save-part">
            <h3>Renseigner le pv de reception</h3>
            <form action="">
                @csrf
                <div class="form">
                    <div class="form-general">
                        <div class="form-group">
                            <label for="ref">Réference du DAO</label>
                            <input type="text" name="ref" id="" style="max-width: 100px;" placeholder="Réference...">
                        </div>
                        <div class="form-group">
                            <label for="objet">Objet</label>
                            <input type="text" name="objet" id="" style="min-width: 300px;"
                                placeholder="Titre de l'objet...">
                        </div>
                        <div class="form-group">
                            <label for="number">Nombre de lot</label>
                            <input type="number" name="number" id="number" style="max-width: 100px;"
                                placeholder="Nombre de lot...">
                        </div>
                    </div>
                    <div class="form-lot" id="form-lot">
                        <h4>Désignation des lots</h4>
                    </div>
                </div>
                <div class="form-button">
                    <input type="submit" value="VALIDER">
                </div>
            </form>
        </div>
</section>