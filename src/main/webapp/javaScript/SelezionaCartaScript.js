function updateQuantita(){
    const rec = document.getElementsByClassName("quantita");
    var quantita =document.getElementById("quant").value;

    for (let i = 0; i < rec.length; i++) {
        rec[i].value = quantita;
    }

}