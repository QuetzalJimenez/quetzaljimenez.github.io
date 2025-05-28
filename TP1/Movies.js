const divClick = document.getElementById('Matrix');
const divAparecer = document.getElementById('Matrix_Aparecer');

divClick.addEventListener('click', () => {
    if (divAparecer.classList.contains('show')) {
        divAparecer.style.opacity = 0;
        divAparecer.addEventListener('transitionend', () => {
            divAparecer.style.display = 'none';
            divAparecer.classList.remove('show');
        }, { once: true });
    } else {
        divAparecer.style.display = 'block';
        divAparecer.offsetHeight;
        divAparecer.style.opacity = 1;
        divAparecer.classList.add('show');
    }
});

const divClick2 = document.getElementById('Reloaded');
const divAparecer2 = document.getElementById('Reloaded_Aparecer');

divClick2.addEventListener('click', () => {
    if (divAparecer2.classList.contains('show')) {
        divAparecer2.style.opacity = 0;
        divAparecer2.addEventListener('transitionend', () => {
            divAparecer2.style.display = 'none';
            divAparecer2.classList.remove('show');
        }, { once: true });
    } else {
        divAparecer2.style.display = 'block';
        divAparecer2.offsetHeight;
        divAparecer2.style.opacity = 1;
        divAparecer2.classList.add('show');
    }
});

const divClick3 = document.getElementById('Revolutions');
const divAparecer3 = document.getElementById('Revolutions_Aparecer');

divClick3.addEventListener('click', () => {
    if (divAparecer3.classList.contains('show')) {
        divAparecer3.style.opacity = 0;
        divAparecer3.addEventListener('transitionend', () => {
            divAparecer3.style.display = 'none';
            divAparecer3.classList.remove('show');
        }, { once: true });
    } else {
        divAparecer3.style.display = 'block';
        divAparecer3.offsetHeight;
        divAparecer3.style.opacity = 1;
        divAparecer3.classList.add('show');
    }
});

const divClick4 = document.getElementById('Resurrections');
const divAparecer4 = document.getElementById('Resurrections_Aparecer');

divClick4.addEventListener('click', () => {
    if (divAparecer4.classList.contains('show')) {
        divAparecer4.style.opacity = 0;
        divAparecer4.addEventListener('transitionend', () => {
            divAparecer4.style.display = 'none';
            divAparecer4.classList.remove('show');
        }, { once: true });
    } else {
        divAparecer4.style.display = 'block';
        divAparecer4.offsetHeight;
        divAparecer4.style.opacity = 1;
        divAparecer4.classList.add('show');
    }
});

const divClick5 = document.getElementById('Animatrix');
const divAparecer5 = document.getElementById('Animatrix_Aparecer'); 

divClick5.addEventListener('click', () => { 
    if (divAparecer5.classList.contains('show')) {
        divAparecer5.style.opacity = 0;
        divAparecer5.addEventListener('transitionend', () => {
            divAparecer5.style.display = 'none';
            divAparecer5.classList.remove('show');
        }, { once: true });
    } else {
        divAparecer5.style.display = 'block';
        divAparecer5.offsetHeight;
        divAparecer5.style.opacity = 1;
        divAparecer5.classList.add('show');
    }
});


