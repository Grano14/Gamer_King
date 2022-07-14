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
    <script type="text/javascript" src="UserPageScript.js"></script>
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
                <p>Feedback</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m1')">
                <p>Statistiche vendite</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m2')">
                <p>Aggiungi prodotto</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m3')">
                <p>Rimuovi prodotto</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m4')">
                <p>Review</p>
            </div>
        </div>
    </div>
</div>

<div id="menuUtente">
    <div id="m" class="hiddenMenu"></div>
    <div id="m1" class="hiddenMenu"></div>
    <div id="m2" class="hiddenMenu"></div>
    <div id="m3" class="hiddenMenu"></div>


    <div id="m4" class="hiddenMenu">
        <%for(int i=0; i<4; i++){%>
        <div class="acquisto">
            <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
            <div id="buttonDelate">
                <button class="bottoneRecensione" id="delete">
                </button>
            <div id="descrizione">
                Recenzione
                </div>
            </div>
        </div>
        <%}%>
    </div>


</div>

</body>
</html>

