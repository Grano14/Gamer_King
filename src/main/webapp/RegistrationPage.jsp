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
    <script type="text/javascript" src="javaScript/RegistrationPageJS.js"></script>
</head>
<body>
<%if(request.getAttribute("errore") == null){}else{%>
<p style="color: crimson; text-align: center; font-family: 'copperplate', fantasy"><%=request.getAttribute("errore")%></p><%request.setAttribute("errore", null);}%>
<div id="registration">
    <h1 style="text-align: center;margin-bottom: 10px">GAMER-KING <img src="css/pictures/logo.png"></h1>
    <form action="RegistraUtente">
        <div class="forms">
            <label for="userName" >Nome utente</label><br>
            <input type="text" class="serch" id="userName" name="userName" onkeyup="validateID(), checkButton()"> <label for="userName" id="1" style="color: black"></label><br>
            <label for="firstName">Nome</label><br>
            <input type="text" class="serch" id="firstName" name="firstName" onkeyup="validateName('firstName', '2'), checkButton()"><label for="firstName" id="2" style="color: black"></label><br>
            <label for="lastName">Cognome</label><br>
            <input type="text" class="serch" id="lastName" name="lastName" onkeyup="validateName('lastName', '3'), checkButton()"><label for="lastName" id="3" style="color: black"></label><br>
            <label for="email">Email</label><br>
            <input type="text" class="serch" id="email" name="email" onkeyup="validateMail(), checkButton()"><label for="email" id="4" style="color: black"></label><br>
            <label for="phone">Telefono</label><br>
            <input type="text" class="serch" id="phone" name="phone" onkeyup="validateNum(), checkButton()"><label for="phone" id="5" style="color: black"></label><br>
            <label for="pass">Password</label><br>
            <input type="password" class="serch" id="pass" name="pass" onkeyup="validatePass(), checkButton()"><label for="pass" id="6" style="color: black"></label><br>
            <input type="submit" value="PROCEDI" id="bottone">
        </div>
    </form>
</div>

<p id="bbb"></p>
</body>
</html>
