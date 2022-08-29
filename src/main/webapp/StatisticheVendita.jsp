<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 29/08/2022
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>GamerKing | Statistiche di vendita</title>

    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/StatisticheVenditeStyle.css">

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#showM").click(function(){
                $("#m1").hide();
                $("#m2").hide();
                $("#m").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM1").click(function(){
                $("#m").hide();
                $("#m2").hide();
                $("#m1").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM2").click(function(){
                $("#m").hide();
                $("#m1").hide();
                $("#m2").toggle();
            });
        });
    </script>
</head>
<body>
<h1>STATISTICHE DI VENDITA</h1>
<a href="AdminPage.jsp" style="text-decoration:none;">
    <p id="admin">Admin</p>
</a>

<div id="BottoniMenu">
    <div class="bottoneImpostazioni" id="showM">
        <p>Più venduti</p>
    </div>
    <div class="bottoneImpostazioni" id="showM1">
        <p>Più votati</p>
    </div>
    <div class="bottoneImpostazioni" id="showM2">
        <p>Da rifornire</p>
    </div>
</div>

<div id="menuUtente">

    <div id="m" class="hiddenMenu">
        <%
            int i;
            for(i=0;i<5;i++){
        %>
        <hr>
        <img class="immaginiProdotto" src="css/gameImages/Elden Ring/159088-games-review-hands-on-elden-ring-review-image1-8nisaeviok.jpg">
        <div class="testoLista">
            <p class="titolo">Nome prodotto, piattaforma</p>
            <p class="prezzoProdotto">00.00€</p>
            <p class="numeroCopie">Copie vendute:1000</p>
            <p class="descrizione">data uscita</p>
            <p class="descrizione">generi</p>
        </div>
        <%}%>
    </div>

    <div id="m1" class="hiddenMenu">
        <%
            for(i=0;i<5;i++){
        %>
        <hr>
        <img class="immaginiProdotto" src="css/gameImages/Elden Ring/159088-games-review-hands-on-elden-ring-review-image1-8nisaeviok.jpg">
        <div class="testoLista">
            <p class="titolo">Nome prodotto, piattaforma</p>
            <p class="prezzoProdotto">00.00€</p>
            <p class="numeroCopie">voto medio:1000</p>
            <p class="descrizione">data uscita</p>
            <p class="descrizione">generi</p>
        </div>
        <%}%>
    </div>

    <div id="m2" class="hiddenMenu">
        <%
            for(i=0;i<5;i++){
        %>
        <hr>
        <img class="immaginiProdotto" src="css/gameImages/Elden Ring/159088-games-review-hands-on-elden-ring-review-image1-8nisaeviok.jpg">
        <div class="testoLista">
            <p class="titolo">Nome prodotto, piattaforma</p>
            <p class="prezzoProdotto">00.00€</p>
            <p class="numeroCopie">copie rimanenti:1000</p>
            <p class="descrizione">data uscita</p>
            <p class="descrizione">generi</p>
        </div>
        <%}%>
    </div>

</div>

</body>
</html>
