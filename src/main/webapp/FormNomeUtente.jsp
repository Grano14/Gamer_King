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
    <script type="text/javascript" src="javaScript/checkFormNomeUtente.js"></script>
</head>
<body>

<div class="corpo">
    <form class="formModifica" id="modNome" method="post" action="">
        <input type="hidden" id="hidden" value="<%=request.getSession().getAttribute("nomeUtente").toString()%>">
        <label for="userName">Nome utente</label><br>
        <input class="dati" type="text" class="serch" id="userName" name="nome" onkeyup="checkModificaNome('userName','modificaNome','erroreNome')"><br>
        <p class="errore" id="erroreNome">

        </p><br>
        <input class="mod" type="submit" id="modificaNome" value="Modifica">
    </form>
</div>

</body>
</html>
