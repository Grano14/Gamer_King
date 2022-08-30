<%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 29/08/2022
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>GamerKing | Statistiche di vendita</title>

    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/StatisticheVenditeStyle.css">

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#showM").click(function(){
                $("#m1").hide();
                $("#m2").hide();
                $("#m").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM1").click(function(){
                $("#m").hide();
                $("#m2").hide();
                $("#m1").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM2").click(function(){
                $("#m").hide();
                $("#m1").hide();
                $("#m2").toggle();
            });
        });
    </script>
</head>
<body>
<%
    ArrayList<Integer> listaAcquisti = (ArrayList<Integer>) request.getAttribute("listaAcquisti");
    ArrayList<Integer> listaVotiMedi = (ArrayList<Integer>) request.getAttribute("listaVotiMedi");

    ArrayList<Prodotto> listaVenduti = (ArrayList<Prodotto>) request.getAttribute("listaVenduti");
    ArrayList<Prodotto> listaVotati = (ArrayList<Prodotto>) request.getAttribute("listaVotati");
    ArrayList<Prodotto> listaDaRifornire = (ArrayList<Prodotto>) request.getAttribute("listaDaRifornire");
%>
<h1>STATISTICHE DI VENDITA</h1>
<form id="admin" method="POST" action="PaginaAdmin">
    <input type="submit" id="adminButton" value="Admin">
</form>
<div id="BottoniMenu">
    <div class="bottoneImpostazioni" id="showM">
        <p>Più venduti</p>
    </div>
    <div class="bottoneImpostazioni" id="showM1">
        <p>Più votati</p>
    </div>
    <div class="bottoneImpostazioni" id="showM2">
        <p>Da rifornire</p>
    </div>
</div>

<div id="menuUtente">

    <div id="m" class="hiddenMenu">
        <%
            int i;
            int j;
            for(i=0;i<listaVenduti.size();i++){
                Prodotto p = listaVenduti.get(i);
                String immagine = ImmagineDAO.getMainImageByVideogame(p.getVideogioco());
                ArrayList<String> listaGeneri = AppartenereDAO.doRetriveGenereByVideogioco(p.getVideogioco());
        %>
        <hr>
        <img class="immaginiProdotto" src="<%=immagine%>">
        <div class="testoLista">
            <p class="titolo"><%=p.getVideogioco()%>, <%=p.getPiattaforma()%></p>
            <p class="prezzoProdotto"><%String s = p.getPrezzo().toString();
                if(!(s.contains("."))){s=s+".00";}
                else{if(s.indexOf(".")==(s.length()-2)){s=s+"0";}}%><%=s%>€</p>
            <p class="numeroCopie">Copie vendute: <%=listaAcquisti.get(i)%></p>
            <p class="descrizione"><%=p.getDataUscita()%></p>
            <p class="descrizione"><%
                for(j=0; j<listaGeneri.size(); j++){
            %>
                <%=listaGeneri.get(j)%> <%if(j!=listaGeneri.size()-1){%>,<%}%> <%}%></p>
        </div>
        <%}%>
    </div>

    <div id="m1" class="hiddenMenu">
        <%
            for(i=0;i<listaVotati.size();i++){
                Prodotto p1 = listaVotati.get(i);
                String immagine1 = ImmagineDAO.getMainImageByVideogame(p1.getVideogioco());
                ArrayList<String> listaGeneri1 = AppartenereDAO.doRetriveGenereByVideogioco(p1.getVideogioco());
        %>
        <hr>
        <img class="immaginiProdotto" src="<%=immagine1%>">
        <div class="testoLista">
            <p class="titolo"><%=p1.getVideogioco()%>, <%=p1.getPiattaforma()%></p>
            <p class="prezzoProdotto"><%String s1 = p1.getPrezzo().toString();
                if(!(s1.contains("."))){s1=s1+".00";}
                else{if(s1.indexOf(".")==(s1.length()-2)){s1=s1+"0";}}%><%=s1%>€</p>
            <p class="numeroCopie">Voto medio: <%=listaVotiMedi.get(i)%></p>
            <p class="descrizione"><%=p1.getDataUscita()%></p>
            <p class="descrizione"><%
                for(j=0; j<listaGeneri1.size(); j++){
            %>
                <%=listaGeneri1.get(j)%> <%if(j!=listaGeneri1.size()-1){%>,<%}%> <%}%></p>
        </div>
        <%}%>
    </div>

    <div id="m2" class="hiddenMenu">
        <%
            for(i=0;i<listaDaRifornire.size();i++){
                Prodotto p2 = listaDaRifornire.get(i);
                if(p2.getnCopie()<30){
                String immagine2 = ImmagineDAO.getMainImageByVideogame(p2.getVideogioco());
                ArrayList<String> listaGeneri2 = AppartenereDAO.doRetriveGenereByVideogioco(p2.getVideogioco());
        %>
        <hr>
        <img class="immaginiProdotto" src="<%=immagine2%>">
        <div class="testoLista">
            <p class="titolo"><%=p2.getVideogioco()%>, <%=p2.getPiattaforma()%></p>
            <p class="prezzoProdotto"><%String s2 = p2.getPrezzo().toString();
                if(!(s2.contains("."))){s2=s2+".00";}
                else{if(s2.indexOf(".")==(s2.length()-2)){s2=s2+"0";}}%><%=s2%>€</p>
            <p class="numeroCopie">copie rimanenti: <%=p2.getnCopie()%></p>
            <p class="descrizione"><%=p2.getDataUscita()%></p>
            <p class="descrizione"><%
                for(j=0; j<listaGeneri2.size(); j++){
            %>
                <%=listaGeneri2.get(j)%> <%if(j!=listaGeneri2.size()-1){%>,<%}%> <%}%></p>
        </div>
        <%}
            }%>
    </div>

</div>

</body>
</html>
