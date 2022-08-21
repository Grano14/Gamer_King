var controllo1=1;
var controllo2=1;
var controllo3=1;
var controllo4=1;


function checkVia(idText){
    var text = document.getElementById(idText).value;

    if(text.length > 4){
        document.getElementById(idText).style.backgroundColor = "lightgreen";
        controllo1=1;
    }
    else
    {
        document.getElementById(idText).style.backgroundColor = "white";
        controllo1=0;
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

function checkCap(idText,idError){
    var text = document.getElementById(idText).value;

    var letteraMaiuscREGX = /[A-Z]/;
    var letteraMinREGX = /[a-z]/;
    if(!letteraMaiuscREGX.test(text) && !letteraMinREGX.test(text)){
        if(text.length == 5){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo3=1;
        }
        else
        {
            document.getElementById(idText).style.backgroundColor = "white";
            controllo3=0;
        }
    }
    else{
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idError).style.display = "block";
        controllo3=0;
    }
}

function checkCitta(idText,idError){
    var text = document.getElementById(idText).value;

    var numberREGX = /[0-9]/;

    if(!numberREGX.test(text)){
        if(text.length > 3){
            document.getElementById(idText).style.backgroundColor = "lightgreen";
            document.getElementById(idError).style.display = "none";
            controllo4=1;
        }
        else
        {
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


function checkUpdateButton(){
    if(controllo1==1 && controllo2==1 && controllo3==1 && controllo4==1){
        document.getElementById("formModificaCarta").action = "UpdateSottoscrivere";
    }
    else{
        document.getElementById("formModificaCarta").action = "ModificaCarta";
    }
}