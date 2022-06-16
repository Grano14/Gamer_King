<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 16/06/2022
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prodotto</title>
    <link rel="stylesheet" type="text/css" href="css/ProductPageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script type="text/javascript" src="HomeScript.js"></script>
</head>
<body>

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

<div class="elemento">
    <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
</div>

</body>
</html>
