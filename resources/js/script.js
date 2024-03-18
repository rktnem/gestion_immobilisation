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