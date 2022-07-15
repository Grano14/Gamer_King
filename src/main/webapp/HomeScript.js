function mostraMenu(idmenu, idfreccia){
    var j = document.getElementById(idmenu).style.visibility
    if( j == "hidden") {
        document.getElementById(idmenu).style.visibility = "visible";
    }
    else {
        document.getElementById(idmenu).style.visibility = "hidden";
    }
    if(document.getElementById(idfreccia).style.transform == "rotate(0deg)")
        document.getElementById(idfreccia).style.transform = "rotate(180deg)"
    else
        document.getElementById(idfreccia).style.transform = "rotate(0deg)"
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


