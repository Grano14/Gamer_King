<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 28/06/2022
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/FormDatiStyle.css">
    <script type="text/javascript" src="javaScript/checkFormPassword.js"></script>
</head>
<body>

<div class="corpo">
    <form id="passForm" method="POST" action="">
        <label for="pass">Vecchia password</label><br>
        <input type="password" class="serch" id="pass"><br>
        <label for="passConf">Nuova password</label><br>
        <input type="password" class="serch" id="newPass" onkeyup="checkModificaPass('newPass','errorePass'),checkPassButton()"><br>
        <p class="errore" id="errorePass">

        </p><br>
        <label for="passConf">Conferma nuova password</label><br>
        <input type="password" class="serch" id="passConf" onkeyup="checkEqualPass('passConf','newPass','errorePassEq'),checkPassButton()"><br>
        <p class="errore" id="errorePassEq">

        </p><br>
        <input class="mod" type="submit" value="Modifica" id="bottonePass">
    </form>
</div>

</body>
</html>
