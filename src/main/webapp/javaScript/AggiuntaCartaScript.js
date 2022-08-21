var controllo1,controllo2,controllo3,controllo4,controllo5,controllo6,controllo7,controllo8,controllo9;

function checkNumero(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if( !(letteraMaiuscREGX.test(text)) && !(letteraMinREGX.test(text))){
        if(text.length == 16){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo1=1;
        }
        else
        {
            document.getElementById(idText).style.backgroundColor = "white";
            controllo1=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo1=0;
    }
}

function checkVerifica(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(!letteraMaiuscREGX.test(text) && !letteraMinREGX.test(text)){
        if(text.length == 3){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo2=1;
        }
        else{
            document.getElementById(idText).style.backgroundColor = "white";
            controllo2=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo2=0;
    }
}

function checkScadenza(id){
            document.getElementById(id).style.backgroundColor = "lightgreen";
            controllo3=1;
}

function checkNome(idText,idError){
    var text = document.getElementById(idText).value;

    var numberREGX = /[0-9]/;

    if(!numberREGX.test(text)){
        if(text.length > 3){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo4=1;
        }
        else{
            document.getElementById(idText).style.backgroundColor = "white";
            controllo4=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo4=0;
    }
}

function checkVia(idText){
    var text = document.getElementById(idText).value;

    if(text.length > 4){
        document.getElementById(idText).style.backgroundColor = "lightgreen";
        controllo5=1;
    }
    else
    {
        document.getElementById(idText).style.backgroundColor = "white";
        controllo5=0;
    }
}

function checkNumCivico(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(!letteraMaiuscREGX.test(text) && !letteraMinREGX.test(text)){
        if(text.length > 0 ){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo6=1;
        }
        else{
            document.getElementById(idText).style.backgroundColor = "white";
            controllo6=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo6=0;
    }
}

function checkCap(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(!letteraMaiuscREGX.test(text) && !letteraMinREGX.test(text)){
        if(text.length == 5){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo7=1;
        }
        else
        {
            document.getElementById(idText).style.backgroundColor = "white";
            controllo7=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo7=0;
    }
}

function checkCognome(idText,idError){
    var text = document.getElementById(idText).value;

    var numberREGX = /[0-9]/;

    if(!numberREGX.test(text)){
        if(text.length > 3){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo8=1;
        }
        else
        {
            document.getElementById(idText).style.backgroundColor = "white";
            controllo8=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo8=0;
    }
}

function checkCitta(idText,idError){
    var text = document.getElementById(idText).value;

    var numberREGX = /[0-9]/;

    if(!numberREGX.test(text)){
        if(text.length > 3){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo9=1;
        }
        else
        {
            document.getElementById(idText).style.backgroundColor = "white";
            controllo9=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo9=0;
    }
}

function checkButton(){
    if(controllo1==1 && controllo2==1 && controllo3==1 && controllo4==1 && controllo5==1 && controllo6==1 && controllo7==1 && controllo8==1 && controllo9==1){
        document.getElementById("bottone").style.visibility = "visible";
        document.getElementById("formCarta").action = "AggiungiCarta";
    }
    else{
        document.getElementById("bottone").style.visibility = "hidden";
        document.getElementById("formCarta").action = "";
    }
}
