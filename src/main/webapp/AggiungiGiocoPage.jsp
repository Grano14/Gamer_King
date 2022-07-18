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
<div id="dati">
    <div id="gioco">
        <input type="text" id="titolo" placeholder="Titolo del gioco"><br>
        <textarea id="descrizione">
            Inserisci una descrizione...
        </textarea><br>
        <p>Seleziona generi</p>
        <input type="checkbox" value="avventura" id="avventura">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="fantasy" id="fantasy">
        <label for="fantasy">Fantasy</label>
        <input type="checkbox" value="horror" id="horror">
        <label for="horror">Horror</label><br>
        <input type="checkbox" value="sci-fa" id="sci-fi">
        <label for="sci-fi">Sci-Fi</label>
        <input type="checkbox" value="sparatutto" id="sparatutto">
        <label for="sparatutto">Sparatutto</label>
        <input type="checkbox" value="picchiaduro" id="picchiaduro">
        <label for="picchiaduro">Picchiaduro</label><br>
        <input type="checkbox" value="sopravvivenza" id="sopravvivenza">
        <label for="sopravvivenza">Sopravvivenza</label>
        <input type="checkbox" value="stelth" id="stelth">
        <label for="stelth">Stelth</label>
        <input type="checkbox" value="rpg" id="rpg">
        <label for="rpg">Rpg</label><br>
        <input type="checkbox" value="jrpg" id="jrpg">
        <label for="jrpg">J-Rpg</label>
        <input type="checkbox" value="action" id="action">
        <label for="action">Action</label>
        <input type="checkbox" value="simulazione" id="simulazione">
        <label for="simulazione">Simulazione</label><br>
        <input type="checkbox" value="strategia" id="strategia">
        <label for="strategia">strategia</label>
        <input type="checkbox" value="roughlik" id="roughlik">
        <label for="roughlik">Roughlik</label>
        <input type="checkbox" value="openworld" id="openworld">
        <label for="openworld">Open World</label><br>
    </div>
</div>
<div id="piattaforma">
    <div id="pc" class="tasto">
        <p class="piattaformaname" onclick="seeInput('pc', 'pcdate')">PC</p>
        <div class="prezzo/data/copie" id="pcdate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
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
        </div>
    </div>
</div>
</body>
</html>
