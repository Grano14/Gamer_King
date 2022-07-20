function seeInput(id, id1){
    if(document.getElementById(id).style.height == "70px") {
        document.getElementById(id).style.height = "500px";
        document.getElementById(id1).style.visibility = "visible";
    }
    else {
        document.getElementById(id).style.height = "70px";
        document.getElementById(id1).style.visibility = "hidden";
    }
}

function mostraENascondi(id){
    if(document.getElementById(id).style.display == "none") {
        document.getElementById(id).style.display = "block";
    }
    else {
        document.getElementById(id).style.display = "none"
    }
}