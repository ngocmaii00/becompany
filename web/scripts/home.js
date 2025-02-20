const slide = [
    {
        image: 'https://as1.ftcdn.net/v2/jpg/06/54/59/62/1000_F_654596299_XRjcZV7HYan6Fi3xgt8HM4Od0DxhXuVM.jpg',
        title: 'Enjoy your summer holiday!'
    }, {
        image: 'https://static.vecteezy.com/system/resources/previews/026/511/200/large_2x/teddy-bear-and-christmas-gift-box-ai-generated-photo.jpg',
        title: 'Happy Christmas Day!'
    }, {
        image: 'https://i.etsystatic.com/27758729/r/il/c66847/2913926815/il_1588xN.2913926815_bpet.jpg',
        title: 'Happy Valentine Day!'
    }
];

let slideNumber = 0;

setInterval(() => {
    document.querySelector('.slide').style.backgroundImage = `url('${slide[slideNumber].image}')`;
    document.querySelector('.slide-title h3').innerText = slide[slideNumber].title;
    slideNumber++;
    if(slideNumber === slide.length) {
        slideNumber = 0;
    }
}, 6000);