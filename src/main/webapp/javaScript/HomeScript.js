function mostraMenu(idmenu, idfreccia){
    var j = document.getElementById(idmenu).style.visibility
    var f = document.getElementById(idfreccia).style.transform
    if( j == "visible") {
        j = "hidden";
    }
    else {
        j = "visible";
    }
    if(f == "rotate(180deg)")
        f = "rotate(0deg)"
    else
        f = "rotate(180deg)"
    document.getElementById(idmenu).style.visibility = j
    document.getElementById(idfreccia).style.transform = f
}

function barEffect(){
    if(window.pageYOffset != 0){
        document.getElementById("navBar").style.width = "100%";

        document.getElementById("navBar").style.top = "0";
        document.getElementById("navBar").style.left = "0";

        document.getElementById("navBar").style.borderRadius = "0px"
        document.getElementById("risultatiAjax").style.top = "43px";
    }
    else{
        document.getElementById("navBar").style.width = "99%";
        document.getElementById("navBar").style.top = "8px";
        document.getElementById("navBar").style.left = "6px";
        document.getElementById("navBar").style.borderRadius = "6px";
        document.getElementById("risultatiAjax").style.top = "51px";
    }
}

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
                document.getElementById(s+(t+1)).style.visibility = "hidden";
                document.getElementById("risultatiAjax").style.visibility = "hidden";
            }
            if(data === "Nessun risultato"){
                document.getElementById(s+1).innerText = data;
                document.getElementById(s+1).href = "undefined";
                document.getElementById(s+1).style.visibility = "visible";
            }
            else{
                var list = JSON.parse(data);
                document.getElementById("risultatiAjax").style.visibility = "visible";
                document.getElementById("risultatiAjax").style.backgroundColor = "white";
                document.getElementById("risultatiAjax").style.height = list.length*43 + "px";
                for(var j=0; j<list.length; j++){
                    if(j>10)
                        continue;
                    document.getElementById(s+(j+1)).style.visibility = "visible";
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

function hiddenRisultatiAjax(){
    var s = "risultato";
    for(var t=0; t<10; t++){
        document.getElementById(s+(t+1)).innerText = "undefined";
        document.getElementById(s+(t+1)).href = "undefined";
        document.getElementById(s+(t+1)).style.visibility = "hidden";
        document.getElementById("risultatiAjax").style.visibility = "hidden";
    }
}