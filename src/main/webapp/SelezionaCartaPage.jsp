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
    <title>GamerKing | Seleziona carta</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/SelezionaCartaStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CarrelloStyle.css">
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

<form id="acquistaProdotto" method="POST" action="AcquistoSingolo">
<div id="prodotto">
    <div id="immagine">
        <img src="<%=img%>">
    </div>

    <div id="gioco">
        <div>
            <p class="nome"><%=videogioco%> <%=piattaforma%></p>
        </div>
        <div>
            <input type="number" name="quantita" id="quant" value="1" onkeyup="checkQuantita()">
            <p id="errore">Devi ordinare almeno un prodotto</p>
        </div>
    </div>
</div>
<br>
<br>
<hr>

<div id="oggettiCarta">
    <p id="testoCarta"> Carte di credito</p>

    <div id="selezionaCarta">
        <p id="sezione">Inserimento estremi di fatturazione</p>
        <%
            ArrayList<Sottoscrivere> listSottoscrizioni = SottoscrivereDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente"));
            if(listSottoscrizioni.size() > 0){
                int j;
                for(j=0; j<listSottoscrizioni.size(); j++){
                    Sottoscrivere s = listSottoscrizioni.get(j);
                    Carta c = CartaDAO.doRetriveById(s.getNumero());
        %>
        <div id="carta">
            <p id="nomeCognome">Intestatario:<%=c.getCognome()%> <%=c.getNome()%></p>
            <p id="indirizzo">Indirizzo:<%=s.getCitta()%> <%=s.getCap()%></p>
            <p><%=s.getVia()%> <%=s.getNumCivico()%></p>
            <p id="numeroCarta">Numero:**** **** **** <%=s.getNumero().substring(11)%></p>
            <label for="check<%=j%>">Seleziona</label>
            <input type="radio" id="check<%=j%>" name="selezioneCarta" value="<%=s.getNumero()%>" <%if(j==0){%>checked<%}%>>
            <input type="hidden" name="via<%=s.getNumero()%>" value="<%=s.getVia()%>">
            <input type="hidden" name="cap<%=s.getNumero()%>" value="<%=s.getCap()%>">
            <input type="hidden" name="civico<%=s.getNumero()%>" value="<%=s.getNumCivico()%>">
            <input type="hidden" name="citta<%=s.getNumero()%>" value="<%=s.getCitta()%>">
        </div>
        <%}}%>
        <br>
        <br>
        <br>
        <input type="hidden" name="videogioco" value="<%=videogioco%>">
        <input type="hidden" name="piattaforma" value="<%=piattaforma%>">
        <input id="bottoneAcquistoCarrello" type="submit" value="Acquista">
    </div>
</div>
</form>
<form method="POST" action="PaginaAggiuntaCarta">
    <input type="hidden" name="videogioco" value="<%=videogioco%>">
    <input type="hidden" name="piattaforma" value="<%=piattaforma%>">
    <input type="hidden" name="ritorno" value="PaginaSelezionaCarta">
    <input type="submit" id="aggiungiCarta" class="parag" value="Aggiungi una nuova carta per il pagamento">
</form>
</body>
</html>
