@extends('layout.main')

@section('content')
<section class="demolition-section">
    <div class="demolition-content">
        <div>
            <button>Ajouter</button>
        </div>
        <form action="">
            @csrf
            <div id="form-recensement">
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
                        <div class="form-group">
                            <label for="classe">Mode de condamnation</label>
                            <select name="condamnation" id="condamnation">
                                <option value="demolition">Par demolition</option>
                                <option value="destruction">Par destruction</option>
                                <option value="vente">Par vente</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="rapport-quantite rapport">
                    <h3>Quantite</h3>
                    <div class="rapport-input">
                        <div class="form-group">
                            <label for="quantite-existant">Quantité existant</label>
                            <input type="text" name="quantite-existant" id="" value="1" readonly>
                        </div>
                        <div class="form-group">
                            <label for="quantite-constate">Quantité constaté</label>
                            <input type="text" name="quantite-constate" id="" placeholder="Quantité constaté...">
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
            <div>
                <input type="submit" value="ENREGISTRER">
            </div>
        </form>
    </div>
</section>
@endsection