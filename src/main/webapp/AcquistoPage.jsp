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
    <title>Acquisto</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CarrelloStyle.css">
    <script type="text/javascript" src="javaScript/HomeScript.js"></script>
    <%ArrayList<Selezionare> l = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));%>
</head>
<body onscroll="sectionLight(<%=l.size()%>); barEffect()">
<%@include file="NavBar.jsp" %>
<% ArrayList<Selezionare> list = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));
    int i;
    ArrayList<Prodotto> carrello = new ArrayList<>();
    for(i=0; i<list.size(); i++){
        Selezionare s = list.get(i);
        Prodotto p = ProdottoDAO.doRetriveById(s.getVideogioco(), s.getPiattaforma());
        carrello.add(p);
    }
    if(session.getAttribute("nomeUtente").equals("LOGIN")){%>
    <p id="sezione">Per effettuare un acquisto <a href="loginPage.jsp">accedere</a> o <a href="RegistrationPage.jsp">registrarsi</a> al sito!</p>
<%}else{%>
<div id="fasiAcq">
    <div class="fasiAcquisto"><a id="fase1" href="#">PRODOTTI</a></div>
    <div class="fasiAcquisto"><a id="fase2" href="#">FATTURAZIONE</a></div>
    <div class="fasiAcquisto"><a id="fase3" href="#">FATTO</a></div>
</div>
<form style="margin-top: 130px">
<%for(int u=0; u< carrello.size();u++){%>
<div class="carrelloItem">
    <a href="CaricaProdotto?titolo=<%=carrello.get(u).getVideogioco()%>&piattaforma=<%=carrello.get(u).getPiattaforma()%>"><img src="<%=ImmagineDAO.getMainImageByVideogame(carrello.get(u).getVideogioco())%>"> </a>
    <div id="descrizione">
        <%=carrello.get(u).getVideogioco()%>, <%=carrello.get(u).getPiattaforma()%>
    </div>
    <div id="prezzo">
        <%=carrello.get(u).getPrezzo()%>€
        <div style="margin-left: 20px">
            <label for="num">Scegli la quantità</label><br>
            <input type="number" value="1" id="num" style="width: 45px">
        </div>
    </div>
</div>
<hr>
<%}%>
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
    </div>
    <%}}%>
    <a href="PaginaModificaCarte" class="parag">Aggiungi una nuova carta per il pagamento</a>
</form>
<%}%>
</body>
</html>
