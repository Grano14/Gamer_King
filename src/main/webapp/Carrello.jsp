<%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 27/06/2022
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Carrello</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CarrelloStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script type="text/javascript" src="CarrelloScript.js"></script>
</head>
<body>
<%@include file="NavBar.jsp" %>
<div id="oggettiCarrello">
    <p id="testoCarrello"></p>
    <% int i=6; if(i == 0){%>
    <script>corpoCarrello(0)</script>
    <%} else{%>
    <script>corpoCarrello(6)</script>
    <hr>
    <%for(int j=0; j<i; j++){%>
        <div class="carrelloItem">
            <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
            <div id="descrizione">
                descrizione gioco
            </div>
            <div id="prezzo">
                50$
            </div>
        </div>
        <hr>
    <%}%>
    <%}%>
    <div>
        <button id="acquistaButton">ACQUISTA</button>
    </div>
</div>

</body>
</html>
