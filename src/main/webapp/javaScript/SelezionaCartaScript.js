function updateQuantita(){
    const rec = document.getElementsByClassName("quantita");
    var quantita =document.getElementById("quant").value;

    for (let i = 0; i < rec.length; i++) {
        rec[i].value = quantita;
    }

}

function checkQuantita(){
    var value = document.getElementById("").value;
    var error = document.getElementById("errore").style.display;

    if(value<1){
        document.getElementById("errore").style.display = "block";
        document.getElementById("acquistaProdotto").action = "";
    }
    else
    {
        document.getElementById("errore").style.display = "none";
        document.getElementById("acquistaProdotto").action = "";
    }
}