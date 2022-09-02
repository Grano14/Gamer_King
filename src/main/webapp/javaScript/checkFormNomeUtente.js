//controllo nome utente
function checkModificaNome(idText,idButton,idErrore){
    var text = document.getElementById(idText).value;
    var buttonVisibility = document.getElementById(idButton).style.visibility;
    var nome = document.getElementById("hidden").value;

    var numeroREGX = /[0-9]/;
    var letteraMaiuscREGX = /[A-Z]/;

    if(numeroREGX.test(text) && letteraMaiuscREGX.test(text) && text.length >= 5 && text!=nome) {
        document.getElementById(idText).style.backgroundColor = "lightgreen";
        document.getElementById("modNome").action="UpdateNomeUtente";
        document.getElementById(idErrore).style.display = "none";
        buttonVisibility = "visible";
    }
    else{
        document.getElementById("modNome").action="";
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idErrore).style.display = "block";
        buttonVisibility = "hidden";
        if(nome!=text)
            document.getElementById(idErrore).textContent = "L'user deve contenere almeno una lettera maiuscola, un numero e deve essere di almeno 5 caratteri";
        else
            document.getElementById(idErrore).textContent = "User name in uso";
    }
    document.getElementById(idButton).style.visibility = buttonVisibility;
}