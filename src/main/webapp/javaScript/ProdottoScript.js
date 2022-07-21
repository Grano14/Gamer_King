function changeImmagine(idScelta,idVisualizzazione){

    var img = document.getElementById(idScelta).src;

    document.getElementById(idVisualizzazione).src = img;
}