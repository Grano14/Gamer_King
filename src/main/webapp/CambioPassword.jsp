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
</head>
<body>

<div class="corpo">
    <form>
        <label for="pass">Vecchia password</label><br>
        <input type="password" class="serch" id="pass"><br>
        <label for="passConf">Conferma nuova password</label><br>
        <input type="password" class="serch" id="passConf"><br><br>
        <input class="mod" type="submit" value="Modifica" id="bottone">
    </form>
</div>

</body>
</html>
