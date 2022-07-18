function validateID(){
    var nomeUtente = document.getElementById("userName").value;
    var numeroREGX = /[0-9]/;
    var letteraMaiuscREGX = /[A-Z]/;
    if(numeroREGX.test(nomeUtente) && letteraMaiuscREGX.test(nomeUtente) && nomeUtente.length > 5) {
        document.getElementById("userName").style.backgroundColor = "green";
    }
    else{
        document.getElementById("userName").style.backgroundColor = "red";
    }
}

function validateName(idInput){
    var nome = document.getElementById(idInput).value;
    var numeroREGX = /[0-9]/;
    if(nome.length > 1 && !numeroREGX.test(nome)){
        document.getElementById(idInput).style.backgroundColor = "green";
    }
    else{
        document.getElementById(idInput).style.backgroundColor = "red";
    }
}

function checkButton(){
    if(document.getElementById("userName").style.backgroundColor == "green" && document.getElementById("firstName").style.backgroundColor == "green" && document.getElementById("lastName").style.backgroundColor == "green"
    && document.getElementById("email").style.backgroundColor == "green" && document.getElementById("phone").style.backgroundColor == "green" && document.getElementById("pass").style.backgroundColor == "green") {
        document.getElementById("bottone").style.visibility = "visible";
    }
    else
        document.getElementById("bottone").style.visibility = "hidden";
}

function validateMail(){
    var emailREGX = /[@]/;
    var mail = document.getElementById("email").value;
    if(emailREGX.test(mail) && mail.length > 7){
        document.getElementById("email").style.backgroundColor = "green";
    }
    else{
        document.getElementById("email").style.backgroundColor = "red";
    }

}

function validateNum(){
    var lettereREGX = /[a-z]/;
    var numero = document.getElementById("phone").value;
    if(!lettereREGX.test(numero) && numero.length > 9){
        document.getElementById("phone").style.backgroundColor = "green";
    }
    else{
        document.getElementById("phone").style.backgroundColor = "red";
    }
}

function validatePass(){
    var pass = document.getElementById("pass").value;
    var lettereMinREGX = /[a-z]/;
    var lettereMaiuscREGX = /[A-Z]/;
    var numeroREGX = /[0-9]/;
    if(lettereMaiuscREGX.test(pass) && lettereMinREGX.test(pass) && numeroREGX.test(pass) && pass.length > 6){
        document.getElementById("pass").style.backgroundColor = "green";
    }
    else{
        document.getElementById("pass").style.backgroundColor = "red";
    }
}

function infoForm(){
    alert("Formato nome utente: \n" +
        "- lunghezza minima:6 caratteri\n" +
        "- almeno un numero e una lettera maiuscola\n" +
        "Formato nome e cognome:\n" +
        "x nessun numero\n" +
        "Formato password:\n" +
        "- almeno 7 caratteri\n" +
        "- almeno una lettera maiuscola e un numero\n")
}

function hideButton(){
    document.getElementById("bottone").style.visibility = "hidden";
}