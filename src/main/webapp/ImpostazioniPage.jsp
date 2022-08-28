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
    <title>GamerKing | Impostazioni utente</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#showM").click(function(){
                $("#m1").hide();
                $("#m2").hide();
                $("#m").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM1").click(function(){
                $("#m").hide();
                $("#m2").hide();
                $("#m1").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM2").click(function(){
                $("#m").hide();
                $("#m1").hide();
                $("#m2").toggle();
            });
        });
    </script>

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>
<%@include file="NavBar.jsp" %>

<%
    Utente user = (Utente) request.getAttribute("utente");
    String erroreNome = (String) request.getAttribute("erroreNome");
    String erroreMail = (String) request.getAttribute("erroreMail");
%>
<div id="user">
    <div id="utenteInfo">
        <%
            String path = "";
            if(user.getImmagine()!=null) {
             path = user.getImmagine();
        }else {
            path ="css/pictures/utenteGenerico.png";
        }%>
        <img id="utenteimage" src="<%=path%>">
        <p id="userid"><%=user.getNomeUtente()%></p>
        <p id="email"><%=user.getEmail()%></p>
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni" id="showM">
                <p class="testo">Modifica nome</p>
            </div>
            <div class="bottoneImpostazioni" id="showM1">
                <p class="testo">Modifica email</p>
            </div>
            <div class="bottoneImpostazioni" id="showM2">
                <p class="testo">Password</p>
            </div>

            <div class="bottoneImpostazioni">
                <form class="bottoneModifica" action="PaginaModificaCarte">
                    <input type="submit" value="Carte di credito">
                </form>
            </div>

        </div>
    </div>
</div>

<div id="menuUtente">
    <div id="m" class="hiddenMenu"  <%if(erroreNome!=null){%> style="display:block"<%}%>>
        <%if(erroreNome!=null){%>
        <p style="color:red"><%=erroreNome%></p>
        <%}%>
        <%@include file="FormNomeUtente.jsp" %>
    </div>

    <div id="m1" class="hiddenMenu" <%if(erroreMail!=null){%> style="display:block"<%}%>>
        <%if(erroreMail!=null){%>
        <p style="color:red"><%=erroreMail%></p>
        <%}%>
        <%@include file="FormEmail.jsp" %>
    </div>

    <div id="m2" class="hiddenMenu">
        <%@include file="CambioPassword.jsp"%>
    </div>
</div>
</body>
</html>
