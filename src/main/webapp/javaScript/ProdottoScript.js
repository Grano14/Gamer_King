function changeImmagine(idScelta,idVisualizzazione){

    var img = document.getElementById(idScelta).src;

    document.getElementById(idVisualizzazione).src = img;
}

var controllo1,controllo2;

function validateRecensione(idInput){
    var nome = document.getElementById(idInput).value;
    if(nome.length > 2 && nome.length < 300){
        controllo1 = 1;
    }
    else{
        controllo1 = 0;
    }
}

function checkRecensione(){
    if(
        controllo1 == 1 && document.getElementById("nStelle").value != "0"
    )
        document.getElementById("submitRecensione").style.visibility = "visible";
    else
        document.getElementById("submitRecensione").style.visibility = "hidden";
}

