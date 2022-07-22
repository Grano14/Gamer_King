
function verde(id){
    document.getElementById(id).style.backgroundColor = "green";
}

function verdeData(id){
    document.getElementById(id).style.backgroundColor = "lightgreen";
}

function validateTitle(idInput){
    var nome = document.getElementById(idInput).value;
    if(nome.length > 1){
        document.getElementById(idInput).style.backgroundColor = "lightgreen";
    }
    else{
        document.getElementById(idInput).style.backgroundColor = "lightpink";
    }
}

function validateDescription(idInput){
    var nome = document.getElementById(idInput).value;
    if(nome.length > 25){
        document.getElementById(idInput).style.backgroundColor = "lightgreen";
    }
    else{
        document.getElementById(idInput).style.backgroundColor = "lightpink";
    }
}

function checkButtonGame(){
    if(document.getElementById("descrizione").style.backgroundColor == "lightgreen"
        && document.getElementById("titolo").style.backgroundColor == "lightgreen"
        && document.getElementById("labl1").style.backgroundColor == "green"
        && document.getElementById("labl2").style.backgroundColor == "green"
        && document.getElementById("labl3").style.backgroundColor == "green"
        && (document.getElementById("avventura").checked
            || document.getElementById("fantasy").checked
            || document.getElementById("horror").checked
            || document.getElementById("sci-fi").checked
            || document.getElementById("sparatutto").checked
            || document.getElementById("picchiaduro").checked
            || document.getElementById("sopravvivenza").checked
            || document.getElementById("stelth").checked
            || document.getElementById("rpg").checked
            ||document.getElementById("jrpg").checked
            ||document.getElementById("action").checked
            ||document.getElementById("simulazione").checked
            ||document.getElementById("strategia").checked
            ||document.getElementById("roughlik").checked
            ||document.getElementById("openworld").checked
        )
    )
    {
        document.getElementById("bottoneGioco").style.visibility = "visible";
    }
    else
        document.getElementById("bottoneGioco").style.visibility = "hidden";
}

function validateNumeri(id){
    var numero = document.getElementById(id).value;
    if(numero >= 0 && !(isNaN(numero))) {
        document.getElementById(id).style.backgroundColor = "lightgreen";
    }
    else{
        document.getElementById(id).style.backgroundColor = "lightpink";
    }
}

function validateLista(id){
    var nome = document.getElementById(id).value;
    if(nome.length > 1){
        document.getElementById(id).style.backgroundColor = "lightgreen";
    }
    else{
        document.getElementById(id).style.backgroundColor = "lightpink";
    }
}

function checkButtonProdotto(){
    if(document.getElementById("prezzo").style.backgroundColor == "lightgreen"
        && document.getElementById("selectPiattaforma").style.backgroundColor == "lightgreen"
        && document.getElementById("selectGioco").style.backgroundColor == "lightgreen"
        && document.getElementById("data").style.backgroundColor == "lightgreen"
        && document.getElementById("copie").style.backgroundColor == "lightgreen"
    )
    {
        document.getElementById("bottoneProdotto").style.visibility = "visible";
    }
    else
        document.getElementById("bottoneProdotto").style.visibility = "hidden";
}