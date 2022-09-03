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
    <title>GamerKing | Lista estremi di fatturazione</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/CartaStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>

<%@include file="NavBar.jsp" %>

<%
    ArrayList<Sottoscrivere> lCarte = (ArrayList<Sottoscrivere>) request.getAttribute("listaCarte");
%>

<div id="oggettiCarta">
    <p id="testoCarta"> Carte di credito</p>
    <!--visualizzazione elenco delle carte registrate-->
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
            <!--bottoni di modifica ed aliminazione delle carte-->
            <div>
                <form class="bottoneModifica" method="POST" action="ModificaCarta">
                    <input type="hidden" name="numero" value="<%=s.getNumero()%>">
                    <input type="hidden" name="citta" value="<%=s.getCitta()%>">
                    <input type="hidden" name="cap" value="<%=s.getCap()%>">
                    <input type="hidden" name="via" value="<%=s.getVia()%>">
                    <input type="hidden" name="numCivico" value="<%=s.getNumCivico()%>">
                    <input type="submit" value="Modifica">
                </form>
            </div>
            <div>
                <form class="bottoneModifica" method="POST" action="EliminaCarta">
                    <input type="hidden" name="numero" value="<%=s.getNumero()%>">
                    <input type="hidden" name="citta" value="<%=s.getCitta()%>">
                    <input type="hidden" name="cap" value="<%=s.getCap()%>">
                    <input type="hidden" name="via" value="<%=s.getVia()%>">
                    <input type="hidden" name="numCivico" value="<%=s.getNumCivico()%>">
                    <input type="submit" value="Elimina">
                </form>
            </div>
        </div>
    </div>
    <br>
    <hr>
    <%}%>

    <div>
        <!--form per l'aggiunta di nuove carte-->
        <form class="bottoneModifica" method="POST" action="PaginaAggiuntaCarta">
            <input type="hidden" name="ritorno" value="PaginaModificaCarte">
            <input type="submit" id="Aggiunta" value="Aggiungi">
        </form>
    </div>
</div>
</body>
</html>
