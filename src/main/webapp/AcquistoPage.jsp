<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 18/08/2022
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>GamerKing | Acquisto</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CarrelloStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script type="text/javascript" src="javaScript/HomeScript.js"></script>
    <script type="text/javascript" src="javaScript/AcquistoPageScript.js"></script>
    <!--ottenimento lista degliu elementi nel carrello-->
    <%ArrayList<Selezionare> l = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));%>
</head>
<body onscroll="sectionLight(<%=l.size()%>); barEffect(),secondBarEffect()">
<%@include file="NavBar.jsp" %>
<%
    //ottenimento lista degli elementi nel carrello e lista delle carte
    ArrayList<Selezionare> list = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));
    ArrayList<Sottoscrivere> listSottoscrizioni = SottoscrivereDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente"));
    int i;
    //conversione di lista di selezionare in lista di prodotti
    ArrayList<Prodotto> carrello = new ArrayList<>();
    for(i=0; i<list.size(); i++){
        Selezionare s = list.get(i);
        Prodotto p = ProdottoDAO.doRetriveById(s.getVideogioco(), s.getPiattaforma());
        carrello.add(p);
    }
    //controllo se l'utente è registrato, se non gli chiede di registrarsi
    if(session.getAttribute("nomeUtente").equals("LOGIN")){%>
    <p id="sezione">Per effettuare un acquisto <a href="loginPage.jsp">accedere</a> o <a href="RegistrationPage.jsp">registrarsi</a> al sito!</p>
<%}else{%>
<div id="fasiAcq">
    <div class="fasiAcquisto"><a id="fase1" href="#">PRODOTTI</a></div>
    <div class="fasiAcquisto"><a id="fase2" href="#">FATTURAZIONE</a></div>
    <div class="fasiAcquisto"><a id="fase3" href="#">FATTO</a></div>
</div>
<form style="margin-top: 130px" id="acquistoCarrello" method="POST" action="<%if(!listSottoscrizioni.isEmpty()){%>AcquistoCarrello<%}%>">
    <!--iterazione carrello per creare un div per ogni prodotto con link al gioco, e input per cambiare la quantità-->
<%for(int u=0; u< carrello.size();u++){%>
<div class="carrelloItem">

    <a href="CaricaProdotto?titolo=<%=carrello.get(u).getVideogioco()%>&piattaforma=<%=carrello.get(u).getPiattaforma()%>">
        <img src="<%=ImmagineDAO.getMainImageByVideogame(carrello.get(u).getVideogioco())%>">
    </a>

    <div id="descrizione">
        <p class="infoProdotto">
            <%=carrello.get(u).getVideogioco()%>, <%=carrello.get(u).getPiattaforma()%>
        </p>

        <p class="infoProdotto">
            <%=carrello.get(u).getPrezzo()%>€
        </p>
    </div>
<!--selezionare la quantità di acquisto del gioco-->
    <div id="selezionaQuantita">
        <label for="num">Scegli la quantità</label><br>
        <input type="number" value="1" id="num" class="inputNumber" name="<%=carrello.get(u).getVideogioco()%><%=carrello.get(u).getPiattaforma()%>" onkeyup="checkQuantitaPositive()">
    </div>

</div>
<hr>
<%}%>
    <!--div per selezionare la carta-->
    <div id="selezionaCarta">
        <!--messaggio di errore gestito da js-->
        <p id="errore">Non puoi inserire numeri negativi</p>
        <p id="sezione">Inserimento estremi di fatturazione</p>
        <%
            if(listSottoscrizioni.size() > 0){
                int j;
                //iterazione carte per creare un div per ogni carta che viene selezionata attraverso un input type radio
                for(j=0; j<listSottoscrizioni.size(); j++){
                    Carta c = CartaDAO.doRetriveById(listSottoscrizioni.get(j).getNumero());
        %>
        <div id="carta">
            <p id="nomeCognome">Intestatario:<%=c.getCognome()%> <%=c.getNome()%></p>
            <p id="indirizzo">Indirizzo:<%=listSottoscrizioni.get(j).getCitta()%> <%=listSottoscrizioni.get(j).getCap()%></p>
            <p><%=listSottoscrizioni.get(j).getVia()%> <%=listSottoscrizioni.get(j).getNumCivico()%></p>
            <p id="numeroCarta">Numero:**** **** **** <%=c.getNumero().substring(11)%></p>
            <label for="check<%=j%>">Seleziona</label>
            <input type="radio" id="check<%=j%>" name="selezioneCarta" value="<%=c.getNumero()%>" <%if(j==0){%>checked<%}%>>
            <input type="hidden" name="via<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getVia()%>">
            <input type="hidden" name="cap<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getCap()%>">
            <input type="hidden" name="via<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getVia()%>">
            <input type="hidden" name="civico<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getNumCivico()%>">
            <input type="hidden" name="citta<%=c.getNumero()%>" value="<%=listSottoscrizioni.get(j).getCitta()%>">
        </div>
        <%}}%>
        <br>
        <br>
        <br>
        <%if(!listSottoscrizioni.isEmpty()){%>
        <input id="bottoneAcquistoCarrello" type="submit" value="Acquista">
        <%}%>
    </div>
</form>
<%}%>
<!--form per l'aggiunta delle carte di credito nol caso l'acquisto deve essere fatto con un'altra carta-->
<form method="POST" action="PaginaAggiuntaCarta" style="text-align:center">
    <input type="hidden" name="ritorno" value="AcquistoPage.jsp">
    <input type="submit" id="aggiungiCarta" class="parag" value="Aggiungi una nuova carta per il pagamento">
</form>
</body>
</html>
