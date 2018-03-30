var input = document.getElementsByClassName('input100');
let x = false;
document.getElementById('btn').addEventListener('click', () => {
    var temp = 0;
    for (var i = 0; i < input.length; i++) {
        if (validate(input[i])) {
            ShowClass(input[i].parentNode);
            temp++;
        }
    }
    x = (temp == 0) ? true : false;
});

window.onload = () => {
    for (var i = 0; i < input.length; i++) {
        console.log(i);
        let dad = input[i].parentNode;
        input[i].addEventListener('focus', () => {
            HideClass(dad);
        });
    }
}

function validate(input) {
    return (input.value.trim() == '');
}

function ShowClass(dad) {//si no la tiene pongala
    if (!Verificate(dad, 'alert-validate')) {
        dad.classList.add('alert-validate');
    }
}

function HideClass(dad) {//si la tiene quitela
    if (!Verificate(dad, 'alert-validate')) {
        dad.classList.remove('alert-validate');
    }
}

function val() {//todo pasa por aqui
    return x;
}

function Verificate(dad, clas) {
    let res = 0;
    for (var i = 0; i < dad.classList.length; i++) {
        res += (dad.classList[i] == clas) ? 1 : 0;
    }
    return (res == dad.classList.length);
}