<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 16/06/2022
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Prodotto</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/ProductPageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script type="text/javascript" src="javaScript/ProdottoScript.js"></script>
    <script type="text/javascript" src="javaScript/StelleScript.js"></script>
</head>
<body>

<%@include file="NavBar.jsp" %>

<div id="prodotto">

    <div class="immagineEAcquisto">

        <div id="setImmagini">
            <ul class="fotoProdotto">

                <%
                    String d = (String)request.getAttribute("descrizione");
                    Prodotto p = (Prodotto) request.getAttribute("gioco");
                    ArrayList<String> lImm = (ArrayList<String>) request.getAttribute("immagini");
                    ArrayList<Recensione> lRec = (ArrayList<Recensione>) request.getAttribute("listaRec");
                    for(int i=0; i<lImm.size(); i++){%>

                <li>
                    <img class="altreFoto" id="immagine<%=i%>" src="<%=lImm.get(i)%>"
                         onclick="changeImmagine('immagine<%=i%>','secondaria')">

                </li>

                <%}%>

            </ul>

        </div>

        <div class="immagine2">
            <%String path = (String) request.getAttribute("immPrincipale");
            System.out.println(path);%>
            <img id="secondaria" src="<%=path%>">
        </div>

        <div class="acquisto">
            <p class="titolo"><%=p.getVideogioco()%></p>
            <p class="prezzo"><%String s = p.getPrezzo().toString();
                if(!(s.contains("."))){s=s+".00";}
                else{if(s.indexOf(".")==(s.length()-2)){s=s+"0";}}%><%=s%>???</p>
            <p class="prezzo" id="piattaforma"><%=p.getPiattaforma()%></p>
            <div class="bottoniAM">
            <form class="bottoneAcquisto" action="">
                <input type="hidden" name="id" value="">
                <input type="submit" value="Acquisto">
            </form>
        </div>
        <div>
            <form class="bottoneAcquisto" action="">
                <input type="hidden" name="id" value="">
                <input type="submit" value="Carrello">
            </form>
            </div>
        </div>

    </div>
<br>
</div>

<div id="descrizione">
    <p class="titolo">Descrizione</p>
    <p class="summary" id="trama">
        <%=d%>
    </p>
    <p class="summary" id="dataUscita">
        Data Uscita <%=p.getDataUscita()%>
    </p>
    <p class="summary" id="generi">
        <%
            ArrayList<String> l = (ArrayList<String>)request.getAttribute("generi");
            for(int i=0; i<l.size(); i++){
        %>
        <%=l.get(i)%> <%if(i!=l.size()-1){%>,<%}%> <%}%>
    </p>
</div>

<div>

    <% String utente =(String) request.getSession().getAttribute("nomeUtente");
    if(utente!="LOGIN"){
        if(!RecensioneDAO.contains(utente, p.getVideogioco(), p.getPiattaforma())){
    %>

    <form class="recensione" action="AggiungiRecensione">

        <div id="stelle" onclick="checkRecensione()">
            <script type="text/javascript">star(3);</script>
        </div>

        <input type="hidden" id="nStelle" name="nStelle" value="0">
        <input type="hidden" name="videogioco" value="<%=p.getVideogioco() %>">
        <input type="hidden" name="piattaforma" value="<%=p.getPiattaforma() %>">

        <textarea id="testoRecensione" name="recensione" placeholder="Scrivi la tua recensione..."
         onkeyup="validateRecensione('testoRecensione'),checkRecensione()"></textarea>

        <input id="submitRecensione" type="submit" value="Pubblica">
    </form>

    <%}
    }%>

</div>

</body>
</html>
