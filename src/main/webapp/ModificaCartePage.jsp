<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 18/07/2022
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CartaStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>

<%@include file="NavBar.jsp" %>

<div id="oggettiCarta">
    <p id="testoCarta"> Carte di credito</p>
    <%for(int j=0; j<6; j++){%>
    <div class="cartaItem">

        <div id="descrizione">

            <p id="nomeCognome">Nome e Cognome</p>
            <p id="indirizzo">Indirizzo</p>
            <p id="numeroCarta">Numero Carta</p>

        </div>

        <div class="bottoneModifica" onclick="">

            <p>Modifica</p>

        </div>

        <div class="bottoneModifica" onclick="">

            <p>Elimina</p>

        </div>

        <hr>

    </div>
    <%}%>
</div>
</body>
</html>
