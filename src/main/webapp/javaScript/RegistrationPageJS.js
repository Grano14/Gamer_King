function validateID(){
    var nomeUtente = document.getElementById("userName").value;
    var numeroREGX = /[0-9]/;
    var letteraMaiuscREGX = /[A-Z]/;
    if(numeroREGX.test(nomeUtente) && letteraMaiuscREGX.test(nomeUtente) && nomeUtente.length > 5) {
        document.getElementById("1").setAttribute("style", "color: green");
        document.getElementById("1").innerHTML = "ok";
    }
    else{
        document.getElementById("1").setAttribute("style", "color: red");
        document.getElementById("1").innerHTML = "formato incorretto";
    }
}

function validateName(idInput, idLabel){
    var nome = document.getElementById(idInput).value;
    var numeroREGX = /[0-9]/;
    if(nome.length > 1 && !numeroREGX.test(nome)){
        document.getElementById(idLabel).setAttribute("style", "color: green");
        document.getElementById(idLabel).innerHTML = "ok";
    }
    else{
        document.getElementById(idLabel).setAttribute("style", "color: red");
        document.getElementById(idLabel).innerHTML = "formato incorretto";
    }
}

function checkButton(){
    if(document.getElementById("1").innerHTML == "ok" && document.getElementById("2").innerHTML == "ok" && document.getElementById("3").innerHTML == "ok"
    && document.getElementById("4").innerHTML == "ok" && document.getElementById("5").innerHTML == "ok" && document.getElementById("6").innerHTML == "ok") {
        document.getElementById("bottone").style.visibility = "visible";
        document.getElementById("registration").style.height = "1000px";
    }
    else
        document.getElementById("bottone").style.visibility = "hidden";
}

function validateMail(){
    var emailREGX = /[@]/;
    var mail = document.getElementById("email").value;
    if(emailREGX.test(mail) && mail.length > 7){
        document.getElementById(4).setAttribute("style", "color: green");
        document.getElementById(4).innerHTML = "ok";
    }
    else{
        document.getElementById(4).setAttribute("style", "color: red");
        document.getElementById(4).innerHTML = "formato incorretto";
    }

}

function validateNum(){
    var lettereREGX = /[a-z]/;
    var numero = document.getElementById("phone").value;
    if(!lettereREGX.test(numero) && numero.length > 9){
        document.getElementById(5).setAttribute("style", "color: green");
        document.getElementById(5).innerHTML = "ok";
    }
    else{
        document.getElementById(5).setAttribute("style", "color: red");
        document.getElementById(5).innerHTML = "formato incorretto";
    }
}

function validatePass(){
    var pass = document.getElementById("pass").value;
    var lettereMinREGX = /[a-z]/;
    var lettereMaiuscREGX = /[A-Z]/;
    var numeroREGX = /[0-9]/;
    if(lettereMaiuscREGX.test(pass) && lettereMinREGX.test(pass) && numeroREGX.test(pass) && pass.length > 6){
        document.getElementById(6).setAttribute("style", "color: green");
        document.getElementById(6).innerHTML = "ok";
    }
    else{
        document.getElementById(6).setAttribute("style", "color: red");
        document.getElementById(6).innerHTML = "formato incorretto";
    }
}