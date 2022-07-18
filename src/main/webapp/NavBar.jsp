<%@ page import="com.mysql.cj.Session" %><%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 21/06/2022
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>NavBar</title>
    <link rel="stylesheet" type="text/css" href="css/NavBarStyle.css">
    <script type="text/javascript" src="javaScript/HomeScript.js"></script>

</head>
<body onscroll="barEffect()">

<!-- creazione barra di navigazione-->
<div id="navBar">
    <div id="logo" class="button">
        <a href="HomePage.jsp"><img src="css/pictures/logo.png"></a>
    </div>
    <div id="search">
        <form action="#cer" id="searchBarForm">
            <input type="text" id="searchBar" placeholder="cerca...">
            <!--<input type="submit" id="searchButton" value="       ">-->
        </form>
    </div>
    <div id="ricercaAvanzata" onclick="mostraMenu('menuAvanzato', 'freccia')">
        <div>Strumenti</div>
        <div id="freccia"><img src="css/pictures/freccia.png"></div>
    </div>
    <div id="categorie" onclick="mostraMenu('categorieMenu', 'freccia1')">
        <div>Categorie</div>
        <div id="freccia1"><img src="css/pictures/freccia.png"></div>
    </div>
    <a id="carrello" class="button" style="float: right" href="Carrello.jsp">
        <img src="css/pictures/carrello.png">
    </a>
    <%
        String nome = (String) session.getAttribute("nomeUtente");
        if(nome.equals("LOGIN")){
    %>
    <div id="login" style="float: right">
        <a href="loginPage.jsp">LOGIN</a>
    </div>
    <%}else{%>
    <div id="login" style="float: right">
        <a href="UserPage.jsp"> <%=nome%> </a>
    </div>
    <%}%>
</div>

<!-- creazione menù ricerca avanzata-->



<div id="menuAvanzato">
    <form>
        <div class="sezione">
            <p class="paragrafiReserch">Scegli una piattaforma</p>
            <input type="button" class="bottone" title="playstation 5" style="background-image: url('css/pictures/playstation5.png')" onclick="selectedPiattaforma(this, 'playstation5')">
            <input type="hidden" id="playstation5" value="false">
            <input type="button" class="bottone" title="playstation 4" style="background-image: url('css/pictures/playstation4.png')" onclick="selectedPiattaforma(this, 'playstation4')">
            <input type="hidden" id="playstation4" value="false">
            <input type="button" class="bottone" title="xbox one" style="background-image: url('css/pictures/xbox.png')" onclick="selectedPiattaforma(this, 'xbox one')">
            <input type="hidden" id="xbox one" value="false">
            <input type="button" class="bottone" title="xbox one x" style="background-image: url('css/pictures/xboxonex.png')" onclick="selectedPiattaforma(this, 'xbox one x')">
            <input type="hidden" id="xbox one x" value="false">
            <input type="button" class="bottone" title="nintendo switch" style="background-image: url('css/pictures/nintendo.png')" onclick="selectedPiattaforma(this, 'nintendo')">
            <input type="hidden" id="nintendo" value="false">
            <input type="button" class="bottone" title="pc" style="background-image: url('css/pictures/pc.png')" onclick="selectedPiattaforma(this, 'pc')">
            <input type="hidden" id="pc" value="false">
        </div>
        <div class="sezione" id="generi">
            <p class="paragrafiReserch" style="text-align: center">Scegli un genere</p>
            <!--
            <input type="button" class="bottone" style="background-image: url('css/pictures/avventura.png')" title="Avventura" onclick="selectedPiattaforma(this, 'avventura')">
            <input type="hidden" id="avventura" value="false">
            <input type="button" class="bottone" style="background-image: url('css/pictures/fantasy.png')" title="Fantasy" onclick="selectedPiattaforma(this, 'fantasy')">
            <input type="hidden" id="fantasy" value="false">
            <input type="button" class="bottone" style="background-image: url('css/pictures/sparatutto.png')" title="Sparatutto" onclick="selectedPiattaforma(this, 'sparatutto')">
            <input type="hidden" id="sparatutto" value="false">-->
            <input type="checkbox" value="avventura" id="avventura">
            <label for="avventura">Avventura</label><br>
            <input type="checkbox" value="fantasy" id="fantasy">
            <label for="fantasy">Fantasy</label><br>
            <input type="checkbox" value="horror" id="horror">
            <label for="horror">Horror</label><br>
            <input type="checkbox" value="sci-fa" id="sci-fi">
            <label for="sci-fi">Sci-Fi</label><br>
            <input type="checkbox" value="sparatutto" id="sparatutto">
            <label for="sparatutto">Sparatutto</label><br>
            <input type="checkbox" value="picchiaduro" id="picchiaduro">
            <label for="picchiaduro">Picchiaduro</label><br>
            <input type="checkbox" value="sopravvivenza" id="sopravvivenza">
            <label for="sopravvivenza">Sopravvivenza</label><br>
            <input type="checkbox" value="stelth" id="stelth">
            <label for="stelth">Stelth</label><br>
            <input type="checkbox" value="rpg" id="rpg">
            <label for="rpg">Rpg</label><br>
            <input type="checkbox" value="jrpg" id="jrpg">
            <label for="jrpg">J-Rpg</label><br>
            <input type="checkbox" value="action" id="action">
            <label for="action">Action</label><br>
            <input type="checkbox" value="simulazione" id="simulazione">
            <label for="simulazione">Simulazione</label><br>
            <input type="checkbox" value="strategia" id="strategia">
            <label for="strategia">strategia</label><br>
            <input type="checkbox" value="roughlik" id="roughlik">
            <label for="roughlik">Roughlik</label><br>
            <input type="checkbox" value="openworld" id="openworld">
            <label for="openworld">Open World</label><br>
        </div>
        <div id="annoPrezzo" class="sezione">
            <!--
            Anno
            <select>
                <option>2009</option>
                <option>2010</option>
                <option>2011</option>
                <option>2012</option>
                <option>2013</option>
                <option>2014</option>
            </select>
            <p class="paragrafiReserch">Prezzo minimo</p>
            <input type="range" id="rangemin" min="0" max="150" value="75" onchange="showminmax(value, 'minrange')"><label for="rangemin" id="minrange"></label>
            <p class="paragrafiReserch">Prezzo massmo</p>
            <input type="range" id="rangemax" min="0" max="150" value="75" onchange="showminmax(value, 'maxrange')"><label for="rangemin" id="maxrange"></label>
            <br><br>scontati
            <input type="checkbox" value="true"><br><br><br><br>
            -->
            <input type="submit" id="ricercaavButton" value="cerca">
        </div>
    </form>
</div>

<div id="categorieMenu">
    <div>I più venduti</div>
    <div>I giochi del momento</div>
    <div>Scontati</div>
    <div>I più popolari</div>
</div>

</body>
</html>
