<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Videogioco" %>
<%@ page import="model.VideogiocoDAO" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 07/07/2022
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin | Aggiungi gioco</title>
    <link rel="stylesheet" type="text/css" href="css/AggiungiGiocoStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script type="text/javascript" src="javaScript/AggiungiGiocoScript.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#mostraGioco").click(function(){
                $("#formGioco").slideToggle('slow');
            });
        });

        $(document).ready(function(){
            $("#mostraProdotto").click(function(){
                $("#formProdotto").slideToggle('slow');
            });
        });
    </script>

</head>
<body>
<h1>AGGIUNGI VIDEOGIOCO</h1>
<a href="AdminPage.jsp" style="text-decoration:none;">
    <p id="admin">Admin</p>
</a>

<%if(request.getAttribute("messaggio") != null){
    String mex = (String) request.getAttribute("messaggio");
    request.removeAttribute("messaggio");
%>
<p style="text-align: center"><%=mex%></p><%}%>

<div id="dati">

    <div id="mostraGioco" class="aggiunta" >
        <p>Aggiungi un nuovo titolo</p>
    </div>

<form id="formGioco" action="" method="post" enctype="multipart/form-data" >

    <div id="gioco" class="forms">

        <input type="text" id="titolo" name="titolo" placeholder="Titolo del gioco"
               onkeyup="validateTitle('titolo'),checkButtonGame()"><br>

        <textarea id="descrizione" name="desc" placeholder="Inserisci una descrizione..."
                  onkeyup="validateDescription('descrizione'),checkButtonGame()"></textarea><br>

        <p>Seleziona generi</p>
        <input type="checkbox" value="Avventura" id="avventura" name="c1" onclick=" checkedBox('avventura'),checkButtonGame()">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="Fantasy" id="fantasy" name="c2" onclick="checkedBox('fantasy'),checkButtonGame()">
        <label for="fantasy">Fantasy</label>
        <input type="checkbox" value="Horror" id="horror" name="c3" onclick="checkedBox('horror'),checkButtonGame()">
        <label for="horror">Horror</label><br>
        <input type="checkbox" value="Sci-fi" id="sci-fi" name="c4" onclick="checkedBox('sci-fi'),checkButtonGame()">
        <label for="sci-fi">Sci-Fi</label>
        <input type="checkbox" value="Sparatutto" id="sparatutto" name="c5" onclick="checkedBox('sparatutto'),checkButtonGame()">
        <label for="sparatutto">Sparatutto</label>
        <input type="checkbox" value="Picchiaduro" id="picchiaduro" name="c6" onclick="checkedBox('picchiaduro'),checkButtonGame()">
        <label for="picchiaduro">Picchiaduro</label><br>
        <input type="checkbox" value="Sopravvivenza" id="sopravvivenza" name="c7" onclick="checkedBox('sopravvivenza'),checkButtonGame()">
        <label for="sopravvivenza">Sopravvivenza</label>
        <input type="checkbox" value="Stelth" id="stelth" name="c8" onclick="checkedBox('stelth'),checkButtonGame()">
        <label for="stelth">Stelth</label>
        <input type="checkbox" value="Rpg" id="rpg" name="c9" onclick="checkedBox('rpg'),checkButtonGame()">
        <label for="rpg">Rpg</label><br>
        <input type="checkbox" value="J-rpg" id="jrpg" name="c10" onclick="checkedBox('jrpg'),checkButtonGame()">
        <label for="jrpg">J-Rpg</label>
        <input type="checkbox" value="Action" id="action" name="c11" onclick="checkedBox('action'),checkButtonGame()">
        <label for="action">Action</label>
        <input type="checkbox" value="Simulazione" id="simulazione" name="c12" onclick="checkedBox('simulazione'),checkButtonGame()">
        <label for="simulazione">Simulazione</label><br>
        <input type="checkbox" value="Strategia" id="strategia" name="c13" onclick="checkedBox('strategia'),checkButtonGame()">
        <label for="strategia">strategia</label>
        <input type="checkbox" value="Roughlik" id="roughlik" name="c14" onclick="checkedBox('roughlik'),checkButtonGame()">
        <label for="roughlik">Roughlik</label>
        <input type="checkbox" value="Open world" id="openworld" name="c15" onclick="checkedBox('openworld'),checkButtonGame()">
        <label for="openworld">Open World</label><br>
        <p>Carica immagine 1</p>
            <label id="labl1" class="custom-file-upload">
                <input type="file" name="immagine1" multiple oninput="verde('labl1'),checkButtonGame()" >
                Aggiungi
            </label>
            <p>Carica immagine 2</p>
            <label id="labl2" class="custom-file-upload">
                <input type="file" name="immagine2" multiple oninput="verde('labl2'),checkButtonGame()">
                Aggiungi
            </label>
            <p>Carica immagine 3</p>
            <label id="labl3" class="custom-file-upload">
                <input type="file" name="immagine3" multiple oninput="verde('labl3'),checkButtonGame()">
                Aggiungi
            </label><br><br>
        <div id="bottoneGioco">
            <input type="submit" value="Aggiungi gioco">
        </div>

    </div>

</form>

    <br>

    <div id="mostraProdotto" class="aggiunta">
        <p>Aggiungi un prodotto</p>
    </div><br>

    <div id="prodotto" class="forms">
        <form id="formProdotto" action="" method="post">
            <label for="selectGioco">Seleziona gioco</label><br>
            <select id="selectGioco" name="gioco" oninput="validateLista('selectGioco'),checkButtonProdotto()">
                <option value="none"> </option>
                <%
                    int i = 0;
                    ArrayList<Videogioco> l = VideogiocoDAO.doRetriveAll();
                    for(i=0; i<l.size(); i++){
                %>
                <option value="<%=l.get(i).getTitolo()%>"><%=l.get(i).getTitolo()%></option>
                <%}%>
            </select><br>

            <label for="selectPiattaforma">Piattaforma</label><br>
            <select id="selectPiattaforma" name="piattaforma" oninput="validateLista('selectPiattaforma'),checkButtonProdotto()">
                <option value="none"> </option>
                <option value="switch">Nintendo Switch</option>
                <option value="playstation4">Playstation 4</option>
                <option value="playstation5">Playstation 5</option>
                <option value="xbox1">Xbox One</option>
                <option value="xboxX">Xbox Series X</option>
                <option value="pc">PC</option>
            </select><br>

            <label for="prezzo">Prezzo</label><br>

            <input type="text" id="prezzo" name="prezzo" placeholder="Prezzo" onkeyup="validateNumeri('prezzo'),
            checkButtonProdotto()"><br>

            <label for="data">Prezzo</label><br>
            <input id="data" type="date" name="data" oninput="verdeData('data'),checkButtonProdotto()"><br>
            <label for="copie">Numero copie</label><br>
            <input id="copie" type="number" name="nCopie" onkeyup="validateNumeri('copie'),checkButtonProdotto()"><br>
            <input id="bottoneProdotto" type="submit" name="submit">
        </form>
    </div>


</div>
</body>
</html>
