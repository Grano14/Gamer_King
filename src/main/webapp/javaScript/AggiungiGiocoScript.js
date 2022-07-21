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
    var style = document.getElementById(id).style.display;
    if(style == "block")
        style = "none";
    else
        style = "block";
    document.getElementById(id).style.display = style;

}

function verde(id){
    document.getElementById(id).style.backgroundColor = "green";
}
