function seeInput(id, id1){
    if(document.getElementById(id).style.height == "70px") {
        document.getElementById(id).style.height = "400px";
        document.getElementById(id1).style.visibility = "visible";
    }
    else {
        document.getElementById(id).style.height = "70px";
        document.getElementById(id1).style.visibility = "hidden";
    }
}