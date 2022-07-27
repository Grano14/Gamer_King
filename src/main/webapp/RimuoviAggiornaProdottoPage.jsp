<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 22/07/2022
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Aggiorna/Rimuovi prodotto</title>
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <link rel="stylesheet" type="text/css" href="css/RimuoviAggiungiProductStyle.css">
    <link rel="stylesheet" type="text/css" href="css/AggiungiGiocoStyle.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="javaScript/AggiungiGiocoScript.js"></script>
</head>
<body>
<h1>AGGIORNA/RIMUOVI VIDEOGIOCO</h1>
<a href="AdminPage.jsp" style="text-decoration:none;">
    <p id="admin">Admin</p>
</a>

<div id="dati">
    <p>Carica videogioco da modificare</p>
    <select name="gioco" id="nomeGioco" style="width: 400px">
        <%
            ArrayList<Prodotto> l = (ArrayList<Prodotto>) request.getAttribute("prodotti");
            int i;
            for(i=0; i<l.size(); i++){
        %>
        <option value="<%=l.get(i).getVideogioco()%>,<%=l.get(i).getPiattaforma()%>"><%=l.get(i).getVideogioco()%> per <%=l.get(i).getPiattaforma()%> <%if(l.get(i).isVisibilita()){%>(VISIBILE)<%}else{%>(NASCOSTO)<%}%></option>
        <%}%>
    </select>
    <input type="button" class="bottoniCarica" onclick="uu()" value="CARICA"><br>
    <a href="" id="nascondi" class="bottoniCarica" style="visibility: hidden;margin-top: 5px">NASCONDI</a>
    <a href="" id="mostra" class="bottoniCarica" style="visibility: hidden;margin-top: 5px">MOSTRA</a>
    <br>

<form  action="UpdateProdotto" method="post" id="formGioco" STYLE="display: block" enctype="multipart/form-data" >

    <input type="hidden" id="titolo" name="titolo" value="">
    <input type="hidden" id="piattaforma" name="piattaforma" value="">

    <div id="gioco" class="forms">

        <textarea id="descrizione" name="desc" placeholder="Inserisci una descrizione..."
                  onkeyup="validateDescription('descrizione'),checkButtonUpdateGame()"></textarea><br>

        <p>Seleziona generi</p>
        <input type="checkbox" value="Avventura" id="avventura" name="c1" onclick="checkButtonUpdateGame()">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="Fantasy" id="fantasy" name="c2" onclick="checkButtonUpdateGame()">
        <label for="fantasy">Fantasy</label>
        <input type="checkbox" value="Horror" id="horror" name="c3" onclick="checkButtonUpdateGame()">
        <label for="horror">Horror</label><br>
        <input type="checkbox" value="Sci-fi" id="sci-fi" name="c4" onclick="checkButtonUpdateGame()">
        <label for="sci-fi">Sci-Fi</label>
        <input type="checkbox" value="Sparatutto" id="sparatutto" name="c5" onclick="checkButtonUpdateGame()">
        <label for="sparatutto">Sparatutto</label>
        <input type="checkbox" value="Picchiaduro" id="picchiaduro" name="c6" onclick="checkButtonUpdateGame()">
        <label for="picchiaduro">Picchiaduro</label><br>
        <input type="checkbox" value="Sopravvivenza" id="sopravvivenza" name="c7" onclick="checkButtonUpdateGame()">
        <label for="sopravvivenza">Sopravvivenza</label>
        <input type="checkbox" value="Stelth" id="stelth" name="c8" onclick="checkButtonUpdateGame()">
        <label for="stelth">Stelth</label>
        <input type="checkbox" value="Rpg" id="rpg" name="c9" onclick="checkButtonUpdateGame()">
        <label for="rpg">Rpg</label><br>
        <input type="checkbox" value="J-rpg" id="jrpg" name="c10" onclick="checkButtonUpdateGame()">
        <label for="jrpg">J-Rpg</label>
        <input type="checkbox" value="Action" id="action" name="c11" onclick="checkButtonUpdateGame()">
        <label for="action">Action</label>
        <input type="checkbox" value="Simulazione" id="simulazione" name="c12" onclick="checkButtonUpdateGame()">
        <label for="simulazione">Simulazione</label><br>
        <input type="checkbox" value="Strategia" id="strategia" name="c13" onclick="checkButtonUpdateGame()">
        <label for="strategia">strategia</label>
        <input type="checkbox" value="Roughlik" id="roughlik" name="c14" onclick="checkButtonUpdateGame()">
        <label for="roughlik">Roughlik</label>
        <input type="checkbox" value="Open world" id="openworld" name="c15" onclick="checkButtonUpdateGame()">
        <label for="openworld">Open World</label><br>

        <p>Carica immagine 1</p>
        <label id="labl1" class="custom-file-upload">
            <input type="file" name="immagine1" id="ii" multiple oninput="verde('labl1'),checkButtonGame(), checkPicture(), readURL(this, 'img1')" >
            Aggiorna
        </label>
        <img id="img1" style="border-radius: 6px" src="">
        <p>Carica immagine 2</p>
        <label id="labl2" class="custom-file-upload">
            <input type="file" name="immagine2" multiple oninput="verde('labl2'),checkButtonGame(), readURL(this, 'img2')">
            Aggiorna
        </label>
        <img id="img2" style="border-radius: 6px" src="">
        <p>Carica immagine 3</p>
        <label id="labl3" class="custom-file-upload">
            <input type="file" name="immagine3" multiple oninput="verde('labl3'),checkButtonGame(), readURL(this, 'img3')">
            Aggiorna
        </label>
        <img id="img3" style="border-radius: 6px" src=""><br><br>

        <label for="prezzo">Prezzo</label><br>
        <input type="text" id="prezzo" name="prezzo" placeholder="Prezzo" onkeyup="validateNumeri('prezzo'),
            checkButtonUpdateGame()"><br>

        <label for="data">Data di uscita</label><br>
        <input id="data" type="date" name="data" oninput="verdeData('data'),checkButtonUpdateGame()"><br>
        <div id="bottoneGioco">
            <input type="submit" value="Aggiorna gioco">
        </div>

    </div>
</form>
</div>
<script>
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
                }
                if(n.generi.includes("Fantasy")){
                    document.getElementById("fantasy").checked = true;
                }
                if(n.generi.includes("Horror")){
                    document.getElementById("horror").checked = true;
                }
                if(n.generi.includes("Sci-fi")){
                    document.getElementById("sci-fi").checked = true;
                }
                if(n.generi.includes("Sparatutto")){
                    document.getElementById("sparatutto").checked = true;
                }
                if(n.generi.includes("Picchiaduro")){
                    document.getElementById("picchiaduro").checked = true;
                }
                if(n.generi.includes("Sopravvivenza")){
                    document.getElementById("sopravvivenza").checked = true;
                }
                if(n.generi.includes("Stelth")){
                    document.getElementById("stelth").checked = true;
                }
                if(n.generi.includes("Rpg")){
                    document.getElementById("rpg").checked = true;
                }
                if(n.generi.includes("J-rpg")){
                    document.getElementById("jrpg").checked = true;
                }
                if(n.generi.includes("Action")){
                    document.getElementById("action").checked = true;
                }
                if(n.generi.includes("Simulazione")){
                    document.getElementById("simulazione").checked = true;
                }
                if(n.generi.includes("Strategia")){
                    document.getElementById("strategia").checked = true;
                }
                if(n.generi.includes("Roughlik")){
                    document.getElementById("roughlik").checked = true;
                }
                if(n.generi.includes("Open world")){
                    document.getElementById("openworld").checked = true;
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

</script>
<p id="cc"></p>
</body>
</html>
