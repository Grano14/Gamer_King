<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 28/06/2022
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" href="css/LoginPageStyle.css" type="text/css">
</head>
<body>

<%
    Sottoscrivere s = (Sottoscrivere) request.getAttribute("sottoscrivere");
%>

<div id="registration">
    <form method="POST" action="UpdateSottoscrivere">

        <label for="comune">Comune</label><br>
        <input type="hidden" name="numero" value="<%=s.getNumero()%>">
        <input type="text" class="serch" id="comune" name="citta" value="<%=s.getCitta()%>"><br>
        <label for="via">Via/Piazza</label><br>
        <input type="text" class="serch" id="via" name="via" value="<%=s.getVia()%>"><br>
        <label for="nCivico">Numero civico</label><br>
        <input type="text" class="serch" id="nCivico" name="numCivico" value="<%=s.getNumCivico()%>"><br>
        <label for="CAP">CAP</label><br>
        <input type="text" class="serch" id="CAP" name="cap" value="<%=s.getCap()%>"><br><br>
        <input type="submit" value="Modifica" id="bottone">

    </form>
</div>

</body>
</html>
