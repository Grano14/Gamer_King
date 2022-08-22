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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body onscroll="barEffect(), hiddenRisultatiAjax()">

<!-- creazione barra di navigazione-->
<div id="navBar">
    <div id="logo" class="button">
        <a href="index.jsp"><img src="css/pictures/logo.png"></a>
    </div>
    <div id="search">
        <form action="#cer" id="searchBarForm">
            <input type="text" id="searchBar" placeholder="cerca..." onkeyup="ricerca()">
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
    <a id="carrello" class="button" style="float: right" href="CaricaCarrello">
        <img src="css/pictures/carrello.png">
        <%
            Integer n = (Integer)session.getAttribute("numProdottiCarrello");
            String pathImage = "";
            if(n != 0)
                pathImage = "css/pictures/" + "cerchio" + n + ".png";
            if(n > 5)
                pathImage = "css/pictures/" + "cerchio.png";
        %>
        <img id="numeroCarrello" style="margin-bottom: 20px" src="<%=pathImage%>">
    </a>
    <%
        if(session.getAttribute("nomeUtente").equals("LOGIN")){
    %>
    <div id="login" style="float: right">
        <a href="loginPage.jsp">LOGIN</a>
    </div>
    <%}else{%>
    <div id="login" style="float: right">

        <form  method="post" action="PaginaUtente">
            <input type="submit" id="paginaUtente" value="<%=(String)session.getAttribute("nomeUtente")%>">
        </form>
    </div>
    <%}%>
</div>

<!-- creazione menù ricerca avanzata-->



<div id="menuAvanzato">
    <form action="RisultatoFiltro">
        <div class="sezione">
            <p class="paragrafiReserch">Scegli una piattaforma</p>
            <input type="button" class="bottone" title="playstation 5" style="background-image: url('css/pictures/playstation5.png')" onclick="selectedPiattaforma(this, 'playstation5')">
            <input type="hidden" id="playstation5" name="hide1" value="false">
            <input type="button" class="bottone" title="playstation 4" style="background-image: url('css/pictures/playstation4.png')" onclick="selectedPiattaforma(this, 'playstation4')">
            <input type="hidden" id="playstation4" name="hide2" value="false">
            <input type="button" class="bottone" title="xbox one" style="background-image: url('css/pictures/xbox.png')" onclick="selectedPiattaforma(this, 'xbox1')">
            <input type="hidden" id="xbox1" name="hide3" value="false">
            <input type="button" class="bottone" title="xbox one x" style="background-image: url('css/pictures/xboxonex.png')" onclick="selectedPiattaforma(this, 'xboxX')">
            <input type="hidden" id="xboxX" name="hide4" value="false">
            <input type="button" class="bottone" title="nintendo switch" style="background-image: url('css/pictures/nintendo.png')" onclick="selectedPiattaforma(this, 'switch')">
            <input type="hidden" id="switch" name="hide5" value="false">
            <input type="button" class="bottone" title="pc" style="background-image: url('css/pictures/pc.png')" onclick="selectedPiattaforma(this, 'pc')">
            <input type="hidden" id="pc" name="hide6" value="false">
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
            <input type="checkbox" value="Avventura" name="check1" id="avventura">
            <label for="avventura">Avventura</label><br>
            <input type="checkbox" value="Fantasy" name="check2" id="fantasy">
            <label for="fantasy">Fantasy</label><br>
            <input type="checkbox" value="Horror" name="check3" id="horror">
            <label for="horror">Horror</label><br>
            <input type="checkbox" value="Sci-fi" name="check4" id="sci-fi">
            <label for="sci-fi">Sci-Fi</label><br>
            <input type="checkbox" value="Sparatutto" name="check5" id="sparatutto">
            <label for="sparatutto">Sparatutto</label><br>
            <input type="checkbox" value="Picchiaduro" name="check6" id="picchiaduro">
            <label for="picchiaduro">Picchiaduro</label><br>
            <input type="checkbox" value="Sopravvivenza" name="check7" id="sopravvivenza">
            <label for="sopravvivenza">Sopravvivenza</label><br>
            <input type="checkbox" value="Stelth" name="check8" id="stelth">
            <label for="stelth">Stelth</label><br>
            <input type="checkbox" value="Rpg" name="check9" id="rpg">
            <label for="rpg">Rpg</label><br>
            <input type="checkbox" value="J-rpg" name="check10" id="jrpg">
            <label for="jrpg">J-Rpg</label><br>
            <input type="checkbox" value="Action" name="check11" id="action">
            <label for="action">Action</label><br>
            <input type="checkbox" value="Simulazione" name="check12" id="simulazione">
            <label for="simulazione">Simulazione</label><br>
            <input type="checkbox" value="Strategia" name="check13" id="strategia">
            <label for="strategia">strategia</label><br>
            <input type="checkbox" value="Roughlik" name="check14" id="roughlik">
            <label for="roughlik">Roughlik</label><br>
            <input type="checkbox" value="Open world" name="check15" id="openworld">
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

<div id="risultatiAjax">
    <a id="risultato1" href="">gioco</a><br>
    <a id="risultato2" href="">gioco</a><br>
    <a id="risultato3" href="">gioco</a><br>
    <a id="risultato4" href="">gioco</a><br>
    <a id="risultato5" href="">gioco</a><br>
    <a id="risultato6" href="">gioco</a><br>
    <a id="risultato7" href="">gioco</a><br>
    <a id="risultato8" href="">gioco</a><br>
    <a id="risultato9" href="">gioco</a><br>
    <a id="risultato10" href="">gioco</a><br>
</div>

</body>
</html>
