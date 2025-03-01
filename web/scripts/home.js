function changeSlide(slides) {
    document.querySelector(".slide").style.backgroundImage = `url('${slides[0].image}')`;
    document.querySelector(".slide-title").innerText = `${slides[0].description}`;

    const dots = document.querySelectorAll(".dot");
    dots[0].classList.add('dots-chosen');

    let slideNumber = 1;

    setInterval(() => {
        document.querySelector(".slide").style.backgroundImage = `url('${slides[slideNumber].image}')`;
        document.querySelector(".slide-title").innerText = `${slides[slideNumber].description}`;

        for (var i = 0; i < dots.length; i++) {
            if (i === slideNumber) {
                dots[i].classList.add('dots-chosen');
            } else {
                dots[i].classList.remove('dots-chosen');
            }
        }

        slideNumber++;
        if (slideNumber === slides.length) {
            slideNumber = 0;
        }
    }, 5000);
}
