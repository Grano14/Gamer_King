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
</head>
<body>
<%@include file="NavBar.jsp" %>
<div id="user">
    <div id="utenteInfo">
        <img id="utenteimage" src="css/pictures/utenteGenerico.png">
        <p id="userid">Nome utente</p>
        <p id="email">ciaociao@ciao.com</p>
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni">
                <p>impostazione 1</p>
            </div>
            <div class="bottoneImpostazioni">
                <p>impostazione 1</p>
            </div>
            <div class="bottoneImpostazioni">
                <p>impostazione 1</p>
            </div>
            <div class="bottoneImpostazioni">
                <p>impostazione 1</p>
            </div>
        </div>
    </div>
</div>
<div id="menuUtente">
    menu
</div>
</body>
</html>
