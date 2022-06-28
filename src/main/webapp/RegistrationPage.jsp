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
<div id="registration">
    <h1 style="text-align: center;margin-bottom: 10px">GAMER-KING <img src="css/pictures/logo.png"></h1>
    <form>
        <div class="forms">
            <label for="userName">Nome utente</label><br>
            <input type="text" class="serch" id="userName"><br>
            <label for="firstName">Nome</label><br>
            <input type="text" class="serch" id="firstName"><br>
            <label for="lastName">Cognome</label><br>
            <input type="text" class="serch" id="lastName"><br>
            <label for="email">Email</label><br>
            <input type="text" class="serch" id="email"><br>
            <label for="phone">Telefono</label><br>
            <input type="text" class="serch" id="phone"><br>
            <label for="pass">Password</label><br>
            <input type="password" class="serch" id="pass"><br><br>
            <input type="submit" value="PROCEDI" id="bottone">
        </div>
    </form>
</div>
</body>
</html>
