<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Videogioco" %>
<%@ page import="model.VideogiocoDAO" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 07/07/2022
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin | Aggiungi gioco</title>
    <link rel="stylesheet" type="text/css" href="css/AggiungiGiocoStyle.css">
    <script type="text/javascript" src="javaScript/AggiungiGiocoScript.js"></script>

    <script>
        $(document).ready(function(){
            $("#aggiuntaTitolo").click(function(){
                $("#fg").toggle();
            });
        });
    </script>
</head>
<body>
<h1>AGGIUNGI VIDEOGIOCO</h1>
<p id="admin">Admin</p>
<div id="dati">

    <div class="aggiunta" onclick="mostraENascondi('formGioco')">
        <p>Aggiungi un nuovo titolo</p>
    </div>

<form id="formGioco" action="AggiungiGioco" method="post" enctype="multipart/form-data" >

    <div id="gioco">

        <input type="text" id="titolo" name="titolo" placeholder="Titolo del gioco"><br>
        <textarea id="descrizione" name="desc" placeholder="Inserisci una descrizione..."></textarea><br>
        <p>Seleziona generi</p>
        <input type="checkbox" value="Avventura" id="avventura" name="c1">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="Fantasy" id="fantasy" name="c2">
        <label for="fantasy">Fantasy</label>
        <input type="checkbox" value="Horror" id="horror" name="c3">
        <label for="horror">Horror</label><br>
        <input type="checkbox" value="Sci-fi" id="sci-fi" name="c4">
        <label for="sci-fi">Sci-Fi</label>
        <input type="checkbox" value="Sparatutto" id="sparatutto" name="c5">
        <label for="sparatutto">Sparatutto</label>
        <input type="checkbox" value="Picchiaduro" id="picchiaduro" name="c6">
        <label for="picchiaduro">Picchiaduro</label><br>
        <input type="checkbox" value="Sopravvivenza" id="sopravvivenza" name="c7">
        <label for="sopravvivenza">Sopravvivenza</label>
        <input type="checkbox" value="Stelth" id="stelth" name="c8">
        <label for="stelth">Stelth</label>
        <input type="checkbox" value="Rpg" id="rpg" name="c9">
        <label for="rpg">Rpg</label><br>
        <input type="checkbox" value="J-rpg" id="jrpg" name="c10">
        <label for="jrpg">J-Rpg</label>
        <input type="checkbox" value="Action" id="action" name="c11">
        <label for="action">Action</label>
        <input type="checkbox" value="Simulazione" id="simulazione" name="c12">
        <label for="simulazione">Simulazione</label><br>
        <input type="checkbox" value="Strategia" id="strategia" name="c13">
        <label for="strategia">strategia</label>
        <input type="checkbox" value="Roughlik" id="roughlik" name="c14">
        <label for="roughlik">Roughlik</label>
        <input type="checkbox" value="Open world" id="openworld" name="c15">
        <label for="openworld">Open World</label><br>
        <p>Carica immagine 1</p>
            <label class="custom-file-upload">
                <input type="file" name="immagine1" multiple>
                Aggiungi
            </label>
            <p>Carica immagine 2</p>
            <label class="custom-file-upload">
                <input type="file" name="immagine2" multiple>
                Aggiungi
            </label>
            <p>Carica immagine 3</p>
            <label class="custom-file-upload">
                <input type="file" name="immagine3" multiple>
                Aggiungi
            </label><br><br>
        <div id="bottoneGioco">
            <input type="submit" value="Aggiungi gioco">
        </div>

    </div>

</form>

    <br>

    <div class="aggiunta" onclick="mostraENascondi('formProdotto')">
        <p>Aggiungi un prodotto</p>
    </div>

    <form id="formProdotto" action="AggiungiCopia" method="post">
        <p  id="selectGioco">Seleziona gioco</p>
        <select name="gioco">
            <%
                int i = 0;
                ArrayList<Videogioco> l = VideogiocoDAO.doRetriveAll();
                for(i=0; i<l.size(); i++){
            %>
            <option value="<%=l.get(i).getTitolo()%>"><%=l.get(i).getTitolo()%></option>
            <%}%>
        </select><br>

        <select name="piattaforma">
            <option value="switch">Nintendo Switch</option>
            <option value="playstation4">Playstation 4</option>
            <option value="playstation5">Playstation 5</option>
            <option value="xbox1">Xbox One</option>
            <option value="xboxX">Xbox Series X</option>
            <option value="pc">PC</option>
        </select><br>

        <label for="prezzo">Prezzo</label><br>
        <input type="text" id="prezzo" name="prezzo" placeholder="Prezzo"><br>
        <label for="datapc">Prezzo</label><br>
        <input id="datapc" type="date" name="datapc"><br>
        <label for="copie">Numero copie</label><br>
        <input id="copie" type="number" name="nCopiepc"><br>
        <input type="submit" name="submit">
    </form>

</div>
</body>
</html>
