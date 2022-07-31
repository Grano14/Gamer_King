function checkModificaNome(idText,idButton,idErrore){
    var text = document.getElementById(idText).value;
    var buttonVisibility = document.getElementById(idButton).style.visibility;

    var numeroREGX = /[0-9]/;
    var letteraMaiuscREGX = /[A-Z]/;

    if(numeroREGX.test(text) && letteraMaiuscREGX.test(text) && text.length >= 5) {
        document.getElementById(idText).style.backgroundColor = "green";
        document.getElementById("modNome").action="UpdateNomeUtente";
        document.getElementById(idErrore).style.visibility = "hidden";
        buttonVisibility = "visible";
    }
    else{
        document.getElementById("modNome").action="";
        document.getElementById(idText).style.backgroundColor = "red";
        document.getElementById(idErrore).textContent = "L'user deve contenere almeno una lettera maiuscola, un numero e deve essere di almeno 5 caratteri";
        document.getElementById(idErrore).style.visibility = "visible";
        buttonVisibility = "hidden";
    }
    document.getElementById(idButton).style.visibility = buttonVisibility;
}