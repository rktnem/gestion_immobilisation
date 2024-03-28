<form action="" class="insertion-part">
    <div class="detail-matiere">
        <h3>Lot n°1: Ordinateur portable</h3>
        <div class="matiere-form">
            <div class="form-group">
                <label for="">Designation de la matiere</label>
                <input type="text" name="name" id="" placeholder="Designation de la matière..."
                    style="min-width: 400px">
            </div>
            <div class="form-group">
                <label for="">Prix de l'unité</label>
                <input type="text" name="price" id="" placeholder="Prix de l'unité... (Ar)" style="min-width: 200px">
            </div>
            <div class="form-group">
                <label for="">Quantité</label>
                <input type="number" name="name" id="" placeholder="Quantité..." style="width: 75px">
            </div>
            <div class="form-group">
                <label for="">Espèce unité</label>
                <select name="unit" id="">
                    <option value="">piece</option>
                    <option value="">pacquet</option>
                </select>
            </div>
            <div class="form-group">
                <label for="">Nomenclature</label>
                <select name="nomenclature" id="">
                    <option value="">1</option>
                    <option value="">2</option>
                    <option value="">3</option>
                    <option value="">4</option>
                    <option value="">5</option>
                    <option value="">6</option>
                    <option value="">7</option>
                </select>
            </div>
            <div class="form-group">
                <label for="">Mode d'acquisition</label>
                <select name="mode" id="">
                    <option value="">Titre honnereux</option>
                    <option value="">Titre de don</option>
                    <option value="">Titre de transfert</option>
                </select>
            </div>
            <div class="form-group">
                <label for="">Rubrique</label>
                <select name="rubrique" id="">
                    <option value="">Materiel informatique</option>
                    <option value="">Materiel de bureau</option>
                    <option value="">Machine</option>
                </select>
            </div>
            <div class="form-group">
                <label for="">Référence du bon de livraison</label>
                <input type="text" name="ref" id="" placeholder="Référence du bon de livraison..." style="width: 100px">
            </div>
            <div class="form-group">
                <label for="">Numero de facture</label>
                <input type="text" name="facture" id="" placeholder="Numero de facture..." style="width: 100px">
            </div>
            <div class="form-group">
                <label for="">Societe fournisseur</label>
                <input type="text" name="fournisseur" id="" placeholder="Societe fournisseur..."
                    style="min-width: 200px">
            </div>
            <div class="form-group">
                <label for="">Taux d'ammortissement</label>
                <input type="text" name="taux" id="" placeholder="Taux d'ammortissement... (en %/an)"
                    style="width: 75px">
            </div>
            <div class="form-group">
                <label for="">Observation</label>
                <textarea name="observation" id="" cols="30" rows="5" placeholder="Observation..."></textarea>
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
                <input type="text" name="matricule-1" id="">
                <input type="text" name="nom-detenteur-1" id="">
                <input type="text" name="quantite-1" id="">
                <input type="text" name="etat-1" id="">
            </div>
        </div>
    </div>
    <div>
        <input type="submit" value="ENREGISTRER">
    </div>
</form>