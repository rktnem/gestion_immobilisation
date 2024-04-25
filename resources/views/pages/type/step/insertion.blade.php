<form action={{ route('matiere.store') }} method="POST" class="insertion-part">
    @csrf
    <div class="detail-matiere">
        <h3>Lot n°1: Ordinateur portable</h3>
        <input type="hidden" name="number" value={{ $number }}>
        <div class="matiere-form">
            <div class="form-group">
                <label for="name">Designation de la matiere</label>
                <input type="text" name="name" id="name" placeholder="Designation de la matière..."
                    style="min-width: 400px">
            </div>
            <div class="form-group">
                <label for="price">Prix de l'unité</label>
                <input type="text" name="price" id="price" placeholder="Prix de l'unité... (Ar)"
                    style="min-width: 200px">
            </div>
            <div class="form-group">
                <label for="quantite-global">Quantité</label>
                <input type="number" name="quantite-global" id="quantite-global" placeholder="Quantité..."
                    style="width: 75px">
            </div>
            <div class="form-group">
                <label for="unite">Espèce unité</label>
                <select name="unite" id="unite">
                    @foreach ($unites as $unite)
                    <option value={{ $unite->idEspeceUnite }}>{{ $unite->typeUnite }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="nomenclature">Nomenclature</label>
                <select name="nomenclature" id="nomenclature">
                    @foreach ($classes as $classe)
                    <option value={{ $classe->idCategorie }} {{ ($classe->classe === 'classe 2' ? 'selected' : '') }}
                        >{{ $classe->classe }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="">Mode d'acquisition</label>
                <select name="typeEntree" id="typeEntree">
                    @foreach ($types as $type)
                    <option value={{ $type->idTypeEntree }}>{{ $type->typeEntree }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="rubrique">Rubrique</label>
                <select name="rubrique" id="rubrique">
                    @foreach ($amortissements as $amortissement)
                    <option value='{{ $amortissement->idTauxAmortissement }}''>{{ $amortissement->rubrique }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="bon-livraison">Référence du bon de livraison</label>
                <input type="text" name="bon-livraison" id="bon-livraison"
                    placeholder="Référence du bon de livraison..." style="width: 100px">
            </div>
            <div class="form-group">
                <label for="facture">Numero de facture</label>
                <input type="text" name="facture" id="facture" placeholder="Numero de facture..." style="width: 100px">
            </div>
            <div class="form-group">
                <label for="fournisseur">Societe fournisseur</label>
                <input type="text" name="fournisseur" id="fournisseur" placeholder="Societe fournisseur..."
                    style="min-width: 200px">
            </div>
            <div class="form-group">
                <label for="taux">Taux d' ammortissement</label>
                        <input type="text" name="taux" id="taux" placeholder="Taux d'ammortissement... (en %/an)"
                            style="width: 75px">
            </div>
            <div class="form-group">
                <label for="observation">Observation</label>
                <textarea name="observation" id="observation" cols="30" rows="5"
                    placeholder="Observation..."></textarea>
            </div>
        </div>
    </div>
    <div class="detail-detenteur">
        <h3>Détenteur effectif</h3>
        <div class="detenteur-form">
            <button>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30">
                    <path
                        d="M14.970703 2.9726562 A 2.0002 2.0002 0 0 0 13 5L13 13L5 13 A 2.0002 2.0002 0 1 0 5 17L13 17L13 25 A 2.0002 2.0002 0 1 0 17 25L17 17L25 17 A 2.0002 2.0002 0 1 0 25 13L17 13L17 5 A 2.0002 2.0002 0 0 0 14.970703 2.9726562 z"
                        fill="#FFFFFF" />
                </svg>
            </button>
            <div class="detenteur-legend">
                <h4>IM</h4>
                <h4>Nom et prénom</h4>
                <h4>Quantité</h4>
                <h4>Etat</h4>
            </div>
            <div class="detenteur-input">
                <input type="text" name="matricule-1" id="" required>
                <input type="text" name="nom-detenteur-1" id="" required>
                <input type="text" name="quantite-1" id="" required>
                <input type="text" name="etat-1" id="" required>
            </div>
        </div>
    </div>
    <div>
        <input type="submit" value="ENREGISTRER">
    </div>
</form>

@php
$taux = json_encode($amortissements);
@endphp

<script>
    // Auto remplir les champs associes aux compte d'amortissement
    let rubrique = document.getElementById('rubrique');
    let taux = <?php echo $taux; ?>;

    rubrique.addEventListener('change', () => {
        let current_value = $("#rubrique option:selected").val();
        let current_taux = taux[current_value - 1].taux;
        $('#taux').val(current_taux+' %');
    })
</script>