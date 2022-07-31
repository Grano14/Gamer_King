<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 23/06/2022
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Modifica recensione</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/ModificaRecensioneStyle.css">
    <script type="text/javascript" src="javaScript/ProdottoScript.js"></script>
    <script type="text/javascript" src="javaScript/StelleScript.js"></script>
</head>
<body>

<%@include file="NavBar.jsp" %>

<%  String img = (String) request.getAttribute("immagine");
    Prodotto p = (Prodotto) request.getAttribute("prodotto");
    Recensione r = (Recensione) request.getAttribute("rec");
    Videogioco v = (Videogioco) request.getAttribute("videogioco");
%>


<div id="prodotto">
    <div id="immagine">
        <img src="<%=img%>">
    </div>

    <div id="gioco">
        <div>
            <p class="nome"><%=p.getVideogioco()%> <%=p.getPiattaforma()%></p>
        </div>
        <p id="descrizioneProdotto"><%=v.getDescrizione()%></p>
    </div>
</div>
<br>
<br>
<hr>
<div>
    <p class="nome">Modifica la tua Recensione</p>
    <form class="recensione" action="UpdateRecensione">

        <div id="stelle" onclick="checkRecensione()">
            <script type="text/javascript">star(<%=r.getNstelle()%>);</script>
        </div>

        <input type="hidden" id="nStelle" name="nStelle" value="0">
        <input type="hidden" name="videogioco" value="<%=p.getVideogioco() %>">
        <input type="hidden" name="piattaforma" value="<%=p.getPiattaforma() %>">

        <textarea id="testoRecensione" name="recensione" placeholder="Scrivi la tua recensione..."
                  onkeyup="validateRecensione('testoRecensione'),checkRecensione()"><%=r.getContenuto()%></textarea>

        <input id="submitRecensione" type="submit" value="Modifica">
    </form>

</div>

</body>
</html>