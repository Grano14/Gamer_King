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
    <form id="formLogin" method="POST" action="">
        <div class="forms">
            <label for="userName" >Nome utente</label><br>
            <input type="text" class="serch" id="userName" name="userName" onkeyup="validateID(), checkButton()">
            <p id="erroreNome" class="erroreReg">Il nome utente deve avere almeno 7 caratteri di cui almeno 1 numero, lettera maiuscola e minuscola</p>
            <br>
            <label for="email">Email</label><br>
            <input type="text" class="serch" id="email" name="email" onkeyup="validateMail(), checkButton()">
            <p id="erroreMail" class="erroreReg">Mail non valida</p>
            <br>
            <label for="pass">Password</label><br>
            <input type="password" class="serch" id="pass" name="pass" onkeyup="validatePass(), checkButton()">
            <p id="errorePass" class="erroreReg">La password deve avere almeno 7 caratteri di cui almeno 1 numero, lettera maiuscola e minuscola</p>
            <br>
            <label for="confPass">Conferma password</label><br>
            <input type="password" class="serch" id="confPass" name="confPass" onkeyup="validateConfPass(), checkButton()">
            <p id="erroreConfPass" class="erroreReg">Password e conferma devono essere uguali</p>
            <br><br>
            <input type="submit" value="PROCEDI" id="bottoneReg">
        </div>
    </form>
</div>
</body>
</html>
