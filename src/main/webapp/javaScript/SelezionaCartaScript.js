
//questa funzione controlla la quantità delle copie da acquistare per l'acquisto singolo
function checkQuantita(){
    var valore = document.getElementById("quant").value;

    if(valore<1){
        document.getElementById("quant").style.backgroundColor = "lightpink";
        document.getElementById("errore").style.visibility = "visible";
        document.getElementById("acquistaProdotto").action = "";
    }
    else
    {
        document.getElementById("quant").style.backgroundColor = "white";
        document.getElementById("errore").style.visibility = "hidden";
        document.getElementById("acquistaProdotto").action = "AcquistoSingolo";
    }
}