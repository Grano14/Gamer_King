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
           <p class="testo">Modifica elementi</p>
           <form>
               <div class="bottoneImpostazioni" onclick="showMenu('m4')">
                   <p class="testo">Dati Personali</p>
               </div>
               <div class="bottoneImpostazioni" onclick="showMenu('m5')">
                   <p class="testo">Password</p>
               </div>
               <div class="bottoneImpostazioni" onclick="showMenu('m6')">
                   <p class="testo">Estremi di fatturazione</p>
               </div>
           </form>
       </div>

    <div id="m4" class="hiddenMenu">
        <p>Dati personali</p>
        <form>
            <div class="forms">
                <label for="firstName">Nome</label><br>
                <input type="text" class="serch" id="firstName"><br>
                <label for="lastName">Cognome</label><br>
                <input type="text" class="serch" id="lastName"><br>
                <label for="mail">Email</label><br>
                <input type="text" class="serch" id="mail"><br>
                <label for="phone">Telefono</label><br>
                <input type="text" class="serch" id="phone"><br>
            </div>
        </form>
    </div>

    <div id="m5" class="hiddenMenu">
        <p>Nuova Password</p>
        <form>
            <div class="forms">
                <label for="pass">Password</label><br>
                <input type="password" class="serch" id="pass"><br>
                <label for="passConf">Conferma nuova password</label><br>
                <input type="password" class="serch" id="passConf"><br>
                <input type="submit" value="PROCEDI" id="bottone">
            </div>
        </form>
    </div>


    <div id="m6" class="hiddenMenu">
        <p>Estremi di fatturazione</p>
        <form>
            <div class="forms">
                <label for="card">Nome</label><br>
                <input type="text" class="serch" id="card"><br>
                <label for="numeroVer">Cognome</label><br>
                <input type="" class="serch" id="numeroVer"><br>
                <label for="scade">Email</label><br>
                <input type="text" class="serch" id="scade"><br>
                <label for="proprietarioNome">Telefono</label><br>
                <input type="text" class="serch" id="proprietarioNome"><br>
                <label for="proprietarioCognome">Telefono</label><br>
                <input type="text" class="serch" id="proprietarioCognome"><br>
            </div>
        </form>
    </div>
</div>
<p id="ttt"></p>
</body>
</html>
