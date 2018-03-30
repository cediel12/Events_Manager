
input[1].onkeyup = function () {// password para q no meta espacios
    var patterns = /[^a-zA-ZáéíóúAÉÍÓÚÑñ0-9]*$/;
    var caretPos = this.selectionStart;
    this.value = input[1].value.replace(patterns, '');
    this.setSelectionRange(caretPos, caretPos);
}

function email() {//email
    var patron = /^([a-z]+[a-z1-9._-]*)@{1}([a-z1-9\.]{2,})\.([a-z]{2,3})$/;
    if (input[0].value.search(patron)) {
        input[0].parentNode.removeAttribute('data-validate');
        input[0].parentNode.setAttribute('data-validate', 'Email Incorrecto');
        ShowClass(input[0].parentNode);
    }
    return (!input[0].value.search(patron));
}

function password() {
    if (input[1].value.length < 4) {
        input[1].parentNode.removeAttribute('data-validate');
        input[1].parentNode.setAttribute('data-validate', 'Minimo 4 caracteres');
        ShowClass(input[1].parentNode);
    }
    return (input[1].value.length >= 4);
}
function chekear() {
    return (val() && email() && password());
}