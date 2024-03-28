let close = $('.side-visible');
let show = $('.side-hidden');

close.on('click', () => {
    $('.sidebar').css("width", "0px");
    $('.content-section').css("margin-left", "0px");
    close.hide();
    show.show();
})

show.on('click', () => {
    $('.sidebar').css("width", "250px");
    $('.content-section').css("margin-left", "250px");
    close.show();
    show.hide();
})

// Pour les balises form repetitive

let number = $("#number");
let form = "";
let formLot = $('#form-lot');

function formGroup(lot) {
    return " <div class='form-group'> <label for=lot-"+lot+">Lot n°"+lot+"</label> <input type='text' name='lot-"+lot+"' id='' placeholder='Designation du lot n°"+lot+"...'><input type='number' name='quantite-"+lot+"' id='' style='width: 75px' placeholder='Qté...'></div>"
}

number.on("keypress", (e) => {
    console.log(form);
    if(e.key === "Enter") {
        formLot.children().remove();
        form = "<h4>Désignation des lots</h4>";
        e.preventDefault();
        for(let i = 0; i < e.target.value; i++) {
            form += formGroup(i+1)
        }
        formLot.append(form);
    }
    form = "";
})