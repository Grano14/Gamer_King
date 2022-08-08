var controllo1,controllo2,controllo3,controllo5,controllo6,controllo7;
var controllo4=0;

function checkNumero(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(text.length == 10 && !(letteraMaiuscREGX.test(text)) && !(letteraMinREGX.test(text))){
        document.getElementById(idText).style.backgroundColor = "ligthgreen";
        document.getElementById(idError).style.visibility = "hidden";
        controllo1=1;
    }
    else{
        document.getElementById(idText).style.backgroundColor = "ligthpink";
        document.getElementById(idError).style.visibility = "visible";
        controllo1=0;
    }
}

function checkVerifica(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(!letteraMaiuscREGX.test(text) && !letteraMinREGX.test(text)){
        if(text.length == 3){
            document.getElementById(idText).style.backgroundColor = "ligthgreen";
            document.getElementById(idError).style.visibility = "hidden";
            controllo2=1;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "ligthpink";
        document.getElementById(idError).style.visibility = "visible";
        controllo2=0;
    }
}

function checkScadenza(id){
            document.getElementById(id).style.backgroundColor = "ligthgreen";
            controllo3=1;
}

function checkNomi(idText,idError){
    var text = document.getElementById(idText).value;

    var numberREGX = /[0-9]/;

    if(!numberREGX.test(text)){
        if(text.length > 3){
            document.getElementById(idText).style.backgroundColor = "ligthgreen";
            document.getElementById(idError).style.visibility = "hidden";
            controllo4++;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "ligthpink";
        document.getElementById(idError).style.visibility = "visible";
        controllo4--;
    }
}

function checkVia(idText){
    var text = document.getElementById(idText).value;

    if(text.length > 4){
        document.getElementById(idText).style.backgroundColor = "ligthgreen";
        document.getElementById(idError).style.visibility = "hidden";
        controllo5=1;
    }
    else
    {
        document.getElementById(idText).style.backgroundColor = "none";
        controllo5=0;
    }
}

function checkNumCivico(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(text.length > 0 && !letteraMaiuscREGX.test(text) && !letteraMinREGX.test(text)){
        document.getElementById(idText).style.backgroundColor = "ligthgreen";
        document.getElementById(idError).style.visibility = "hidden";
        controllo6=1;
    }
    else{
        document.getElementById(idText).style.backgroundColor = "ligthpink";
        document.getElementById(idError).style.visibility = "visible";
        controllo6=0;
    }
}

function checkCap(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(!letteraMaiuscREGX.test(text) && !letteraMinREGX.test(text)){
        if(text.length == 5){
            document.getElementById(idText).style.backgroundColor = "ligthgreen";
            document.getElementById(idError).style.visibility = "hidden";
            controllo7=1;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "ligthpink";
        document.getElementById(idError).style.visibility = "visible";
        controllo7=0;
    }
}

function checkButton()
{
    if(
        controllo1 == 1 && controllo2 == 1 && controllo3 == 1 && controllo5 == 1 && controllo6 == 1 && controllo7 == 1 &&
    controllo4 == 3){
        document.getElementById("bottone").style.visibility = "visible";
        document.getElementById("formCarta").action = "AggiungiCarta";
    }
    else
    {
        document.getElementById("bottone").style.visibility = "hidden";
        document.getElementById("formCarta").action = "";
    }
}
