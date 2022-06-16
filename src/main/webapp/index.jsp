<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>GamerKing | Home</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script type="text/javascript" src="HomeScript.js"></script>
</head>
<body onscroll="barEffect()">

<!-- creazione barra di navigazione-->
<div id="navBar">
    <div id="logo" class="button">
        <img src="css/pictures/logo.png">
    </div>
    <div id="search">
        <form action="#cer" id="searchBarForm">
            <input type="text" id="searchBar" placeholder="cerca...">
            <!--<input type="submit" id="searchButton" value="       ">-->
            <input type="button" value="  " id="ricercaAvanzata" onclick="mostraAVmenu()">
        </form>
    </div>
    <div id="carrello" class="button" style="float: right">
        <img src="css/pictures/carrello.png">
    </div>
    <div id="login" style="float: right">
        <a href="loginPage.jsp">LOGIN</a>
    </div>
</div>
<!-- this is a comment-->

<!-- creazione menù ricerca avanzata-->



<div id="menuAvanzato">
    <form>
        <div class="sezione">
            <p>Scegli una piattaforma</p>
            <input type="button" class="bottone" style="background-image: url('css/pictures/playstation.png')" onclick="selectedPiattaforma(this, 'playstation')">
            <input type="hidden" id="playstation" value="false">
            <input type="button" class="bottone" style="background-image: url('css/pictures/xbox.png')" onclick="selectedPiattaforma(this, 'xbox')">
            <input type="hidden" id="xbox" value="false">
            <input type="button" class="bottone" style="background-image: url('css/pictures/nintendo.png')" onclick="selectedPiattaforma(this, 'nintendo')">
            <input type="hidden" id="nintendo" value="false">
        </div>
        <div class="sezione">
            <p>scegli un genere</p>
            <input type="button" class="bottone" style="background-image: url('css/pictures/avventura.png')" title="Avventura" onclick="selectedPiattaforma(this, 'avventura')">
            <input type="hidden" id="avventura" value="false">
            <input type="button" class="bottone" style="background-image: url('css/pictures/fantasy.png')" title="Fantasy" onclick="selectedPiattaforma(this, 'fantasy')">
            <input type="hidden" id="fantasy" value="false">
            <input type="button" class="bottone" style="background-image: url('css/pictures/sparatutto.png')" title="Sparatutto" onclick="selectedPiattaforma(this, 'sparatutto')">
            <input type="hidden" id="sparatutto" value="false">
        </div>
        <div id="annoPrezzo" class="sezione">
            Anno
            <select>
                <option>2009</option>
                <option>2010</option>
                <option>2011</option>
                <option>2012</option>
                <option>2013</option>
                <option>2014</option>
            </select>
            <p>Prezzo minimo</p>
            <input type="range" id="rangemin" min="0" max="150" value="75" onchange="showminmax(value, 'minrange')"><label for="rangemin" id="minrange"></label>
            <p>Prezzo massmo</p>
            <input type="range" id="rangemax" min="0" max="150" value="75" onchange="showminmax(value, 'maxrange')"><label for="rangemin" id="maxrange"></label>
            <br><br>scontati
            <input type="checkbox" value="true"><br><br><br><br>
            <input type="submit" id="ricercaavButton" value="cerca">
        </div>
    </form>
</div>



<!-- contenuto homepage-->

<div id="corpo">
    <div id="primoPiano">
        <img src="css/pictures/primoPiano.png">
    </div>
    <div id="giochi">
        <p class="section">i più popolari</p><br>
        <%for(int i=0; i<6; i++){%>
        <div class="elemento">
            <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
            GAME
        </div>
        <%}%>
        <p class="section">giochi di avventura</p>
        <%for(int i=0; i<6; i++){%>
        <div class="elemento">
            <a href="#game"><img src="css/pictures/avventuragame.jpg"> </a>
            GAME
        </div>
        <%}%>
    </div>
</div>

<div id="footer">
    footer
    <a href="ProductPage.jsp">prodotto</a>
</div>
</body>
</html>