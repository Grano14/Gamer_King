<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 27/06/2022
  Time: 20:49
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
        <label for="userName">Nome utente</label><br>
        <input class="dati" type="text" class="serch" id="userName"><br>
        <label for="mail">Email</label><br>
        <input class="dati" type="text" class="serch" id="mail"><br>
        <label for="phone">Telefono</label><br>
        <input class="dati" type="text" class="serch" id="phone"><br><br>
        <input class="mod" type="submit" id="modificaDati" value="modifica">
    </form>
</div>

</body>
</html>
