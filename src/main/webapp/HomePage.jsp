<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Videogioco" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>GamerKing | Home</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>

<!-- creazione barra di navigazione-->
<%@include file="NavBar.jsp" %>
<!-- contenuto homepage-->

<div id="corpo">
    <div id="primoPiano">
        <img src="css/pictures/primoPiano.png">
    </div>
    <div id="giochi">
        <p class="section">I più popolari</p><br>
        <%
            ArrayList<Videogioco> l = (ArrayList<Videogioco>) request.getAttribute("listaGiochi");
            ArrayList<String> lImm = (ArrayList<String>) request.getAttribute("listaImmagini");
            for(int i=0; i<l.size(); i++){
        %>
        <div class="elemento">
            <a href="CaricaProdotto?titolo=<%=l.get(i).getTitolo()%>"><img src="<%=lImm.get(i)%>"> </a>
            <%=l.get(i).getTitolo()%>
        </div>
        <%}%>
        <p class="section">giochi di avventura</p>
        <%
            ArrayList<Videogioco> lAvv = (ArrayList<Videogioco>) request.getAttribute("listaGiochiAvv");
            ArrayList<String> lImmAvv = (ArrayList<String>) request.getAttribute("listaImmaginiAvv");
            for(int i=0; i<lAvv.size(); i++){%>
        <div class="elemento">
            <a href="CaricaProdotto"><img src="<%=lImmAvv.get(i)%>"> </a>
            <%=lAvv.get(i).getTitolo()%>
        </div>
        <%}%>
    </div>
</div>

<div id="footer">
    footer
    <a href="ProductPage.jsp">prodotto</a>
</div>
</body>
</html>