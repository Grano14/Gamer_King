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
    <script type="text/javascript" src="javaScript/AggiungiGiocoScript.js"></script>
</head>
<body>
<h1>AGGIUNGI VIDEOGIOCO</h1>
<p id="admin">Admin</p>
<form action="AggiungiGioco" method="post" enctype="multipart/form-data" >
<div id="dati">
    <div id="gioco">
        <input type="text" id="titolo" name="titolo" placeholder="Titolo del gioco"><br>
        <textarea id="descrizione" name="desc" placeholder="Inserisci una descrizione..."></textarea><br>
        <p>Seleziona generi</p>
        <input type="checkbox" value="Avventura" id="avventura" name="c1">
        <label for="avventura">Avventura</label>
        <input type="checkbox" value="Fantasy" id="fantasy" name="c2">
        <label for="fantasy">Fantasy</label>
        <input type="checkbox" value="Horror" id="horror" name="c3">
        <label for="horror">Horror</label><br>
        <input type="checkbox" value="Sci-fi" id="sci-fi" name="c4">
        <label for="sci-fi">Sci-Fi</label>
        <input type="checkbox" value="Sparatutto" id="sparatutto" name="c5">
        <label for="sparatutto">Sparatutto</label>
        <input type="checkbox" value="Picchiaduro" id="picchiaduro" name="c6">
        <label for="picchiaduro">Picchiaduro</label><br>
        <input type="checkbox" value="Sopravvivenza" id="sopravvivenza" name="c7">
        <label for="sopravvivenza">Sopravvivenza</label>
        <input type="checkbox" value="Stelth" id="stelth" name="c8">
        <label for="stelth">Stelth</label>
        <input type="checkbox" value="Rpg" id="rpg" name="c9">
        <label for="rpg">Rpg</label><br>
        <input type="checkbox" value="J-rpg" id="jrpg" name="c10">
        <label for="jrpg">J-Rpg</label>
        <input type="checkbox" value="Action" id="action" name="c11">
        <label for="action">Action</label>
        <input type="checkbox" value="Simulazione" id="simulazione" name="c12">
        <label for="simulazione">Simulazione</label><br>
        <input type="checkbox" value="Strategia" id="strategia" name="c13">
        <label for="strategia">strategia</label>
        <input type="checkbox" value="Roughlik" id="roughlik" name="c14">
        <label for="roughlik">Roughlik</label>
        <input type="checkbox" value="Open world" id="openworld" name="c15">
        <label for="openworld">Open World</label><br>
        Carica immagine 1
        <input type="file" name="immagine1" multiple>
        Carica immagine 2
        <input type="file" name="immagine2" multiple>
        Carica immagine 3
        <input type="file" name="immagine3" multiple>
        <input type="submit" value="Aggiungi gioco">
    </div>
</div>
</form>
<form action="AggiungiCopia" method="post">
<div id="piattaforma">
    <div id="pc" class="tasto">
        <p class="piattaformaname" onclick="seeInput('pc', 'pcdate')">PC</p>
        <div class="prezzo/data/copie" id="pcdate">
            <p>Seleziona gioco</p>
            <select name="giocopc">
                <%
                    int i = 0;
                    ArrayList<Videogioco> l = VideogiocoDAO.doRetriveAll();
                    for(i=0; i<l.size(); i++){
                %>
                <option value="<%=l.get(i).getTitolo()%>"><%=l.get(i).getTitolo()%></option>
                <%}%>
            </select>
            <p>Prezzo</p>
            <input type="text" name="prezzopc"><br>
            <p>Data uscita</p>
            <input type="date" name="datapc"><br>
            <p>Numero di copie</p>
            <input type="number" name="nCopiepc"><br>
            <p>Codice copia</p><br>
            <input type="text" name="idcopiapc">
            <input type="submit" value="pc" name="submit">
        </div>
    </div>
    <div id="playstation" class="tasto">
        <p class="piattaformaname" onclick="seeInput('playstation', 'playstationdate')">Playstation</p>
        <div class="prezzo/data/copie" id="playstationdate">
            <p>Seleziona gioco</p>
            <select name="giocoplaystation">
                <%
                    for(i=0; i<l.size(); i++){
                %>
                <option value="<%=l.get(i).getTitolo()%>"><%=l.get(i).getTitolo()%></option>
                <%}%>
            </select>
            <p>Prezzo</p>
            <input type="text" name="prezzoplaystation"><br>
            <p>Data uscita</p>
            <input type="date" name="dataplaystation"><br>
            <p>Numero di copie</p>
            <input type="number" name="nCopieplaystation"><br>
            <p>Codice copia</p><br>
            <input type="text" name="idcopiaplaystation">
            <input type="submit" value="playstation" name="submit">
        </div>
    </div>
    <div id="nintendo" class="tasto">
        <p class="piattaformaname" onclick="seeInput('nintendo', 'nintendodate')">Switch</p>
        <div class="prezzo/data/copie" id="nintendodate">
            <p>Seleziona gioco</p>
            <select name="gioconintendo">
                <%
                    for(i=0; i<l.size(); i++){
                %>
                <option value="<%=l.get(i).getTitolo()%>"><%=l.get(i).getTitolo()%></option>
                <%}%>
            </select>
            <p>Prezzo</p>
            <input type="text" name="prezzonintendo"><br>
            <p>Data uscita</p>
            <input type="date" name="datanintendo"><br>
            <p>Numero di copie</p>
            <input type="number" name="nCopienintendo"><br>
            <p>Codice copia</p><br>
            <input type="text" name="idcopianintendo">
            <input type="submit" value="nintendo" name="submit">
        </div>
    </div>
    <div id="xbox" class="tasto">
        <p class="piattaformaname" onclick="seeInput('xbox', 'xboxdate')">Xbox</p>
        <div class="prezzo/data/copie" id="xboxdate">
            <p>Seleziona gioco</p>
            <select name="giocoxbox">
                <%
                    for(i=0; i<l.size(); i++){
                %>
                <option value="<%=l.get(i).getTitolo()%>"><%=l.get(i).getTitolo()%></option>
                <%}%>
            </select>
            <p>Prezzo</p>
            <input type="text" name="prezzoxbox"><br>
            <p>Data uscita</p>
            <input type="date" name="dataxbox"><br>
            <p>Numero di copie</p>
            <input type="number" name="nCopiexbox"><br>
            <p>Codice copia</p><br>
            <input type="text" name="idcopiaxbox">
            <input type="submit" value="xbox" name="submit">
        </div>
    </div>
</div>
</form>
</body>
</html>
