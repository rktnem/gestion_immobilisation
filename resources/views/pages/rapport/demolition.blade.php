@extends('layout.main')

@section('content')

<section class="rapport-demolition">
    <div>
        <button>Ajouter</button>
    </div>
    <form action="">
        @csrf
        <div id="form-demolition">
            <div class="rapport-matiere rapport">
                <h3><span>#1</span> <span>Matiere</span></h3>
                <div class="rapport-input">
                    <div class="form-group">
                        <label for="classe">Nomenclature</label>
                        <select name="classe" id="">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="designation">Designation</label>
                        <input type="text" name="designation" id="" placeholder="Designation...">
                    </div>
                    <div class="form-group">
                        <label for="classe">Espece d'unite</label>
                        <select name="classe" id="">
                            <option value="piece">piece</option>
                            <option value="pacquet">pacquet</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="classe">Prix d'acquisition</label>
                        <input type="text" name="prix" id="" placeholder="Prix d'acquisition...">
                    </div>
                </div>
            </div>
            <div class="rapport-quantite rapport">
                <h3>Quantite</h3>
                <div class="rapport-input">
                    <div class="form-group">
                        <label for="quantite-existant">Quantité existant</label>
                        <input type="text" name="quantite-existant" style="width: 125px" id="" value="1" readonly>
                    </div>
                    <div class="form-group">
                        <label for="quantite-constate">Quantité constaté</label>
                        <input type="text" name="quantite-constate" id="" style="width: 125px"
                            placeholder="Quantité constaté...">
                    </div>
                </div>
            </div>
            <div class="rapport-excedent rapport">
                <h3>Excedent</h3>
                <div class="rapport-input">
                    <div class="form-group">
                        <label for="quantite-excedent">Quantité excedent</label>
                        <input type="text" name="quantite-excedent" id="" style="width: 50px"
                            placeholder="Quantité excedent...">
                    </div>
                    <div class="form-group">
                        <label for="valeur-excedent">Valeur excedent</label>
                        <input type="text" name="valeur-excedent" id="" style="width: 125px" value="1 250 000 Ar"
                            readonly>
                    </div>
                </div>
            </div>
            <div class="rapport-deficit rapport">
                <h3>Deficit</h3>
                <div class="rapport-input">
                    <div class="form-group">
                        <label for="quantite-deficit">Quantité deficit</label>
                        <input type="text" name="quantite-deficit" id="" style="width: 50px"
                            placeholder="Quantité deficit...">
                    </div>
                    <div class="form-group">
                        <label for="valeur-deficit">Valeur deficit</label>
                        <input type="text" name="valeur-deficit" id="" style="width: 125px" value="1 250 000 Ar"
                            readonly>
                    </div>
                </div>
            </div>
            <div class="rapport-observation rapport">
                <h3>Observation</h3>
                <div class="rapport-input">
                    <textarea name="observation" id="" cols="20" rows="5"
                        placeholder="Observation constaté par la commission recenseur..."></textarea>
                </div>
            </div>
        </div>
    </form>
</section>

@endsection