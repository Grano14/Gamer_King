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

<svg width="600" height="400">
    <mask id="svgmask1">
        <polygon fill="#ffffff" points="0 0,1920 0, 1920 350, 0 250"></polygon>
    </mask>
    <image xlink:href="css/pictures/eldenRing.jpg" mask="url(#svgmask1)"></image>
</svg>

<div id="prodotto">

    <div class="immagineEAcquisto">

        <div class="immagine2">
            <img id="secondaria" src="css/pictures/eldenRing.jpg">
        </div>

        <div class="acquisto">
            <p classe="titolo">Nome Gioco</p>
            <p classe="prezzo">Prezzo</p>
            <div class="bottoneAcquisto" onclick="">
                <p>Acquista</p>
            </div>
            <div class="carrello">
                <img src="css/pictures/carrello.png">
            </div>
        </div>

    </div>

</div>

</body>
</html>
