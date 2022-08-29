
function secondBarEffect(){
    if(window.pageYOffset != 0){
        document.getElementById("fasiAcq").style.top = "50px";
    }
    else{
        document.getElementById("fasiAcq").style.top="60px";
    }
}

function checkQuantitaPositive(){
    const rec = document.getElementsByClassName("inputNumber");
    var azione = document.getElementById("acquistoCarrello").action;
    azione = "AcquistoCarrello";
    for (let i = 0; i < rec.length; i++) {
        if(rec[i].value<0)
            azione = "";
    }
    document.getElementById("acquistoCarrello").action = azione;
}