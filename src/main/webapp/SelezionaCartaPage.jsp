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

    <div id="selezionaCarta">
        <p id="sezione">Inserimento estremi di fatturazione</p>
        <%
            ArrayList<Sottoscrivere> listSottoscrizioni = SottoscrivereDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente"));
            if(listSottoscrizioni.size() > 0){
                int j;
                for(j=0; j<listSottoscrizioni.size(); j++){
                    Carta c = CartaDAO.doRetriveById(listSottoscrizioni.get(j).getNumero());
        %>
        <div id="carta">
            <p id="nomeCognome">Intestatario:<%=c.getCognome()%> <%=c.getNome()%></p>
            <p id="indirizzo">Indirizzo:<%=listSottoscrizioni.get(j).getCitta()%> <%=listSottoscrizioni.get(j).getCap()%></p>
            <p><%=listSottoscrizioni.get(j).getVia()%> <%=listSottoscrizioni.get(j).getNumCivico()%></p>
            <p id="numeroCarta">Numero:**** **** **** <%=c.getNumero().substring(11)%></p>
            <label>Seleziona</label>
            <input type="radio" name="selezioneCarta" value="<%=c.getNumero()%>">
            <input type="hidden" name="via<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getVia()%>">
            <input type="hidden" name="cap<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getCap()%>">
            <input type="hidden" name="via<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getVia()%>">
            <input type="hidden" name="civico<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getNumCivico()%>">
            <input type="hidden" name="citta<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getCitta()%>">
        </div>
        <%}}%>
        <br>
        <br>
        <a id="aggiungiCarta" href="PaginaModificaCarte" class="parag">Aggiungi una nuova carta per il pagamento</a>
        <br>
        <input id="bottoneAcquistoCarrello" type="submit" value="Acquista">
    </div>



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
