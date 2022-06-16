function mostraAVmenu(){
    if(document.getElementById("menuAvanzato").style.visibility == "hidden")
        document.getElementById("menuAvanzato").style.visibility = "visible";
    else
        document.getElementById("menuAvanzato").style.visibility = "hidden";
}

function barEffect(){
    if(window.pageYOffset != 0){
        document.getElementById("navBar").style.top = "0";
        document.getElementById("navBar").style.left = "0";
        document.getElementById("navBar").style.borderRadius = "0px"
    }
    else{
        document.getElementById("navBar").style.top = "8px";
        document.getElementById("navBar").style.left = "6px";
        document.getElementById("navBar").style.borderRadius = "6px"
    }
}

function selectedPiattaforma(bottone, piattaforma){
    if(document.getElementById(piattaforma).value == "false"){
        document.getElementById(piattaforma).value = "true";
        bottone.style.opacity = "0.5";
    }
    else{
        document.getElementById(piattaforma).value = "false";
        bottone.style.opacity = "1";
    }
}

function showminmax(val, idlabel){
    document.getElementById(idlabel).innerHTML = val;
}


