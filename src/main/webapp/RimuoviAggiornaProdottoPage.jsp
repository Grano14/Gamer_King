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

<form  action="" method="POST" id="formGioco" STYLE="display: block" enctype="multipart/form-data" >

    <input type="hidden" id="titolo" name="titolo" value="">
    <input type="hidden" id="piattaforma" name="piattaforma" value="">

    <div id="gioco" class="forms">

        <textarea id="descrizione" name="desc" placeholder="Inserisci una descrizione..."
                  onkeyup="validateDescription('descrizione'),checkButtonUpdateGame()"></textarea><br>

        <p>Seleziona generi</p>
        <input type="checkbox" value="Avventura" id="avventura" name="c1" onclick="checkedBox('avventura'),checkButtonUpdateGame()">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="Fantasy" id="fantasy" name="c2" onclick="checkedBox('fantasy'),checkButtonUpdateGame()">
        <label for="fantasy">Fantasy</label>
        <input type="checkbox" value="Horror" id="horror" name="c3" onclick="checkedBox('horror'),checkButtonUpdateGame()">
        <label for="horror">Horror</label><br>
        <input type="checkbox" value="Sci-fi" id="sci-fi" name="c4" onclick="checkedBox('sci-fi'),checkButtonUpdateGame()">
        <label for="sci-fi">Sci-Fi</label>
        <input type="checkbox" value="Sparatutto" id="sparatutto" name="c5" onclick="checkedBox('sparatutto'),checkButtonUpdateGame()">
        <label for="sparatutto">Sparatutto</label>
        <input type="checkbox" value="Picchiaduro" id="picchiaduro" name="c6" onclick="checkedBox('picchiaduro'),checkButtonUpdateGame()">
        <label for="picchiaduro">Picchiaduro</label><br>
        <input type="checkbox" value="Sopravvivenza" id="sopravvivenza" name="c7" onclick="checkedBox('sopravvivenza'),checkButtonUpdateGame()">
        <label for="sopravvivenza">Sopravvivenza</label>
        <input type="checkbox" value="Stelth" id="stelth" name="c8" onclick="checkedBox('stelth'),checkButtonUpdateGame()">
        <label for="stelth">Stelth</label>
        <input type="checkbox" value="Rpg" id="rpg" name="c9" onclick="checkedBox('rpg'),checkButtonUpdateGame()">
        <label for="rpg">Rpg</label><br>
        <input type="checkbox" value="J-rpg" id="jrpg" name="c10" onclick="checkedBox('jrpg'),checkButtonUpdateGame()">
        <label for="jrpg">J-Rpg</label>
        <input type="checkbox" value="Action" id="action" name="c11" onclick="checkedBox('action'),checkButtonUpdateGame()">
        <label for="action">Action</label>
        <input type="checkbox" value="Simulazione" id="simulazione" name="c12" onclick="checkedBox('simulazione'),checkButtonUpdateGame()">
        <label for="simulazione">Simulazione</label><br>
        <input type="checkbox" value="Strategia" id="strategia" name="c13" onclick="checkedBox('strategia'),checkButtonUpdateGame()">
        <label for="strategia">strategia</label>
        <input type="checkbox" value="Roughlik" id="roughlik" name="c14" onclick="checkedBox('roughlik'),checkButtonUpdateGame()">
        <label for="roughlik">Roughlik</label>
        <input type="checkbox" value="Open world" id="openworld" name="c15" onclick="checkedBox('openworld'),checkButtonUpdateGame()">
        <label for="openworld">Open World</label><br>

        <p>Carica immagine 1</p>
        <label id="labl1" class="custom-file-upload">
            <input type="file" name="immagine1" id="ii" multiple oninput="verde('labl1'),checkButtonUpdateGame(), checkPicture(), readURL(this, 'img1')" >
            Aggiorna
        </label>
        <img id="img1" style="border-radius: 6px" src="">
        <p>Carica immagine 2</p>
        <label id="labl2" class="custom-file-upload">
            <input type="file" name="immagine2" multiple oninput="verde('labl2'),checkButtonUpdateGame(), readURL(this, 'img2')">
            Aggiorna
        </label>
        <img id="img2" style="border-radius: 6px" src="">
        <p>Carica immagine 3</p>
        <label id="labl3" class="custom-file-upload">
            <input type="file" name="immagine3" multiple oninput="verde('labl3'),checkButtonUpdateGame(), readURL(this, 'img3')">
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
<p id="cc"></p>
</body>
</html>
