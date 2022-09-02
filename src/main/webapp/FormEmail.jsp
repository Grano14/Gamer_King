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
    <link rel="stylesheet" type="text/css" href="css/FormDatiStyle.css">
    <script type="text/javascript" src="javaScript/checkFormMail.js"></script>
</head>
<body>

<div class="corpo">
    <form class="formModifica" id="modEmail" method="POST" action="">
        <label for="mail">Email</label><br>
        <input type="hidden" id="mailUsata" value="<%= UtenteDAO.doRetriveByNomeUtente((String)request.getSession().getAttribute("nomeUtente")).getEmail()%>">
        <input class="dati" type="text" class="serch" id="mail" name="email" onkeyup="checkModificaMail('mail','modificaMail','erroreMail')"><br><br>
        <p class="errore" id="erroreMail">

        </p><br>
        <input class="mod" type="submit" id="modificaMail" value="Modifica">
    </form>
</div>

</body>
</html>