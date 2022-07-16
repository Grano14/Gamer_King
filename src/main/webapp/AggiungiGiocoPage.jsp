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
        <input type="checkbox" value="avventura" id="avventura">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="fantasy" id="fantasy">
        <label for="avventura">Fantasy</label><br>
        <input type="checkbox" value="sparatutto" id="sparatutto">
        <label for="avventura">Sparatutto</label><br>
        <label for="inputimmagine">Scegli una immagine principale</label>
        <input type="file" id="inputimmagine"><br>
        <label for="inputimmagini">Scegli le immagini secondarie</label>
        <input type="file" id="inputimmagini">
    </div>
</div>
<div id="piattaforma">
    <div id="pc" onclick="seeInput('pc', 'pcdate')" class="tasto">
        <p class="piattaformaname">PC</p>
        <div class="prezzo/data/copie" id="pcdate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
        </div>
    </div>
    <div id="playstation" onclick="seeInput('playstation', 'playstationdate')" class="tasto">
        <p class="piattaformaname">Playstation</p>
        <div class="prezzo/data/copie" id="playstationdate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
        </div>
    </div>
    <div id="nintendo" onclick="seeInput('nintendo', 'nintendodate')" class="tasto">
        <p class="piattaformaname">Switch</p>
        <div class="prezzo/data/copie" id="nintendodate">
            <p>Prezzo</p>
            <input type="text"><br>
            <p>Data uscita</p>
            <input type="date"><br>
            <p>Numero di copie</p>
            <input type="number"><br>
        </div>
    </div>
    <div id="xbox" onclick="seeInput('xbox', 'xboxdate')" class="tasto">
        <p class="piattaformaname">Xbox</p>
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
