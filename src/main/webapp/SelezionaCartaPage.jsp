<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 03/08/2022
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Seleziona carta</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/SelezionaCartaStyle.css">

    <script type="text/javascript" src="javaScript/SelezionaCartaScript.js"></script>

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>

<%@include file="NavBar.jsp" %>

<%
    ArrayList<Sottoscrivere> lCarte = (ArrayList<Sottoscrivere>) request.getAttribute("listaCarte");
    String img = (String) request.getAttribute("immagine");
    String videogioco = (String) request.getAttribute("videogioco");
    String piattaforma = (String) request.getAttribute("piattaforma");
%>


<div id="prodotto">
    <div id="immagine">
        <img src="<%=img%>">
    </div>

    <div id="gioco">
        <div>
            <p class="nome"><%=videogioco%> <%=piattaforma%></p>
        </div>
        <div>
            <input type="number" id="quant" value="1" onkeyup="updateQuantita()">
            <p id="errore">Devi ordinare almeno un prodotto</p>
        </div>
    </div>
</div>
<br>
<br>
<hr>

<div id="oggettiCarta">
    <p id="testoCarta"> Carte di credito</p>
    <%for(Sottoscrivere s:lCarte){
        Carta c = CartaDAO.doRetriveById(s.getNumero());%>
    <div class="cartaItem">

        <div id="descrizione">

            <p id="nomeCognome"><%=c.getCognome()%> <%=c.getNome()%></p>
            <p id="indirizzo"><%=s.getCitta()%> <%=s.getCap()%></p>
            <p><%=s.getVia()%> <%=s.getNumCivico()%></p>
            <p id="numeroCarta">**** **** **** <%=c.getNumero().substring(11)%></p>

        </div>

        <div class="bottoni">
            <div>
                <form id="acquistaProdotto" class="bottoneModifica" method="POST" action="">
                    <input type="hidden" name="numero" value="<%=s.getNumero()%>">
                    <input type="hidden" name="cap" value="<%=s.getCap()%>">
                    <input type="hidden" name="citta" value="<%=s.getCitta()%>">
                    <input type="hidden" name="via" value="<%=s.getVia()%>">
                    <input type="hidden" name="numCivico" value="<%=s.getNumCivico()%>">
                    <input type="hidden" name="videogioco" value="<%=videogioco%>">
                    <input type="hidden" name="piattaforma" value="<%=piattaforma%>">
                    <input type="hidden" class="quantita" name="quantita">
                    <input type="submit" value="Seleziona">
                </form>
            </div>
        </div>
    </div>
    <br>
    <hr>
    <%}%>

    <div>
        <form class="bottoneModifica" method="POST" action="PaginaAggiuntaCarta">
            <input type="hidden" name="videogioco" value="<%=videogioco%>">
            <input type="hidden" name="piattaforma" value="<%=piattaforma%>">
            <input type="hidden" name="ritorno" value="PaginaSelezionaCarta">
            <input type="submit" id="Aggiunta" value="Aggiungi">
        </form>
    </div>
</div>
</body>
</html>
