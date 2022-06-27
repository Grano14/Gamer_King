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
    <form>
        <div class="forms">
            <label for="firstName">Nome</label><br>
            <input type="text" class="serch" id="firstName"><br>
            <label for="lastName">Cognome</label><br>
            <input type="text" class="serch" id="lastName"><br>
            <label for="mail">Email</label><br>
            <input type="text" class="serch" id="mail"><br>
            <label for="phone">Telefono</label><br>
            <input type="text" class="serch" id="phone"><br><br>
            <input type="submit" id="modificaDati" value="modifica">
        </div>
    </form>
</body>
</html>
