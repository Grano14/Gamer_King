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

<div id="menuRicerca">
    <form>
        <div id="piattaforma">
            <label for="s1">Piattaforma</label>
            <select id="s1">
                <option>1</option>
                <option>1</option>
            </select>
        </div>
        <div id="genere">
            <label for="s2">Genere</label>
            <select id="s2">
                <option>1</option>
                <option>1</option>
            </select>
        </div>
        <div id="anno">
            <label for="s3">Anno</label><br>
            <select id="s3">
                <option>1</option>
                <option>1</option>
            </select>
        </div>
        <div id="prezzo">
            <label for="maxprice">Inserisci il prezzo massimo</label>
            <input type="text" id="maxprice">
        </div>
        <div>
            <input type="submit" id="tastoCerca" value="Cerca">
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
            <a href="#game"><img src="css/pictures/avventura.avif"> </a>
            GAME
        </div>
        <%}%>
    </div>
</div>

<div id="footer">
    footer
</div>
</body>
</html>