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

<div id="prodotto">

    <div class="immagineEAcquisto">

        <div class="immagine2">
            <img id="secondaria" src="css/pictures/eldenRing.jpg">
        </div>

        <div class="acquisto">
            <p class="titolo">Nome Gioco</p>
            <p class="prezzo">Prezzo</p>
            <div class="bottoneAcquisto" onclick="">
                <p>Acquista</p>
            </div>
            <div class="bottoneAcquisto" onclick="">
                <p>Carrello</p>
            </div>
        </div>

    </div>
    <div id="setImmagini">
        <img src="css/pictures/sinistra.png">
        <%for(int i=0; i<6; i++){%>
        <div class="altreFoto">
            <img src="css/pictures/avventuragame.jpg">
        </div>
        <%}%>
        <img src="css/pictures/destra.png">
    </div>
</div>

</body>
</html>
