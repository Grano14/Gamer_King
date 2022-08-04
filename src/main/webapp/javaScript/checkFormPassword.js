var controllo1,controllo2;

function checkModificaPass(idText,idErrore){
    var text = document.getElementById(idText).value;

    var lettereMinREGX = /[a-z]/;
    var lettereMaiuscREGX = /[A-Z]/;
    var numeroREGX = /[0-9]/;

    if(lettereMaiuscREGX.test(text) && lettereMinREGX.test(text) && numeroREGX.test(text) && text.length > 6) {
        document.getElementById(idText).style.backgroundColor = "lightgreen";
        document.getElementById(idErrore).style.display = "none";
        controllo1=1;
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idErrore).style.display = "block";
        document.getElementById(idErrore).textContent = "La password deve contenere almeno una lettera maiuscola e minuscola, un numero e deve essere di almeno 7 caratteri";
        controllo1=0;
    }
}

function checkEqualPass(idText1,idText2,idErrore){
    var text1 = document.getElementById(idText1).value;
    var text2 = document.getElementById(idText2).value;

    if(text1==text2) {
        document.getElementById(idText1).style.backgroundColor = "lightgreen";
        document.getElementById(idErrore).style.display = "none";
        controllo2=1;
    }
    else{
        document.getElementById(idText1).style.backgroundColor = "lightpink";
        document.getElementById(idErrore).style.display = "block";
        document.getElementById(idErrore).textContent = "La conferma password deve essere la stessa della password";
        controllo2=1;
    }
}

function checkPassButton(){
    if(controllo1==1 && controllo2==1){
        document.getElementById("passForm").action="ii";
        document.getElementById("bottonePass").style.visibility = "visible";
    }
    document.getElementById("passForm").action="";
    document.getElementById("bottonePass").style.visibility = "hidden";
}
