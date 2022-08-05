var controllo1, controllo2, controllo3, controllo4;

function validateID(){
    var nomeUtente = document.getElementById("userName").value;
    var numeroREGX = /[0-9]/;
    var letteraMaiuscREGX = /[A-Z]/;
    if(numeroREGX.test(nomeUtente) && letteraMaiuscREGX.test(nomeUtente) && nomeUtente.length > 5) {
        document.getElementById("userName").style.backgroundColor = "lightgreen";
        document.getElementById("erroreNome").style.display = "none";
        controllo1=1;
    }
    else{
        document.getElementById("userName").style.backgroundColor = "lightpink";
        document.getElementById("erroreNome").style.display = "block";
        controllo1=0;
    }
}

function checkButton(){
    if(controllo1 == 1 && controllo2 == 1 && controllo3 == 1 && controllo4 == 1) {
        document.getElementById("bottoneReg").style.visibility = "visible";
        document.getElementById("formLogin").action = "RegistraUtente";
    }
    else
    {
        document.getElementById("bottoneReg").style.visibility = "hidden";
        document.getElementById("formLogin").action = "";
    }
}

function validateMail(){
    var emailREGX = /[@]/;
    var mail = document.getElementById("email").value;
    if(emailREGX.test(mail) && mail.length > 7){
        document.getElementById("email").style.backgroundColor = "lightgreen";
        document.getElementById("erroreMail").style.display = "none";
        controllo2=1;
    }
    else{
        document.getElementById("email").style.backgroundColor = "lightpink";
        document.getElementById("erroreMail").style.display = "block";
        controllo2=0;
    }

}

function validatePass(){
    var pass = document.getElementById("pass").value;
    var lettereMinREGX = /[a-z]/;
    var lettereMaiuscREGX = /[A-Z]/;
    var numeroREGX = /[0-9]/;
    if(lettereMaiuscREGX.test(pass) && lettereMinREGX.test(pass) && numeroREGX.test(pass) && pass.length > 6){
        document.getElementById("pass").style.backgroundColor = "lightgreen";
        document.getElementById("errorePass").style.display = "none";
        controllo3=1;
    }
    else{
        document.getElementById("pass").style.backgroundColor = "lightpink";
        document.getElementById("errorePass").style.display = "block";
        controllo3=0;
    }
}

function validateConfPass(){
    var pass = document.getElementById("pass").value;
    var confPass = document.getElementById("confPass").value;
    if(confPass==pass && confPass.length>0){
        document.getElementById("confPass").style.backgroundColor = "lightgreen";
        document.getElementById("erroreConfPass").style.display = "none";
        controllo4=1;
    }
    else{
        document.getElementById("confPass").style.backgroundColor = "lightpink";
        document.getElementById("erroreConfPass").style.display = "block";
        controllo4=0;
    }
}