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
        String nome = (String) session.getAttribute("nomeUtente");
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
            <div id="boxBottoni">
                <button class="bottoni" id="delete" onclick="deleteElement('<%=carrello.get(j).getVideogioco()%>', '<%=carrello.get(j).getPiattaforma()%>', '<%=nome%>')">
                    Elimina
                </button>

                <form method="POST" action="">
                    <input type="hidden" name="videogioco" value="<%=carrello.get(j).getVideogioco()%>">
                    <input type="hidden" name="piattaforma" value="<%=carrello.get(j).getPiattaforma()%>">
                    <input type="submit" class="bottoni" value="Acquista">
                </form>
            </div>

        </div>
        <hr>
    <%}%>
    <br>
    <div id="acquistoTutto">
        <a id="acquistaButton" href="AcquistoPage.jsp">Acquista</a>
    </div>
    <br>
    <%}%>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function deleteElement(t, p, n){
        $.ajax({
            url:"EliminaProdottoCarrello",
            type: 'GET',
            data:{
                titolo: t,
                piattaforma: p,
                nomeUtente: n
            },
            success: function (data){
                window.location.reload();
            }
        })
    }
</script>

</body>
</html>
