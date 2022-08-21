function mostraMenu(idmenu, idfreccia){
    var j = document.getElementById(idmenu).style.visibility
    var f = document.getElementById(idfreccia).style.transform
    if( j == "visible") {
        j = "hidden";
    }
    else {
        j = "visible";
    }
    if(f == "rotate(180deg)")
        f = "rotate(0deg)"
    else
        f = "rotate(180deg)"
    document.getElementById(idmenu).style.visibility = j
    document.getElementById(idfreccia).style.transform = f
}

function barEffect(){
    if(window.pageYOffset != 0){
        document.getElementById("navBar").style.width = "100%";

        document.getElementById("navBar").style.top = "0";
        document.getElementById("navBar").style.left = "0";

        document.getElementById("navBar").style.borderRadius = "0px"
    }
    else{
        document.getElementById("navBar").style.width = "99%";
        document.getElementById("navBar").style.top = "8px";
        document.getElementById("navBar").style.left = "6px";
        document.getElementById("navBar").style.borderRadius = "6px"
    }
}

function selectedPiattaforma(bottone, piattaforma){
    if(document.getElementById(piattaforma).value == "false"){
        document.getElementById(piattaforma).value = piattaforma;
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

function sectionLight(n){
    var line = (n*200)+70;
    if(window.pageYOffset < line){
        document.getElementById("fase1").style.color = "white";
        document.getElementById("fase2").style.color = "black";
        document.getElementById("fase3").style.color = "black";
    }
    if(window.pageYOffset > line){
        document.getElementById("fase1").style.color = "black";
        document.getElementById("fase2").style.color = "white";
        document.getElementById("fase3").style.color = "black";
    }
}
