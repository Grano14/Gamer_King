//funzione per gestire l'effetto della barra di navigazione quando si  scorre in basso la pagina
function secondBarEffect(){
    if(window.pageYOffset != 0){
        document.getElementById("fasiAcq").style.top = "50px";
    }
    else{
        document.getElementById("fasiAcq").style.top="60px";
    }
}

//funzione per il controlle se il numero di copie da acquistare è un numero positivo
function checkQuantitaPositive(){
    //lista di numero copie per ogni prodotto
    const rec = document.getElementsByClassName("inputNumber");
    var azione = document.getElementById("acquistoCarrello").action;
    var visibilita = document.getElementById("errore").style.visibility;
    azione = "AcquistoCarrello";
    visibilita = "hidden";
    for (let i = 0; i < rec.length; i++) {
        if(rec[i].value<0){
            rec[i].style.backgroundColor = "lightpink";
            azione = "";
            visibilita = "visible";
        }
        else{
            rec[i].style.backgroundColor = "white";
        }
    }
    document.getElementById("acquistoCarrello").action = azione;
    document.getElementById("errore").style.visibility = visibilita;
}