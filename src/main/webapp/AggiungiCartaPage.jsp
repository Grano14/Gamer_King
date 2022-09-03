<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 18/07/2022
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>GamerKing | Aggiungi dati carta</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" href="css/LoginPageStyle.css" type="text/css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">

    <script type="text/javascript" src="javaScript/AggiuntaCartaScript.js"></script>
</head>
<body>

<%
    String ritorno = (String) request.getAttribute("ritorno");
    String videogioco = (String) request.getAttribute("videogioco");
    String piattaforma = (String) request.getAttribute("piattaforma");
    String errore = (String) request.getAttribute("errore");
    if(errore!=null){
%>
<p id="erroreGrosso"><%=errore%></p>
<%}%>
<div id="registration">
    <!--form per l'aggiunta delle carte di credito-->
    <form id="formCarta" method="POST" action="">
        <input type="hidden" name="ritorno" value="<%=ritorno%>">
        <input type="hidden" name="videogioco" value="<%=videogioco%>">
        <input type="hidden" name="piattaforma" value="<%=piattaforma%>">
        <label for="card">Numero carta</label><br>
        <input type="text" class="serch" id="card" name="numero" maxLength="16" onkeyup="checkNumero('card','erroreCarta'),checkButton()">
        <!--messaggi di errore della classe erroreReg gestiti tramite js-->
        <p class="erroreReg" id="erroreCarta">
            Numero di carta composto da 10 numeri
        </p>
        <br>
        <label for="numeroVer">Numero di sicurezza</label><br>
        <input type="text" class="serch" id="numeroVer" name="verifica" maxLength="3" onkeyup="checkVerifica('numeroVer','erroreVerifica'),checkButton()">

        <p class="erroreReg" id="erroreVerifica">
            Inserire 3 numeri
        </p>
        <br>
        <label for="scade">Scadenza</label><br>
        <input type="date" class="serch" id="scade" name="scadenza" oninput="checkScadenza('scade'),checkButton()">
        <br>
        <label for="proprietarioNome">Nome proprietario</label><br>
        <input type="text" class="serch" id="proprietarioNome" name="nome" maxLength="25" onkeyup="checkNome('proprietarioNome','erroreNome'),checkButton()">

        <p class="erroreReg" id="erroreNome">
            I numeri non sono ammessi
        </p>
        <br>
        <label for="proprietarioCognome">Cognome proprietario</label><br>
        <input type="text" class="serch" id="proprietarioCognome" name="cognome" maxLength="25" onkeyup="checkCognome('proprietarioCognome','erroreCognome'),checkButton()">
        <p class="erroreReg" id="erroreCognome">
            I numeri non sono ammessi
        </p>
        <br>
        <p>Indirizzo</p>
        <label for="comune">Comune</label><br>
        <input type="text" class="serch" id="comune" name="citta" maxLength="25" onkeyup="checkCitta('comune','erroreCitta'),checkButton()">
        <p class="erroreReg" id="erroreCitta">
            I numeri non sono ammessi
        </p>
        <br>
        <label for="via">Via/Piazza</label><br>
        <input type="text" class="serch" id="via" name="via" maxLength="25" onkeyup="checkVia('via'),checkButton()">
        <br>
        <label for="nCivico">Numero civico</label><br>
        <input type="text" class="serch" id="nCivico" name="numCivico" maxLength="4" onkeyup="checkNumCivico('nCivico','erroreNumCivico'),checkButton()">
        <p class="erroreReg" id="erroreNumCivico">
            Solo numeri ammessi
        </p>
        <br>
        <label for="CAP">CAP</label><br>
        <input type="text" class="serch" id="CAP" name="cap" maxLength="5" onkeyup="checkCap('CAP','erroreCap'),checkButton()">
        <p class="erroreReg" id="erroreCap">
            Solo numeri ammessi
        </p>
        <br><br>
        <input type="submit" value="Aggiungi" id="bottone">
    </form>
</div>
</body>
</html>
