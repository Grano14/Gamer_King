//funzione per far ruotare le frecce
function ruota(idfreccia){
    var f = document.getElementById(idfreccia).style.transform;
    if(f == "rotate(180deg)")
        f = "rotate(0deg)"
    else
        f = "rotate(180deg)"
    document.getElementById(idfreccia).style.transform = f
}

//funzione per modificare la barra allo scroll della pagina
function barEffect(){
    if(window.pageYOffset != 0){
        document.getElementById("navBar").style.width = "100%";
        document.getElementById("risultatiAjax").style.left = "8%";
        document.getElementById("risultatiAjax").style.width = "35.3%";
        document.getElementById("navBar").style.top = "0";
        document.getElementById("navBar").style.left = "0";

        document.getElementById("navBar").style.borderRadius = "0px"
        document.getElementById("risultatiAjax").style.top = "43px";
    }
    else{
        document.getElementById("navBar").style.width = "95%";
        document.getElementById("navBar").style.top = "8px";
        document.getElementById("navBar").style.left = "30px";
        document.getElementById("navBar").style.borderRadius = "6px";
        document.getElementById("risultatiAjax").style.top = "51px";
        document.getElementById("risultatiAjax").style.left = "9.7%";
        document.getElementById("risultatiAjax").style.width = "33.3%";
    }
}
//funzione per reggolare la lista di ricerca in corrispondenza del form
function researchEffect(){
    if(window.pageYOffset == 0){
        if(window.innerWidth > 700 && window.innerWidth < 1000){
            document.getElementById("risultatiAjax").style.left = "11%";
        }
        if(window.innerWidth > 1000){
            document.getElementById("risultatiAjax").style.left = "9.7%";
        }
        if(window.innerWidth > 1000 && window.innerWidth < 1250){
            document.getElementById("risultatiAjax").style.left = "10.5%";
        }
        if(window.innerWidth > 500 && window.innerWidth < 700){
            document.getElementById("risultatiAjax").style.left = "13%";
        }
    }
}

function menuEffect(){
    if(window.pageYOffset != 0)
        document.getElementById("menuAvanzato").style.top = "50px";
    else
        document.getElementById("menuAvanzato").style.top = "60px";
}
//verifica le piattaforme che sono state selezionate
function selectedPiattaforma(bottone, piattaforma){
    if(document.getElementById(piattaforma).value == "false"){
        document.getElementById(piattaforma).value = piattaforma;
        bottone.style.opacity = "0.5";
    }
    else{
        document.getElementById(piattaforma).value = "false";
        bottone.style.opacity = "1";
    }
}

function showminmax(val, idlabel){
    document.getElementById(idlabel).innerHTML = val;
}
//prodotti-fatturazione-fatto sezioni acquisto
function sectionLight(n){
    var line = (n*200)+70;
    if(window.pageYOffset < line){
        document.getElementById("fase1").style.color = "white";
        document.getElementById("fase2").style.color = "black";
        document.getElementById("fase3").style.color = "black";
    }
    if(window.pageYOffset > line){
        document.getElementById("fase1").style.color = "black";
        document.getElementById("fase2").style.color = "white";
        document.getElementById("fase3").style.color = "black";
    }
}

//funzione per la ricerca dei giochi
function ricerca(){
    var valore = document.getElementById("searchBar").value;
    $.ajax({
        url: "RisultatiAjax",
        type: 'POST',
        data:{
            val: valore
        },
        success: function(data){
            var s = "risultato";
            for(var t=0; t<10; t++){
                document.getElementById(s+(t+1)).innerText = "undefined";
                document.getElementById(s+(t+1)).href = "undefined";
                document.getElementById(s+(t+1)).style.display = "none";
                document.getElementById("risultatiAjax").style.display = "none";
            }
            if(data === "Nessun risultato"){
                document.getElementById(s+1).innerText = data;
                document.getElementById(s+1).href = "undefined";
                document.getElementById(s+1).style.diplay = "block";
            }
            else{
                var list = JSON.parse(data);
                document.getElementById("risultatiAjax").style.display = "block";
                for(var j=0; j<list.length; j++){
                    if(j>10)
                        continue;
                    document.getElementById(s+(j+1)).style.display = "block";
                    document.getElementById(s+(j+1)).innerText = list[j].nome;
                    if(list[j].piattaforma === "playstation4"){
                        document.getElementById(s+(j+1)).innerHTML += "<img style='margin-left: 10px' src='css/pictures/ps430.png'>";
                    }
                    if(list[j].piattaforma === "playstation5"){
                        document.getElementById(s+(j+1)).innerHTML += "<img style='margin-left: 10px' src='css/pictures/ps530.png'>";
                    }
                    if(list[j].piattaforma === "pc"){
                        document.getElementById(s+(j+1)).innerHTML += "<img style='margin-left: 10px' src='css/pictures/pc30.png'>";
                    }
                    if(list[j].piattaforma === "switch"){
                        document.getElementById(s+(j+1)).innerHTML += "<img style='margin-left: 10px' src='css/pictures/switch30.png'>";
                    }
                    if(list[j].piattaforma === "xbox1"){
                        document.getElementById(s+(j+1)).innerHTML += "<img style='margin-left: 10px' src='css/pictures/xboxone30.png'>";
                    }
                    if(list[j].piattaforma === "xboxX"){
                        document.getElementById(s+(j+1)).innerHTML += "<img style='margin-left: 10px' src='css/pictures/xboxonex30.png'>";
                    }
                    document.getElementById(s+(j+1)).href = "CaricaProdotto?titolo=" + list[j].nome + "&piattaforma=" + list[j].piattaforma;
                }
            }
        }
    })
}
//imposta i risultati della ricerca non visibili prima di effettuare una nuova ricerca
function hiddenRisultatiAjax(){
    var s = "risultato";
    for(var t=0; t<10; t++){
        document.getElementById(s+(t+1)).innerText = "undefined";
        document.getElementById(s+(t+1)).href = "undefined";
        document.getElementById(s+(t+1)).style.display = "none";
        document.getElementById("risultatiAjax").style.display = "none";
    }
}
//funzione che gestisce il click del form nascondendo i risultati
function toggleSerch(){
    var visibilita = document.getElementById("risultatiAjax").style.display;
    var lunghezza = document.getElementById("searchBar").value;

    if(visibilita=="block" && lunghezza.length==0)
        visibilita = "none";

    document.getElementById("risultatiAjax").style.display=visibilita;
}

//nasconde i risultati ajax quando clicchi sugli strumenti e quando essa è aperta se clicchi in qualsiasi punto dello schermo scompare
function hideAjax(){
    var visibilita = document.getElementById("risultatiAjax").style.display;

    if(visibilita=="block")
        visibilita = "none";

    document.getElementById("risultatiAjax").style.display=visibilita;
}