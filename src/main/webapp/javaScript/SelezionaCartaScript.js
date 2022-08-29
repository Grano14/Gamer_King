function updateQuantita(){
    const rec = document.getElementsByClassName("quantita");
    var quantita =document.getElementById("quant").value;

    for (let i = 0; i < rec.length; i++) {
        rec[i].value = quantita;
    }

}

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
        document.getElementById("acquistaProdotto").action = "";
    }
}