<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 23/06/2022
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <titlee>Impostazioni</titlee>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">

    <script type="text/javascript" src="javaScript/UserPageScript.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#showM").click(function(){
                $("#m1").hide();
                $("#m").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM1").click(function(){
                $("#m").hide();
                $("#m1").toggle();
            });
        });
    </script>

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>
<%@include file="NavBar.jsp" %>

<%
    Utente user = (Utente) request.getAttribute("utente");
%>
<div id="user">
    <div id="utenteInfo">
        <img id="utenteimage" src="css/pictures/utenteGenerico.png">
        <p id="userid"><%=user.getNomeUtente()%></p>
        <p id="email"><%=user.getEmail()%></p>
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni" id="showM">
                <p class="testo">Dati Personali</p>
            </div>
            <div class="bottoneImpostazioni" id="showM1">
                <p class="testo">Password</p>
            </div>

            <div class="bottoneLogout">
                <form class="bottoneModifica" action="">
                    <input type="submit" value="Carte di credito">
                </form>
            </div>

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

</div>
</body>
</html>
