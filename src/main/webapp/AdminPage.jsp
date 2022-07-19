<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 28/06/2022
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <titlee>User1</titlee>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">
    <script type="text/javascript" src="javaScript/UserPageScript.js"></script>
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
                <p>Statistiche vendite</p>
            </div>
            <a href="AggiungiGiocoPage.jsp" style="text-decoration:none">
                <div class="bottoneImpostazioni">
                    <p>Aggiungi prodotto</p>
                </div>
            </a>
            <div class="bottoneImpostazioni" onclick="showMenu('m1')">
                <p>Rimuovi prodotto</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m2')">
                <p>Review</p>
            </div>
        </div>
    </div>
</div>

<div id="menuUtente">
    <div id="m" class="hiddenMenu"></div>
    <div id="m1" class="hiddenMenu"></div>
    <div id="m2" class="hiddenMenu"></div>
</div>

</body>
</html>

