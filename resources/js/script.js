// ********* Cacher et afficher le sidebar

$(document).ready(() => {
    let close = $(".side-visible");
    let show = $(".side-hidden");

    close.on("click", () => {
        $(".sidebar").css("width", "0px");
        $(".content-section").css("margin-left", "0px");
        close.hide();
        show.show();
    });

    show.on("click", () => {
        $(".sidebar").css("width", "250px");
        $(".content-section").css("margin-left", "250px");
        close.show();
        show.hide();
    });
});

// ********** Pour les balises form repetitive

let number = $("#number");
let form = "";
let formLot = $("#form-lot");

// Pour le form-lot dans la section achat

function formGroup(lot) {
    // Fonction permettant de generer le balise de form-lot
    return (
        "<div class='form-group'>" +
        "<div>" +
        "<label for=lot-" +
        lot +
        ">Lot n°" +
        lot +
        "</label>" +
        "</div>" +
        "<div>" +
        "<input type='text' name='lot-" +
        lot +
        "' id='' placeholder='Designation du lot n°" +
        lot +
        "...' required>" +
        "<input type='text' name='specification-" +
        lot +
        "' id='' placeholder='Spécification technique...' required>" +
        "<input type='number' name='prix-minimal-" +
        lot +
        "' id='' placeholder='Prix minimal en TTC...' required>" +
        "<input type='number' name='prix-maximal-" +
        lot +
        "' id='' placeholder='Prix maximal en TTC...' required>" +
        "<input type='number' name='quantite-" +
        lot +
        "' id='' style='width: 75px' placeholder='Qté...' required>" +
        "" +
        "</div>" +
        "</div>"
    );
}

number.on("keypress", (e) => {
    if (e.key === "Enter") {
        formLot.children().remove();
        form = "<h4>Désignation des lots</h4>";
        e.preventDefault();
        for (let i = 0; i < e.target.value; i++) {
            form += formGroup(i + 1);
        }
        formLot.append(form);
    }
    form = "";
});

// Pour le form detenteur de la partie insertion de matiere

let btnDetenteur = $(".detail-detenteur .detenteur-form button");
let detenteurTable = $(".detail-detenteur .detenteur-form");
let ref = 2;

function formDetenteur(lot) {
    return (
        '<div class="detenteur-input"><input type="text" name="matricule-' +
        lot +
        '" id="" required><input type="text" name="nom-detenteur-' +
        lot +
        '" id="" required><input type="text" name="quantite-' +
        lot +
        '" id="" required><input type="text" name="etat-' +
        lot +
        '" id="" required></div>'
    );
}

btnDetenteur.on("click", (e) => {
    e.preventDefault();
    detenteurTable.append(formDetenteur(ref));
    ref += 1;
});
