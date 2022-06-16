function mostraAVmenu(){
    if(document.getElementById("menuRicerca").style.visibility == "hidden")
        document.getElementById("menuRicerca").style.visibility = "visible";
    else
        document.getElementById("menuRicerca").style.visibility = "hidden";
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




