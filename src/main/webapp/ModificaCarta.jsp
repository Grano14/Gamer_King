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
    <link rel="stylesheet" type="text/css" href="css/FormDatiStyle.css">
</head>
<body>
<div class="corpo">
    <form>
        <label for="card">Numero carta</label><br>
        <input type="text" class="serch" id="card"><br>
        <label for="numeroVer">Numero di sicurezza</label><br>
        <input type="text" class="serch" id="numeroVer"><br>
        <label for="scade">Scadenza</label><br>
        <input type="text" class="serch" id="scade"><br>
        <label for="proprietarioNome">Nome proprietario</label><br>
        <input type="text" class="serch" id="proprietarioNome"><br>
        <label for="proprietarioCognome">Cognome proprietario</label><br>
        <input type="text" class="serch" id="proprietarioCognome"><br>
        <p>Indirizzo</p><br>
        <label for="comune">Comune</label><br>
        <input type="text" class="serch" id="comune"><br>
        <label for="provincia">Provincia</label><br>
        <input type="text" class="serch" id="provincia"><br>
        <label for="via">Via/Piazza</label><br>
        <input type="text" class="serch" id="via"><br>
        <label for="nCivico">Numero civico</label><br>
        <input type="text" class="serch" id="nCivico"><br>
        <label for="CAP">CAP</label><br>
        <input type="text" class="serch" id="CAP"><br><br>
        <input type="submit" value="Modifica" id="bottone">
    </form>
</div>
</body>
</html>
