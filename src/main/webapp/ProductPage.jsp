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

<script type="text/javascript" src="javaScript/StelleScript.js"></script>

<%@include file="NavBar.jsp" %>

<div id="prodotto">

    <div class="immagineEAcquisto">

        <div id="setImmagini">
            <ul class="fotoProdotto">

                <%for(int i=0; i<5; i++){%>

                <li>
                    <img class="altreFoto" src="css/gameImages/The Last of Us part II/avventuragame.jpg" onclick="">
                </li>

                <%}%>

            </ul>

        </div>

        <div class="immagine2">
            <img id="secondaria" src="css/pictures/eldenRing.jpg">
        </div>

        <div class="acquisto">
            <p class="titolo">Nome Gioco</p>
            <p class="prezzo">Prezzo</p>

            <div class="bottoniAM">
            <form class="bottoneAcquisto" action="">
                <input type="hidden" name="id" value="">
                <input type="submit" value="Acquisto">
            </form>
        </div>
        <div>
            <form class="bottoneAcquisto" action="">
                <input type="hidden" name="id" value="">
                <input type="submit" value="Carrello">
            </form>
            </div>
        </div>

    </div>

</div>

<div id="descrizione">
    <p class="titolo">Descrizione</p>
    <p class="summary" id="trama">
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
    <p class="summary" id="dataUscita">
        Data Uscita
    </p>
    <p class="summary" id="generi">
        Generi
    </p>
</div>

<div>
    <form class="recensione">

        <div id="stelle">
            <script type="text/javascript">star(3);</script>
        </div>

        <textarea id="testoRecensione" name="recensione" rows="4" cols="50" placeholder="Scrivi la tua recensione..."></textarea>

        <input type="submit" value="Pubblica">
    </form>
</div>

</body>
</html>
