<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Prodotto" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 26/08/2022
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Riepilogo acquisto</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/RiepilogoAcquistoPageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CarrelloStyle.css">
    <script type="text/javascript" src="javaScript/HomeScript.js"></script>
</head>
<body>
<%@include file="NavBar.jsp" %>
<%
    if(request.getAttribute("controlloAcquisto").equals("acquistato")){
%>
<div class="corpo">
    <div class="fasiAcquisto"><a id="fase1" href="#">PRODOTTI</a></div>
    <div class="fasiAcquisto"><a id="fase2" href="#">FATTURAZIONE</a></div>
    <div class="fasiAcquisto"><a id="fase3" href="#" style="color: white">FATTO</a></div>
    <p class="messaggioAcquisto">Acquisto effettuato con successo!<br>A breve verrà inviata una mail all'indirizzo mail: <%=request.getAttribute("mail")%></p>
</div>
<%}else{%>
<div class="corpo">
    <p class="messaggioAcquisto">L'acquisto non è stato effettuato!<br>Iseguenti prodotti non sono disponibili nella quantità scelta</p>
    <%
        ArrayList<Prodotto> carrello = (ArrayList<Prodotto>) request.getAttribute("prodotti");
        int i;
        for(i=0; i<carrello.size(); i++){%>
            <p class="messaggioAcquisto">-<%=carrello.get(i).getVideogioco()%></p>
    <%}%>
</div>
<%}%>
</body>
</html>
