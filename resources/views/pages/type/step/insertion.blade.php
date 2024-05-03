<form action={{ route('matiere.store') }} method="POST" class="insertion-part">
    @csrf
    <div class="detail-matiere">
        <h3>Lot n°1: Ordinateur portable</h3>
        <input type="hidden" name="number" value={{ $number }}>
        <input type="hidden" name="id" value={{ $id }}>
        <div class="matiere-form">
            <div class="form-group">
                <label for="name">Designation de la matiere</label>
                <input type="text" name="name" id="name" value="{{ $matiere->designation }}" placeholder="Designation de
                la matière..." style="min-width: 350px">
            </div>
            <div class="form-group">
                <label for="specification">Spécification</label>
                <input type="text" name="specification" id="specification" value="{{ $matiere->specification }}"
                    placeholder="Designation de la matière..." style="min-width: 300px">
            </div>
            <div class="form-group">
                <label for="price">Prix de l'unité</label>
                <input type="text" name="price" id="price" placeholder="Prix de l'unité... (Ar)"
                    style="min-width: 200px">
            </div>
            <div class="form-group">
                <label for="quantite-global">Quantité</label>
                <input type="number" name="quantite-global" id="quantite-global" value="{{ $matiere->quantite }}"
                    placeholder="Quantité..." style="width: 75px">
            </div>
            <div class="form-group">
                <label for="unite">Espèce unité</label>
                <select name="unite" id="unite">
                    @foreach ($unites as $unite)
                    <option value={{ $unite->id }}>{{ $unite->typeUnite }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="nomenclature">Nomenclature</label>
                <select name="nomenclature" id="nomenclature">
                    @foreach ($classes as $classe)
                    <option value={{ $classe->id }} {{ ($classe->classe === 'classe 2' ? 'selected' : '') }}
                        >{{ $classe->classe }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="typeEntree">Mode d'acquisition</label>
                <select name="typeEntree" id="typeEntree">
                    @foreach ($types as $type)
                    <option value={{ $type->id }}>{{ $type->typeEntree }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="rubrique">Rubrique</label>
                <select name="rubrique" id="rubrique">
                    @foreach ($amortissements as $amortissement)
                    <option value='{{ $amortissement->id }}'>{{ $amortissement->rubrique }}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <label for="bonLivraison">Référence du bon de livraison</label>
                <input type="text" name="bonLivraison" id="bonLivraison" placeholder="Référence du bon de livraison..."
                    style="width: 100px">
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
                    placeholder="Observation...">Aucune observation</textarea>
            </div>
        </div>
    </div>
    <div class="detail-detenteur">
        <h3>Détenteur effectif: <input type="number" name="nombre_detenteur" id="nombre_detenteur" value="1">
        </h3>
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
                <input type="hidden" name="id-1" class="index">
                <input type="text" name="matricule-1" class="matricule" id="matricule-1" required>
                <input type="text" name="nom-detenteur-1" class="nom-detenteur" id="nom-detenteur-1" required>
                <input type="text" name="quantite-1" id="quantite-1" required>
                <select name="etat-1" id="etat-1">
                    @foreach ($etats as $etat)
                    <option value={{ $etat->id }}>{{ $etat->typeEtat }}</option>
                    @endforeach
                </select>
            </div>
        </div>
    </div>
    <div>
        <input type="submit" value="ENREGISTRER">
    </div>
</form>

@php
$taux = json_encode($amortissements);
$employees = json_encode($employees);
@endphp

<script>
    // Auto remplir les champs associes aux compte d'amortissement
    let rubrique = document.getElementById('rubrique');
    let taux = <?php echo $taux; ?>;

    window.onload = () => {
        let current_value = $("#rubrique option:selected").val();
        let current_taux = taux[current_value - 1].taux;
        $('#taux').val(current_taux+' %');
            
        rubrique.addEventListener('change', () => {
            current_value = $("#rubrique option:selected").val();
            current_taux = taux[current_value - 1].taux;
            $('#taux').val(current_taux+' %');
        })
    }

    // Auto remplir les informations du detenteur
    setTimeout(() => {
        let employees = <?php echo $employees; ?>;
        let btnDetenteur = $(".detail-detenteur .detenteur-form button");
        let nom = $('.nom-detenteur');
        let index = $('.index');
        var matricule = $('.matricule');

        matricule.on('keypress', (e) => {
            if(e.key === 'Enter') {
                e.preventDefault();
                autoFill(employees, e.target.value, nom, index, 0)
            }
        })

        btnDetenteur.on('click', () => {
            matricule = $('.matricule');
            nom = $('.nom-detenteur');
            index = $('.index');

            for(let i = 0; i < matricule.length; i++) {
                matricule[i].onkeypress = (e) => {
                    if(e.key === 'Enter') {
                        e.preventDefault();
                        autoFill(employees, e.target.value, nom, index, i)
                    }
                }
            }
        })
        
    }, 1500);

    function autoFill(employees, matricule, nom, index, k = 0) {
        for(let i = 0; i < employees.length; i++) {
            if(matricule === employees[i].matricule) {
                index[k].value = employees[i].id;
                nom[k].value = employees[i].nom.toUpperCase()+' '+employees[i].prenom;
            }
        }
    }

</script>