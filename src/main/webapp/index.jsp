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

<!-- contenuto homepage-->

<div id="corpo">
    <div id="primoPiano">
        <img src="css/pictures/primoPiano.png">
    </div>
    <div id="giochi">
        <p class="section">i più popolari</p><br>
        <%for(int i=0; i<6; i++){%>
        <div class="elemento">
            <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
            GAME
        </div>
        <%}%>
        <p class="section">giochi di avventura</p>
        <%for(int i=0; i<6; i++){%>
        <div class="elemento">
            <a href="#game"><img src="css/pictures/avventuragame.jpg"> </a>
            GAME
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