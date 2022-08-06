var controllo1 = 0;
var controllo2,controllo3;
var controllo4 = 0;

function checkedBox(idInput){

    if(document.getElementById(idInput).checked)
        controllo1++;
    else
        controllo1--;
}

function verde(id){
    document.getElementById(id).style.backgroundColor = "green";
    controllo4++;
}

function verdeData(id){
    document.getElementById(id).style.backgroundColor = "lightgreen";
}

function validateTitle(idInput){
    var nome = document.getElementById(idInput).value;
    if(nome.length > 1){
        document.getElementById(idInput).style.backgroundColor = "lightgreen";
        controllo2 = 1;
    }
    else{
        document.getElementById(idInput).style.backgroundColor = "lightpink";
        controllo2 = 0;
    }
}

function validateDescription(idInput){
    var nome = document.getElementById(idInput).value;
    if(nome.length > 25){
        document.getElementById(idInput).style.backgroundColor = "lightgreen";
        controllo3 = 1;
    }
    else{
        document.getElementById(idInput).style.backgroundColor = "lightpink";
        controllo3 = 0;
    }
}

function checkButtonGame(){
    if(controllo2 == 1 && controllo3 == 1 && controllo4 >= 3 && controllo1 > 0)
    {
        document.getElementById("bottoneGioco").style.visibility = "visible";
        document.getElementById("formGioco").action = "AggiungiGioco";
    }
    else
    {
        document.getElementById("bottoneGioco").style.visibility = "hidden";
        document.getElementById("formGioco").action = "";
    }
}

var controllo5,controllo6;

function checkButtonUpdateGame(){
    if(controllo3 == 1 && controllo4 >= 3 && controllo1 > 0 && controllo5 == 1 && controllo6 == 1)
    {
        document.getElementById("bottoneGioco").style.visibility = "visible";
        document.getElementById("formGioco").action = "UpdateProdotto";
    }
    else
    {
        document.getElementById("bottoneGioco").style.visibility = "hidden";
        document.getElementById("formGioco").action = "";
    }
}

function validateNumeri(id){
    var numero = document.getElementById(id).value;
    if(numero >= 0 && !(isNaN(numero))) {
        document.getElementById(id).style.backgroundColor = "lightgreen";
    }
    else{
        document.getElementById(id).style.backgroundColor = "lightpink";
    }
}

function validateLista(id){
    var nome = document.getElementById(id).value;
    if(nome != "none"){
        document.getElementById(id).style.backgroundColor = "lightgreen";
    }
    else{
        document.getElementById(id).style.backgroundColor = "lightpink";
    }
}

function checkButtonProdotto(){
    if(document.getElementById("prezzo").style.backgroundColor == "lightgreen"
        && document.getElementById("selectPiattaforma").style.backgroundColor == "lightgreen"
        && document.getElementById("selectGioco").style.backgroundColor == "lightgreen"
        && document.getElementById("data").style.backgroundColor == "lightgreen"
        && document.getElementById("copie").style.backgroundColor == "lightgreen"
    )
    {
        document.getElementById("bottoneProdotto").style.visibility = "visible";
        document.getElementById("formProdotto").action = "AggiungiCopia";
    }
    else
    {
        document.getElementById("bottoneProdotto").style.visibility = "hidden";
        document.getElementById("formProdotto").action = "";
    }
}

function checkPicture(){
    document.getElementById("cc").innerText = document.getElementById("ii").value;
}

function readURL(input, id) {
    var idJQuery = "#"+id;
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $(idJQuery)
                .attr('src', e.target.result)
                .width(150)
                .height(100);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

function uu(){
    var nome = document.getElementById("nomeGioco").value;
    var t = nome.substr(0, nome.indexOf(","));
    document.getElementById("titolo").value = t;
    var p = nome.substr(nome.indexOf(",")+1, nome.length)
    document.getElementById("piattaforma").value = p;
    $.ajax({
        url: "InterrogazioneDB",
        type: 'POST',
        data: {
            titolo: t,
            piattaforma: p,
            tipo: "dati"},
        success: function (data) {
            document.getElementById("nascondi").style.visibility = "hidden";
            document.getElementById("mostra").style.visibility = "hidden";
            var n = JSON.parse(data);
            controllo3 =1;
            controllo4 = 3;
            controllo5 = 1;
            controllo6 = 1;
            document.getElementById("img1").style.height = "100px";
            document.getElementById("img2").style.height = "100px";
            document.getElementById("img3").style.height = "100px";
            document.getElementById("img1").style.width = "150px";
            document.getElementById("img2").style.width = "150px";
            document.getElementById("img3").style.width = "150px";
            document.getElementById("img1").src = n.immagine1;
            document.getElementById("img2").src = n.immagine2;
            document.getElementById("img3").src = n.immagine3;
            document.getElementById("prezzo").value = n.prezzo;
            document.getElementById("data").value = n.dataUscita;
            if(n.visibilita == "true"){
                document.getElementById("nascondi").style.visibility = "visible";
                document.getElementById("nascondi").href = "GestioneVisibilita?titolo=" + t + "&piattaforma=" + p + "&visibilita=nascondi";
            }
            else{
                document.getElementById("mostra").style.visibility = "visible";
                document.getElementById("mostra").href = "GestioneVisibilita?titolo=" + t + "&piattaforma=" + p + "&visibilita=mostra";
            }

            if(n.generi.includes("Avventura")){
                document.getElementById("avventura").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Fantasy")){
                document.getElementById("fantasy").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Horror")){
                document.getElementById("horror").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Sci-fi")){
                document.getElementById("sci-fi").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Sparatutto")){
                document.getElementById("sparatutto").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Picchiaduro")){
                document.getElementById("picchiaduro").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Sopravvivenza")){
                document.getElementById("sopravvivenza").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Stelth")){
                document.getElementById("stelth").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Rpg")){
                document.getElementById("rpg").checked = true;
                controllo1++;
            }
            if(n.generi.includes("J-rpg")){
                document.getElementById("jrpg").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Action")){
                document.getElementById("action").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Simulazione")){
                document.getElementById("simulazione").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Strategia")){
                document.getElementById("strategia").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Roughlik")){
                document.getElementById("roughlik").checked = true;
                controllo1++;
            }
            if(n.generi.includes("Open world")){
                document.getElementById("openworld").checked = true;
                controllo1++;
            }
        }
    });
    $.ajax({
        url:"InterrogazioneDB",
        type:'POST',
        data:{
            titolo: t,
            piattaforma: p,
            tipo: "desc"},
        success: function(data){
            document.getElementById("descrizione").value = data;
        }
    });
}