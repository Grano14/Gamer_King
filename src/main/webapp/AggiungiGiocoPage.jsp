<%--
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
</head>
<body>
<h1>AGGIUNGI VIDEOGIOCO</h1>
<p id="admin">Admin</p>
<form action="AggiungiGioco" method="post" enctype="multipart/form-data" >
<div id="dati">
    <div id="gioco">
        <input type="text" id="titolo" name="titolo" placeholder="Titolo del gioco"><br>
        <textarea id="descrizione" name="desc" placeholder="Inserisci una descrizione...">
        </textarea><br>
        <p>Seleziona generi</p>
        <input type="checkbox" value="avventura" id="avventura" name="c1">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="fantasy" id="fantasy" name="c2">
        <label for="fantasy">Fantasy</label>
        <input type="checkbox" value="horror" id="horror" name="c3">
        <label for="horror">Horror</label><br>
        <input type="checkbox" value="sci-fi" id="sci-fi" name="c4">
        <label for="sci-fi">Sci-Fi</label>
        <input type="checkbox" value="sparatutto" id="sparatutto" name="c5">
        <label for="sparatutto">Sparatutto</label>
        <input type="checkbox" value="picchiaduro" id="picchiaduro" name="c6">
        <label for="picchiaduro">Picchiaduro</label><br>
        <input type="checkbox" value="sopravvivenza" id="sopravvivenza" name="c7">
        <label for="sopravvivenza">Sopravvivenza</label>
        <input type="checkbox" value="stelth" id="stelth" name="c8">
        <label for="stelth">Stelth</label>
        <input type="checkbox" value="rpg" id="rpg" name="c9">
        <label for="rpg">Rpg</label><br>
        <input type="checkbox" value="jrpg" id="jrpg" name="c10">
        <label for="jrpg">J-Rpg</label>
        <input type="checkbox" value="action" id="action" name="c11">
        <label for="action">Action</label>
        <input type="checkbox" value="simulazione" id="simulazione" name="c12">
        <label for="simulazione">Simulazione</label><br>
        <input type="checkbox" value="strategia" id="strategia" name="c13">
        <label for="strategia">strategia</label>
        <input type="checkbox" value="roughlik" id="roughlik" name="c14">
        <label for="roughlik">Roughlik</label>
        <input type="checkbox" value="openworld" id="openworld" name="c15">
        <label for="openworld">Open World</label><br>
        Carica immagine 1
        <input type="file" name="immagine1" multiple>
        Carica immagine 2
        <input type="file" name="immagine2" multiple>
        Carica immagine 3
        <input type="file" name="immagine3" multiple>
    </div>
</div>
<div id="piattaforma">
    <div id="pc" class="tasto">
        <p class="piattaformaname" onclick="seeInput('pc', 'pcdate')">PC</p>
        <div class="prezzo/data/copie" id="pcdate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date" name="data"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
            <input type="submit" value="pc" name="submit">
        </div>
    </div>
    <div id="playstation" class="tasto">
        <p class="piattaformaname" onclick="seeInput('playstation', 'playstationdate')">Playstation</p>
        <div class="prezzo/data/copie" id="playstationdate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
            <input type="submit" value="playstation" name="submit">
        </div>
    </div>
    <div id="nintendo" class="tasto">
        <p class="piattaformaname" onclick="seeInput('nintendo', 'nintendodate')">Switch</p>
        <div class="prezzo/data/copie" id="nintendodate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
            <input type="submit" value="nintendo" name="submit">
        </div>
    </div>
    <div id="xbox" class="tasto">
        <p class="piattaformaname" onclick="seeInput('xbox', 'xboxdate')">Xbox</p>
        <div class="prezzo/data/copie" id="xboxdate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
            <input type="submit" value="xbox" name="submit">
        </div>
    </div>
</div>
</form>
</body>
</html>
