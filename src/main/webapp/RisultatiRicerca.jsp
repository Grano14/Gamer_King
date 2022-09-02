<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 22/07/2022
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>GamerKing | Risultati Ricerca</title>
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
</head>
<body>
<%@include file="NavBar.jsp"%>


<div id="corpo">
    <div id="giochi">
            <%
            ArrayList<Prodotto> l = (ArrayList<Prodotto>) request.getAttribute("listaGiochi");
            ArrayList<String> lImm = (ArrayList<String>) request.getAttribute("listaImmagini");
            if(l.size() == 0){%>
        <p class="section">La ricerca non ha prodotto risultati</p><%}else{%>
        <p class="section">Risultati ricerca:</p><br><%}%>
        <%
            for(int i=0; i<l.size(); i++){
        %>
        <div class="elemento">
            <a href="CaricaProdotto?titolo=<%=l.get(i).getVideogioco()%>&piattaforma=<%=l.get(i).getPiattaforma()%>"><img src="<%=lImm.get(i)%>"> </a>
            <%=l.get(i).getVideogioco()%> |  <%=l.get(i).getPrezzo()%>€ <%String pia = l.get(i).getPiattaforma();
            if(pia.equals("playstation5")){%><img style="margin-top: 5px" src="css/pictures/ps530.png"> <%}%>
            <%if(pia.equals("playstation4")){%><img style="margin-top: 5px" src="css/pictures/ps430.png"> <%}%>
            <%if(pia.equals("pc")){%><img style="margin-top: 5px" src="css/pictures/pc30.png"> <%}%>
            <%if(pia.equals("switch")){%><img style="margin-top: 5px" src="css/pictures/switch30.png"> <%}%>
            <%if(pia.equals("xbox1")){%><img style="margin-top: 5px" src="css/pictures/xboxone30.png"> <%}%>
            <%if(pia.equals("xboxX")){%><img style="margin-top: 5px" src="css/pictures/xboxonex30.png"> <%}%>
        </div>
        <%}%>
    </div>
</div>
</body>
</html>
