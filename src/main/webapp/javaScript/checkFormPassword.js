var controllo1,controllo2,controllo3;

function checkModificaPass(idText,idErrore){
    var text = document.getElementById(idText).value;
    //controllo che la password rispetta le REGEX
    var lettereMinREGX = /[a-z]/;
    var lettereMaiuscREGX = /[A-Z]/;
    var numeroREGX = /[0-9]/;

    if(lettereMaiuscREGX.test(text) && lettereMinREGX.test(text) && numeroREGX.test(text) && text.length > 6) {
        document.getElementById(idText).style.backgroundColor = "lightgreen";
        document.getElementById(idErrore).style.display = "none";
        controllo1 = 1;
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idErrore).style.display = "block";
        document.getElementById(idErrore).textContent = "La password deve contenere almeno una lettera maiuscola e minuscola, un numero e deve essere di almeno 7 caratteri";
        controllo1 = 0;
    }
}

//verifica che la password inserita e la conferma password sono uguali
function checkEqualPass(idText1,idText2,idErrore){
    var text1 = document.getElementById(idText1).value;
    var text2 = document.getElementById(idText2).value;

    if(text1==text2 && text1.length>0) {
        document.getElementById(idText1).style.backgroundColor = "lightgreen";
        document.getElementById(idErrore).style.display = "none";
        controllo2 = 1;
    }
    else{
        document.getElementById(idText1).style.backgroundColor = "lightpink";
        document.getElementById(idErrore).style.display = "block";
        document.getElementById(idErrore).textContent = "La conferma password deve essere la stessa della password";
        controllo2 = 0;
    }
}

//controlla sintassi password
function checkPass(idText){
    var text = document.getElementById(idText).value;
    if(text.length > 0){
        document.getElementById(idText).style.backgroundColor = "lightgreen";
        controllo3 = 1;
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        controllo3 = 0;
    }
}

function checkPassButton(){
    if(controllo1 == 1 && controllo2 == 1 && controllo3 == 1){
        document.getElementById("passForm").action="ii";
        document.getElementById("modificaPass").style.visibility = "visible";
    }
    else{
        document.getElementById("passForm").action="";
        document.getElementById("modificaPass").style.visibility = "hidden";
    }
}
