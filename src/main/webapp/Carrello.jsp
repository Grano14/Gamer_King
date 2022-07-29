<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %><%--
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
    <script type="text/javascript" src="javaScript/CarrelloScript.js"></script>
</head>
<body>
<%@include file="NavBar.jsp" %>
<div id="oggettiCarrello">
    <p id="testoCarrello"></p>
    <% ArrayList<Prodotto> carrello = (ArrayList<Prodotto>) request.getAttribute("carrello");
        ArrayList<String> lImm = (ArrayList<String>) request.getAttribute("lImmagini");
        int i = carrello.size(); if(i == 0){%>
    <script>corpoCarrello(0)</script>
    <%} else{%>
    <script>corpoCarrello(<%=i%>)</script>
    <hr>
    <%for(int j=0; j<i; j++){%>
        <div class="carrelloItem">
            <a href="CaricaProdotto?titolo=<%=carrello.get(j).getVideogioco()%>&piattaforma=<%=carrello.get(j).getPiattaforma()%>"><img src="<%=lImm.get(j)%>"> </a>
            <div id="descrizione">
                <%=carrello.get(j).getVideogioco()%>, <%=carrello.get(j).getPiattaforma()%>
            </div>
            <div id="prezzo">
                <%=carrello.get(j).getPrezzo()%>€
            </div>
            <buttton id="delete">
                X
            </buttton>
        </div>
        <hr>
    <%}%>
    <div>
        <button id="acquistaButton">ACQUISTA</button>
    </div>
    <%}%>
</div>

</body>
</html>
