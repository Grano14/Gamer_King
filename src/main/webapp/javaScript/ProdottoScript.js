//scambia l'immagine principale del prodotto con una di quelle selezionate
function changeImmagine(idScelta,idVisualizzazione){

    var img = document.getElementById(idScelta).src;

    document.getElementById(idVisualizzazione).src = img;
}

var controllo1,controllo2;

//controlla se la recensione inserita dall'utete è tra 2 e 300 caratteri
function validateRecensione(idInput){
    var nome = document.getElementById(idInput).value;
    if(nome.length > 2 && nome.length < 300){
        controllo1 = 1;
    }
    else{
        controllo1 = 0;
    }
}

//controlla se l'utente a votato e ha inserito del testo adeguato per inserire la recensione
function checkRecensione(){
    if(controllo1 == 1 && document.getElementById("nStelle").value != "0"){
        document.getElementById("submitRecensione").style.visibility = "visible";
        document.getElementById("formRecensione").action="AggiungiRecensione";
    }
    else{
        document.getElementById("submitRecensione").style.visibility = "hidden";
        document.getElementById("formRecensione").action="";
    }
}

//permette di visualizzare tutte le recensioni disponibili su un determinato prodotto
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

//permette di nascondere le recensione rese visibili da mostraRecensioni()
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
