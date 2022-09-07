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
    <script type="text/javascript" src="javaScript/UtenteScript.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        <!--funzioni per gestire il clik sui pulsanti delle impostazioni facendo scomparire quelli non cliccati-->
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

        $(document).ready(function(){
            $("#togglteImmagine").click(function(){
                $("#formImg").slideToggle("fast");
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
    String errorePassword = (String) request.getAttribute("errorePassword");
%>
<div id="user">
    <div id="utenteInfo">
        <!--sezione della gestione dell'immagine di profilo-->
            <div style="width: 200px; display: inline-block">
                <%
                    String path = "";
                    if(user.getImmagine() == null){
                        path = "css/pictures/utenteGenerico.png";
                    }
                    else{
                        path = user.getImmagine();
                    }
                %>
                <img id="utenteimage" src="<%=path%>">
                <button style="position: relative;bottom: 35px; right: 50px" id="togglteImmagine"><img src="css/pictures/matita.png"></button>

                <!--ottenimento immagine di profilo da aggiornare-->
                <form action="" method="POST" id="formImg" style="display: none" enctype="multipart/form-data">
                    <label id="updateImg">Carica file
                        <input type="file" name="immagine" oninput="chekImmagineUtente('updateImg','formImg')">
                    </label>
                    <br>
                    <br>
                    <input id="bottoneImmagine" type="submit" value="Aggiorna">
                </form>
            </div>
        <p id="userid"><%=user.getNomeUtente()%></p>
        <p id="email"><%=user.getEmail()%></p>
        <div id="impostazioniUtente">
            <!--bottoni per le azioni che può svolgere l'utente-->
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
                <form class="bottoneModifica" method="GET" action="PaginaModificaCarte">
                    <input type="submit" value="Carte di credito">
                </form>
            </div>

        </div>
    </div>
</div>

<!--pagine che vengono visualizzate al click dei bottoni-->
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

    <div id="m2" class="hiddenMenu"<%if(errorePassword!=null){%> style="display:block"<%}%>>
        <%if(errorePassword!=null){%>
        <p style="color:red"><%=errorePassword%></p>
        <%}%>
        <%@include file="CambioPassword.jsp"%>
    </div>
</div>
</body>
</html>
