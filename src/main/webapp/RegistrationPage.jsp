<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 16/06/2022
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrazione</title>
    <link rel="stylesheet" href="css/LoginPageStyle.css" type="text/css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>
<%if(request.getAttribute("errore") == null){}else{%>
<p style="color: crimson; text-align: center; font-family: 'copperplate', fantasy"><%=request.getAttribute("errore")%></p><%request.setAttribute("errore", null);}%>
<div id="registration">
    <h1 style="text-align: center;margin-bottom: 10px">GAMER-KING <img src="css/pictures/logo.png"></h1>
    <form action="RegistraUtente">
        <div class="forms">
            <label for="userName">Nome utente</label><br>
            <input type="text" class="serch" id="userName" name="userName"><br>
            <label for="firstName">Nome</label><br>
            <input type="text" class="serch" id="firstName" name="firstName"><br>
            <label for="lastName">Cognome</label><br>
            <input type="text" class="serch" id="lastName" name="lastName"><br>
            <label for="email">Email</label><br>
            <input type="text" class="serch" id="email" name="email"><br>
            <label for="phone">Telefono</label><br>
            <input type="text" class="serch" id="phone" name="phone"><br>
            <label for="pass">Password</label><br>
            <input type="password" class="serch" id="pass" name="pass"><br><br>
            <input type="submit" value="PROCEDI" id="bottone">
        </div>
    </form>
</div>
</body>
</html>
