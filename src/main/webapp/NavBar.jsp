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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#ricercaAvanzata").click(function(){
                $("#menuAvanzato").slideToggle('slow');
            });
        });

        $(document).ready(function(){
            $("#searchBar").click(function(){
                $("#menuAvanzato").slideUp('slow');
                $("#freccia").css("transform", "rotate(0deg)");
            });
        });

    </script>

</head>
<body onscroll="barEffect(), hiddenRisultatiAjax(),menuEffect()">

    <!-- creazione barra di navigazione-->
    <div id="navBar">
        <div id="logo" class="button">
            <a href="index.jsp"><img src="css/pictures/logo.png"></a>
        </div>
        <div id="search">
            <form action="#cer" id="searchBarForm">
                <input type="text" id="searchBar" placeholder="cerca..." onblur="hideAjax()" onclick="toggleSerch()" onkeyup="ricerca()">
                <!--<input type="submit" id="searchButton" value="       ">-->
            </form>
        </div>
        <div id="ricercaAvanzata" onclick="ruota('freccia'),hideAjax()">
            <div>Filtra prodotti</div>
            <div id="freccia"><img src="css/pictures/freccia.png"></div>
        </div>
        <a id="carrello" class="button" style="float: right; text-decoration: none" href="CaricaCarrello">
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



    <div id="menu">
        <div id="risultatiAjax">
            <a class="risultato" id="risultato1" href="">gioco</a>
            <a class="risultato" id="risultato2" href="">gioco</a>
            <a class="risultato" id="risultato3" href="">gioco</a>
            <a class="risultato" id="risultato4" href="">gioco</a>
            <a class="risultato" id="risultato5" href="">gioco</a>
            <a class="risultato" id="risultato6" href="">gioco</a>
            <a class="risultato" id="risultato7" href="">gioco</a>
            <a class="risultato" id="risultato8" href="">gioco</a>
            <a class="risultato" id="risultato9" href="">gioco</a>
            <a class="risultato" id="risultato10" href="">gioco</a>
        </div>
    </div>

    <div id="menuAvanzato" >
        <form action="RisultatoFiltro">

            <div class="sezione">
                <p class="paragrafiReserch">ricerca piattaforme</p>
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
                <p class="paragrafiReserch" style="text-align: center">ricerca generi</p>

                <input type="checkbox" value="Avventura" name="check1" id="avventura">
                <label for="avventura">Avventura</label>
                <input type="checkbox" value="Fantasy" name="check2" id="fantasy">
                <label for="fantasy">Fantasy</label>
                <input type="checkbox" value="Horror" name="check3" id="horror">
                <label for="horror">Horror</label>
                <input type="checkbox" value="Sci-fi" name="check4" id="sci-fi">
                <label for="sci-fi">Sci-Fi</label>
                <input type="checkbox" value="Sparatutto" name="check5" id="sparatutto">
                <label for="sparatutto">Sparatutto</label><br>
                <input type="checkbox" value="Picchiaduro" name="check6" id="picchiaduro">
                <label for="picchiaduro">Picchiaduro</label>
                <input type="checkbox" value="Sopravvivenza" name="check7" id="sopravvivenza">
                <label for="sopravvivenza">Sopravvivenza</label>
                <input type="checkbox" value="Stelth" name="check8" id="stelth">
                <label for="stelth">Stelth</label>
                <input type="checkbox" value="Rpg" name="check9" id="rpg">
                <label for="rpg">Rpg</label>
                <input type="checkbox" value="J-rpg" name="check10" id="jrpg">
                <label for="jrpg">J-Rpg</label><br>
                <input type="checkbox" value="Action" name="check11" id="action">
                <label for="action">Action</label>
                <input type="checkbox" value="Simulazione" name="check12" id="simulazione">
                <label for="simulazione">Simulazione</label>
                <input type="checkbox" value="Strategia" name="check13" id="strategia">
                <label for="strategia">strategia</label>
                <input type="checkbox" value="Roughlik" name="check14" id="roughlik">
                <label for="roughlik">Roughlik</label>
                <input type="checkbox" value="Open world" name="check15" id="openworld">
                <label for="openworld">Open World</label>
            </div>

            <br>

            <div id="annoPrezzo" class="sezione">
                <input type="submit" id="ricercaavButton" value="cerca">
            </div>

        </form>
    </div>


</body>
</html>
