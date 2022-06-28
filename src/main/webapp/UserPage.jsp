<%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 23/06/2022
  Time: 15:50
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
                <p>I miei ordini</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m1')">
                <p>Libreria</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m2')">
                <p>Review</p>
            </div>
            <div class="bottoneImpostazioni" onclick="showMenu('m3')">
                <p>impostazioni</p>
            </div>
        </div>
    </div>
</div>

<div id="menuUtente">

    <div id="m" class="hiddenMenu">
        <%for(int i=0; i<4; i++){%>
            <div class="acquisto">
                <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
                <div id="descrizione">
                    descrizione gioco
                </div>
                <div id="prezzo">
                    50$
                </div>
            </div>
        <%}%>
    </div>
    <div id="m1" class="hiddenMenu">
        <%for(int i=0; i<6; i++){%>
        <div class="elemento">
            <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
            <p>nome gioco</p>
        </div>
        <%}%>
    </div>
    <div id="m2" class="hiddenMenu">
        <%for(int i=0; i<8; i++){%>
            <div id="recensione">
                <div id="buttonsection">
                    <button class="bottoneRecensione" id="delete">
                    </button>
                    <button class="bottoneRecensione" id="editbutton">
                    </button>
                </div>
                <div id="testo">
                    testo recensione
                </div>
            </div>
        <%}%>
    </div>
    <div id="m3" class="hiddenMenu">
        <a href="ImpostazioniPage.jsp">ciao</a>
    </div>
    </div>
</body>
</html>
