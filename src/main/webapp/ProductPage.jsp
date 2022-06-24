<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 16/06/2022
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Prodotto</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/ProductPageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>
<%@include file="NavBar.jsp" %>
<!--creiamo la presentazione del prodotto-->
<div id="sfondo">
</div>
<div id="prodotto">
    <div class="info">
        <div class="foto">
            <div id="contenitoreImmagine">
                <img src="css/pictures/eldenRing.jpg">
            </div>

            <div id="acquistoECarrello">
                <p id="nomeGioco">Nome Gioco</p>
                <p id="prezzoGioco">00.00€</p>
                <div id="acquisto">

                    <div class="tasto">
                        <a href="#acquisto">acquisto</a>
                    </div><br><br>
                    <div class="tasto">
                        <a href="#carrello">carrello</a>
                    </div>

                </div>
        </div>



        </div>
    </div>

</div>

</body>
</html>
