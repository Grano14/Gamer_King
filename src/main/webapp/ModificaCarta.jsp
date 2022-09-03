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
    <title>GamerKing | Modifica estremi di fatturazione</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" href="css/LoginPageStyle.css" type="text/css">

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">

    <script type="text/javascript" src="javaScript/ModificaCartaScript.js"></script>
</head>
<body>
<!--Recupero dati estremi di fatturazione-->
<%
    Sottoscrivere s = (Sottoscrivere) request.getAttribute("sottoscrivere");

    String errore = (String) request.getAttribute("errore");
    if(errore!=null){
%>
<!--Possibili errori-->
<p class="erroreReg">
    <%=errore%>
</p>
<%}%>
<!--Form modifica indirizzo-->
<div id="registration">
    <form id="formModificaCarta" method="POST" action="">

        <input type="hidden" name="modifica" value="1">
        <input type="hidden" name="numero" value="<%=s.getNumero()%>">
        <input type="hidden" name="cittaIniziale" value="<%=s.getCitta()%>">
        <input type="hidden" name="viaIniziale" value="<%=s.getVia()%>">
        <input type="hidden" name="numCivicoIniziale" value="<%=s.getNumCivico()%>">
        <input type="hidden" name="capIniziale" value="<%=s.getCap()%>">
        <!--Modifica comune-->
        <label for="comune">Comune</label><br>
        <input type="text" class="serch" id="comune" name="citta" value="<%=s.getCitta()%>" maxLength="25" onkeyup="checkCitta('comune','erroreCitta'),checkUpdateButton()">
        <!--Messaggio errore-->
        <p class="erroreReg" id="erroreCitta">
            I numeri non sono ammessi
        </p>
        <br>
        <!--Modifica via-->
        <label for="via">Via/Piazza</label><br>
        <input type="text" class="serch" id="via" name="via" value="<%=s.getVia()%>" maxLength="25" onkeyup="checkVia('via'),checkUpdateButton()">
        <br>
        <!--Modifica numero civico-->
        <label for="nCivico">Numero civico</label><br>
        <input type="text" class="serch" id="nCivico" name="numCivico" value="<%=s.getNumCivico()%>" maxLength="4" onkeyup="checkNumCivico('nCivico','erroreNumCivico'),checkUpdateButton()">
        <!--Messaggio errore-->
        <p class="erroreReg" id="erroreNumCivico">
            Solo numeri ammessi
        </p>
        <br>
        <!--Modifica cap-->
        <label for="CAP">CAP</label><br>
        <input type="text" class="serch" id="CAP" name="cap" value="<%=s.getCap()%>" maxLength="5" onkeyup="checkCap('CAP','erroreCap'),checkUpdateButton()">
        <!--Messaggio errore-->
        <p class="erroreReg" id="erroreCap">
            Solo numeri ammessi
        </p>
        <br><br>
        <input type="submit" value="Modifica" id="bottone">

    </form>
</div>

</body>
</html>
