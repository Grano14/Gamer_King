<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Videogioco" %>
<%@ page import="model.Prodotto" %>
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
        <p class="section">I PIÙ POPOLARI</p><br>
        <%
            ArrayList<Prodotto> l = (ArrayList<Prodotto>) request.getAttribute("listaGiochi");
            ArrayList<String> lImm = (ArrayList<String>) request.getAttribute("listaImmagini");
            for(int i=0; i<l.size(); i++){
        %>
        <div class="elemento">
            <a href="CaricaProdotto?titolo=<%=l.get(i).getVideogioco()%>&piattaforma=<%=l.get(i).getPiattaforma()%>"><img src="<%=lImm.get(i)%>"> </a>
           <%=l.get(i).getVideogioco()%> |
            <%String s = l.get(i).getPrezzo().toString();
            if(!(s.contains("."))){s=s+".00";}
            else{if(s.indexOf(".")==(s.length()-2)){s=s+"0";}}%>
            <%=s%>€
            <%String pia = l.get(i).getPiattaforma();
                if(pia.equals("playstation5")){%><img style="margin-top: 5px" src="css/pictures/ps530.png"> <%}%>
            <%if(pia.equals("playstation4")){%><img style="margin-top: 5px" src="css/pictures/ps430.png"> <%}%>
            <%if(pia.equals("pc")){%><img style="margin-top: 5px" src="css/pictures/pc30.png"> <%}%>
            <%if(pia.equals("switch")){%><img style="margin-top: 5px" src="css/pictures/switch30.png"> <%}%>
            <%if(pia.equals("xbox1")){%><img style="margin-top: 5px" src="css/pictures/xboxone30.png"> <%}%>
            <%if(pia.equals("xboxX")){%><img style="margin-top: 5px" src="css/pictures/xboxonex30.png"> <%}%>
        </div>
        <%}%>
        <p class="section">ULTIME USCITE</p>
        <%
            ArrayList<Prodotto> lRecenti = (ArrayList<Prodotto>) request.getAttribute("listaGiochiRecenti");
            ArrayList<String> lImmRecenti = (ArrayList<String>) request.getAttribute("listaImmaginiRecenti");
            for(int i=0; i<lRecenti.size(); i++){%>
        <div class="elemento">
            <a href="CaricaProdotto?titolo=<%=lRecenti.get(i).getVideogioco()%>&piattaforma=<%=lRecenti.get(i).getPiattaforma()%>"><img src="<%=lImmRecenti.get(i)%>"> </a>
            <%=lRecenti.get(i).getVideogioco()%> |  <%=lRecenti.get(i).getPrezzo()%>€ <%String pia = lRecenti.get(i).getPiattaforma();
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