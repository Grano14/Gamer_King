
//questa funzione controlla la correttezza dell'input immagine nelle pagine utente, impostazione e admin
function chekImmagineUtente(id,id2){
    //imposta il colore della label a verde, inserisce l'azione del form e imposta il bottone a visibile
    document.getElementById(id).style.backgroundColor = "green";
    document.getElementById(id2).action = "AggiornaImmagineUtente";
    document.getElementById("bottoneImmagine").style.visibility = "visible";
}