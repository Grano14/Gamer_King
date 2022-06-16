<%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 16/06/2022
  Time: 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accedi</title>
    <link rel="stylesheet" href="css/LoginPageStyle.css" type="text/css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>
<div id="accesso">
    <h1 style="text-align: center;margin-bottom: 10px">GAMER-KING <img src="css/pictures/logo.png"></h1>
    <form>
        <div id="forms">
            <label for="id">ID Utente</label><br>
            <input type="text" id="id"><br>
            <label for="pass">Password</label><br>
            <input type="password" id="pass">
            <input type="submit" value="ACCEDI" id="bottone">
        </div>
    </form>
</div>
<div id="footer">
    Se non sei registrato <a href="registrazione.html">crea un account</a>
</div>
</body>
</html>
