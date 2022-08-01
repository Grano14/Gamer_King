<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 18/07/2022
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CartaStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>

<%@include file="NavBar.jsp" %>

<%
    ArrayList<Carta> lCarte = (ArrayList<Carta>) request.getAttribute("listaCarte");
%>

<div id="oggettiCarta">
    <p id="testoCarta"> Carte di credito</p>
    <%for(Carta c:lCarte){%>
    <div class="cartaItem">

        <div id="descrizione">

            <p id="nomeCognome"><%=c.getCognome()%> <%=c.getNome()%></p>
            <p id="indirizzo"><%=c.getCitta()%> <%=c.getCap()%></p>
            <p><%=c.getVia()%> <%=c.getNumCivico()%></p>
            <p id="numeroCarta">**** **** **** <%=c.getNumero().substring(11)%></p>

        </div>

        <div class="bottoni">
            <div>
                <form class="bottoneModifica" action="">
                    <input type="hidden" name="id" value="">
                    <input type="submit" value="Modifica">
                </form>
            </div>
            <div>
                <form class="bottoneModifica" action="">
                    <input type="hidden" name="id" value="">
                    <input type="submit" value="Elimina">
                </form>
            </div>
        </div>
    </div>
    <br>
    <hr>
    <%}%>

    <div>
        <form class="bottoneModifica" action="PaginaAggiuntaCarta">
            <input type="hidden" name="ritorno" value="PaginaModificaCarte">
            <input type="submit" id="Aggiunta" value="Aggiungi">
        </form>
    </div>
</div>
</body>
</html>
