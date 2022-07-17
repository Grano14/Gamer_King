<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 16/06/2022
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Prodotto</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/ProductPageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>

<%@include file="NavBar.jsp" %>

<div id="prodotto">

    <div class="immagineEAcquisto">

        <div id="setImmagini">
            <ul class="fotoProdotto">

                <li>
                    <img classe="direzione" id="sopra" src="css/pictures/freccia.png">
                </li>

                <%for(int i=0; i<5; i++){%>

                <li>
                    <img class="altreFoto" src="css/pictures/avventuragame.jpg">
                </li>

                <%}%>

                <li>
                    <img classe="direzione" src="css/pictures/freccia.png">
                </li>

            </ul>

        </div>

        <div class="immagine2">
            <img id="secondaria" src="css/pictures/eldenRing.jpg">
        </div>

        <div class="acquisto">
            <p class="titolo">Nome Gioco</p>
            <p class="prezzo">Prezzo</p>
            <div class="bottoneAcquisto" onclick="">
                <p>Acquista</p>
            </div>
            <div class="bottoneAcquisto" onclick="">
                <p>Carrello</p>
            </div>
        </div>

    </div>

</div>

<div id="descrizione">
    <p class="titolo">Descrizione</p>
    <p class="summary">
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
        Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione Descrizione
    </p>
</div>

<div>
    <form class="recensione">

        <div class="voti">
            <input name="voto" type="radio" id="v1" value="1" />
            <label for="v1"></label>

            <input name="voto" type="radio" id="v2" value="2" />
            <label for="v2"></label>

            <input name="voto" type="radio" id="v3" value="3" />
            <label for="v3"></label>

            <input name="voto" type="radio" id="v4" value="4" />
            <label for="v4"></label>

            <input name="voto" type="radio" id="v5" value="5" checked />
            <label for="v5"></label>
        </div>

        <textarea id="testoRecensione" name="recensione" rows="4" cols="50">Scrivi la tua recensione...</textarea>

        <input type="submit" value="Pubblica">
    </form>
</div>

</body>
</html>
