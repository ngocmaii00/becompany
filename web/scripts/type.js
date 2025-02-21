let status = false;
document.querySelector('.filter-icon').addEventListener('click', () => {
    status = !status;
    document.querySelector('.type-left').style.display = status ? "block" : "none";
});


