<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 18/07/2022
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifica dati carta</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" href="css/LoginPageStyle.css" type="text/css">
</head>
<body>

<%
    String ritorno = (String) request.getAttribute("ritorno");
    String videogioco = (String) request.getAttribute("videogioco");
    String piattaforma = (String) request.getAttribute("piattaforma");
%>

<div id="registration">
    <form method="POST" action="AggiungiCarta">
        <input type="hidden" name="ritorno" value="<%=ritorno%>">
        <input type="hidden" name="videogioco" value="<%=videogioco%>">
        <input type="hidden" name="piattaforma" value="<%=piattaforma%>">
        <label for="card">Numero carta</label><br>
        <input type="text" class="serch" id="card" name="numero"><br>
        <label for="numeroVer">Numero di sicurezza</label><br>
        <input type="text" class="serch" id="numeroVer" name="verifica"><br>
        <label for="scade">Scadenza</label><br>
        <input type="date" class="serch" id="scade" name="scadenza"><br>
        <label for="proprietarioNome">Nome proprietario</label><br>
        <input type="text" class="serch" id="proprietarioNome" name="nome"><br>
        <label for="proprietarioCognome">Cognome proprietario</label><br>
        <input type="text" class="serch" id="proprietarioCognome" name="cognome"><br>
        <p>Indirizzo</p>
        <label for="comune">Comune</label><br>
        <input type="text" class="serch" id="comune" name="citta"><br>
        <label for="via">Via/Piazza</label><br>
        <input type="text" class="serch" id="via" name="via"><br>
        <label for="nCivico">Numero civico</label><br>
        <input type="text" class="serch" id="nCivico" name="numCivico"><br>
        <label for="CAP">CAP</label><br>
        <input type="text" class="serch" id="CAP" name="cap"><br><br>
        <input type="submit" value="Aggiungi" id="bottone">
    </form>
</div>
</body>
</html>
