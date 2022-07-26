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

function mostraRecensioni(){

    const rec = document.getElementsByClassName("recensioneNonVisibile");
    var bottone = document.getElementById("nascondiRecensioni").style.display;
    var bottone1 = document.getElementById("mostraRecensioni").style.display;

    bottone = "block";
    bottone1 = "none";

    for (let i = 0; i < rec.length; i++) {
        rec[i].style.display = "block";
    }

    document.getElementById("nascondiRecensioni").style.display = bottone;
    document.getElementById("mostraRecensioni").style.display = bottone1;

}

function nascondiRecensioni(){

    const rec = document.getElementsByClassName("recensioneNonVisibile");
    var bottone = document.getElementById("mostraRecensioni").style.display;
    var bottone1 = document.getElementById("nascondiRecensioni").style.display;

    bottone = "block";
    bottone1 = "none";

    for (let i = 0; i < rec.length; i++) {
        rec[i].style.display = "none";
    }

    document.getElementById("mostraRecensioni").style.display = bottone;
    document.getElementById("nascondiRecensioni").style.display = bottone1;

}

