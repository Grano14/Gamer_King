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
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/FormDatiStyle.css">
</head>
<body>

<div class="corpo">
    <form id="modEmai" method="post" action="UpdateEmail">
        <label for="mail">Email</label><br>
        <input class="dati" type="text" class="serch" id="mail" name="email"><br><br>
        <input class="mod" type="submit" id="modificaDati" value="Modifica">
    </form>
</div>

</body>
</html>