var mj = 'Verifique la longitud';

function chekear() {
    return (val() && vallen(input[0], 4, 40, mj) && vallen(input[2], 4, 55, mj) && vallen(input[4], 8, 10, mj) && vallen(input[5], 6, 12, mj) && email() && contra() && fecha() && Genero());
}

function email() { //email
    var patron = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    if (input[8].value.search(patron)) {
        input[8].parentNode.removeAttribute('data-validate');
        input[8].parentNode.setAttribute('data-validate', 'Email Incorrecto');
        ShowClass(input[8].parentNode);
        return false;
    } else {
        return true;
    }
}

function vallen(ele, min, max, sms) {
    if (ele.value.length >= min && ele.value.length <= max) {
        return true;
    } else {
        ele.parentNode.removeAttribute('data-validate');
        ele.parentNode.setAttribute('data-validate', sms);
        ShowClass(ele.parentNode);
        return false;
    }
}

input[0].onkeyup = () => {
    var patterns = /[^a-zA-ZáéíóúAÉÍÓÚÑñ]*$/;
    var caretPos = this.selectionStart;
    this.value = input[0].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

input[1].onkeyup = () => {
    var patterns = /[^a-zA-ZáéíóúAÉÍÓÚÑñ]*$/;
    var caretPos = this.selectionStart;
    this.value = input[1].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

input[2].onkeyup = () => {
    var patterns = /[^a-zA-ZáéíóúAÉÍÓÚÑñ]*$/;
    var caretPos = this.selectionStart;
    this.value = input[2].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

input[3].onkeyup = () => {
    var patterns = /[^a-zA-ZáéíóúAÉÍÓÚÑñ]*$/;
    var caretPos = this.selectionStart;
    this.value = input[3].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

input[4].onkeyup = () => { //solo numeros
    var patterns = /[^0-9]*/g;
    var caretPos = this.selectionStart;
    this.value = input[4].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

inp[5].onkeyup = () => { //solo numeros
    var patterns = /[^0-9]*/g;
    var caretPos = this.selectionStart;
    this.value = inp[5].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

input[9].onkeyup = () => { // password
    var patterns = /[^a-zA-ZáéíóúAÉÍÓÚÑñ0-9]*$/;
    var caretPos = this.selectionStart;
    this.value = input[9].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

input[10].onkeyup = () => { // password
    var patterns = /[^a-zA-ZáéíóúAÉÍÓÚÑñ0-9]*$/;
    var caretPos = this.selectionStart;
    this.value = input[10].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

function fecha() {
    if (input[6].value.length === 10) {
        return true;
    } else {
        input[6].parentNode.removeAttribute('data-validate');
        input[6].parentNode.setAttribute('data-validate', 'Seleccione una fecha');
        ShowClass(input[6].parentNode);
        return false;
    }
}

function Genero() {
    if (input[7].value != "Seleccione") {
        return true;
    } else {
        input[7].parentNode.removeAttribute('data-validate');
        input[7].parentNode.setAttribute('data-validate', 'Seleccione un Genero');
        ShowClass(input[7].parentNode);
        return false;
    }
}

function contra() {
    if (input[9].value === input[10].value) {
        return true;
    } else {
        input[9].parentNode.removeAttribute('data-validate');
        input[9].parentNode.setAttribute('data-validate', 'P1 y P2 no coincide');
        ShowClass(input[9].parentNode);
        input[10].parentNode.removeAttribute('data-validate');
        input[10].parentNode.setAttribute('data-validate', 'P1 y P2 no coincide');
        ShowClass(input[10].parentNode);
        return false;
    }
}