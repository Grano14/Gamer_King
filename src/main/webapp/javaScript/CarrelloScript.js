//imposta lunghezza pagina in base al numero di prodotti nel carrello e imposta la scritta se il carrello ha elementi o è vuoto
function corpoCarrello(altezza){
    if(altezza == 0) {
        document.getElementById("testoCarrello").innerHTML = "IL TUO CARRELLO É VUOTO"
        document.getElementById("oggettiCarrello").style.height = "100px"
    }
    else {
        document.getElementById("testoCarrello").innerHTML = "IL TUO CARRELLO"
        var j = (altezza + 1)*200
        document.getElementById("oggettiCarrello").style.height = j
    }
}