<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 28/06/2022
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <titlee>Impostazioni</titlee>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">

    <script type="text/javascript" src="javaScript/UserPageScript.js"></script>

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>
<%@include file="NavBar.jsp" %>
<div id="user">
    <div id="utenteInfo">
        <img id="utenteimage" src="css/pictures/utenteGenerico.png">
        <p id="userid">Nome utente</p>
        <p id="email">ciaociao@ciao.com</p>
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni" onclick="showMenu('m')">
                <p class="testo">Dati Personali</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m1')">
                <p class="testo">Password</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m2')">
                <p class="testo">Aggiungi di Credito</p>
            </div>

            <a href="ModificaCartePage.jsp">
                <div class="bottoneImpostazioni">
                    <p class="testo">Modifica di Credito</p>
                </div>
            </a>
        </div>
    </div>
</div>

<div id="menuUtente">
    <div id="m" class="hiddenMenu">
        <%@include file="FormDati.jsp" %>
    </div>

    <div id="m1" class="hiddenMenu">
        <%@include file="CambioPassword.jsp"%>
    </div>

    <div id="m2" class="hiddenMenu">
        <%@include file="EstremiFatturazione.jsp" %>
    </div>

</div>
</body>
</html>
