<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
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
    <script type="text/javascript" src="javaScript/ProdottoScript.js"></script>
    <script type="text/javascript" src="javaScript/StelleScript.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#bottoneCarrello1").click(function(){
                $("#bottoneCarrello1").hide();
                $("#sostitutivo1").show();
            });
        });

        $(document).ready(function(){
            $("#bottoneCarrello2").click(function(){
                $("#bottoneCarrello2").hide();
                $("#sostitutivo2").show();
            });
        });
    </script>
</head>
<body>

<%@include file="NavBar.jsp" %>
<br>
<%
    String d = (String)request.getAttribute("descrizione");
    Prodotto p = (Prodotto) request.getAttribute("gioco");
    ArrayList<String> lImm = (ArrayList<String>) request.getAttribute("immagini");
    ArrayList<Recensione> lRec = (ArrayList<Recensione>) request.getAttribute("listaRec");%>
<div id="prodotto">
    <div class="immagineEAcquisto">

        <div id="setImmagini">
            <ul class="fotoProdotto">

                <%for(int i=0; i<lImm.size(); i++){%>

                <li>
                    <img class="altreFoto" id="immagine<%=i%>" src="<%=lImm.get(i)%>"
                         onclick="changeImmagine('immagine<%=i%>','secondaria')">

                </li>

                <%}%>

            </ul>

        </div>

        <div class="immagine2">
            <%String path = (String) request.getAttribute("immPrincipale");
            //System.out.println(path);%>
            <img id="secondaria" src="<%=path%>">
        </div>

        <div class="acquisto">
            <p class="titolo"><%=p.getVideogioco()%> <%=p.getPiattaforma()%></p>
            <p class="prezzo"><%String s = p.getPrezzo().toString();
                if(!(s.contains("."))){s=s+".00";}
                else{if(s.indexOf(".")==(s.length()-2)){s=s+"0";}}%><%=s%>€</p>
            <%if(p.getnCopie()>0){%>
            <div class="bottoniAM">

                <%if(!session.getAttribute("nomeUtente").equals("LOGIN")){%>

            <form class="bottoneAcquisto" action="PaginaSelezionaCarta">
                <input type="hidden" name="videogioco" value="<%=p.getVideogioco()%>">
                <input type="hidden" name="piattaforma" value="<%=p.getPiattaforma()%>">
                <input class="bottoneAC" type="submit" value="Acquisto">
            </form>
                <%}%>
        </div>
        <div>
            <%
                String nomeG = "nomeG";
                String nomeP = "nomeP";
                if(session.getAttribute("nomeUtente").equals("LOGIN")){
                    ArrayList<Prodotto> l = (ArrayList<Prodotto>) session.getAttribute("carrello");
                    if(l.contains(p)){%>
                        <div class="bottoneAcquisto">
                            <p class="giaNelCarrello">Prodotto già nel carrello</p>
                        </div>
                    <%}else{%>
            <p class="giaNelCarrello" id="sostitutivo1">Prodotto già nel carrello</p>
            <div class="bottoneAcquisto">
                <input type="hidden" id="<%=nomeG%>" name="nomeGioco" value="<%=p.getVideogioco()%>">
                <input type="hidden" id="<%=nomeP%>" name="nomePiattaforma" value="<%=p.getPiattaforma()%>">
                <button id="bottoneCarrello1" class="bottoneAC" style="font-size: 23px" onclick="addToCarrello() ">Aggiungi al carrello</button>
            </div><%}}else{
                    Selezionare selezionare = new Selezionare((String)session.getAttribute("nomeUtente"), p.getVideogioco(), p.getPiattaforma());
                    ArrayList<Selezionare> l = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));
                    if(l.contains(selezionare)){%>
                        <div class="bottoneAcquisto">
                            <p class="giaNelCarrello">Prodotto già nel carrello
                        </div>
                    <%}else{%>
            <p class="giaNelCarrello" id="sostitutivo2">Prodotto già nel carrello</p>
                        <div class="bottoneAcquisto">
                            <input type="hidden" id="nomeG" name="nomeGioco" value="<%=p.getVideogioco()%>">
                            <input type="hidden" id="nomeP" name="nomePiattaforma" value="<%=p.getPiattaforma()%>">
                            <button id="bottoneCarrello2" class="bottoneAC" style="font-size: 23px" onclick="addToCarrello()">Aggiungi al carrello</button>
                        </div>
                    <%}}%>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
            <script>
                function addToCarrello(){
                    var t = document.getElementById("nomeG").value;
                    var p = document.getElementById("nomeP").value;
                    $.ajax({
                        url: "CaricaProdottoCarrello",
                        type: 'GET',
                        data:{
                            nomeGioco: t,
                            nomePiattaforma: p
                        },
                        success: function(data){
                            document.getElementById("numeroCarrello").src = "css/pictures/cerchio" + data + ".png";
                        }
                    })
                }
            </script>
            </div>

            <%}else{%>
            <p class="importante">PRODOTTO NON DISPONIBILE</p>
            <%}%>
        </div>

    </div>

<br>
</div>

<div id="descrizione">
    <p class="titolo">Descrizione</p>
    <p class="summary" id="trama">
        <%=d%>
    </p>
    <p class="summary" id="dataUscita">
        Data Uscita <%=p.getDataUscita()%>
    </p>
    <p class="summary" id="generi">
        <%
            ArrayList<String> l = (ArrayList<String>)request.getAttribute("generi");
            for(int i=0; i<l.size(); i++){
        %>
        <%=l.get(i)%> <%if(i!=l.size()-1){%>,<%}%> <%}%>
    </p>
    <%if(p.getnCopie()>0 && p.getnCopie()<20){%>
    <p id="rimanenti" class="importante">Rimanenti: <%=p.getnCopie()%></p>
    <%}%>
</div>
<div>

    <% String utente =(String) request.getSession().getAttribute("nomeUtente");
    if(utente!="LOGIN"){
        if(!RecensioneDAO.contains(utente, p.getVideogioco(), p.getPiattaforma())){
    %>

    <hr>
    <p>Aggiungi la tua recensione</p>

    <form id="formRecensione" method="POST" class="recensione" action="">

        <div id="stelle" onclick="checkRecensione()">
            <script type="text/javascript">star(3);</script>
        </div>

        <input type="hidden" id="nStelle" name="nStelle" value="0">
        <input type="hidden" name="videogioco" value="<%=p.getVideogioco() %>">
        <input type="hidden" name="piattaforma" value="<%=p.getPiattaforma() %>">

        <textarea id="testoRecensione" name="recensione" placeholder="Scrivi la tua recensione..."
         onkeyup="validateRecensione('testoRecensione'),checkRecensione()"></textarea>

        <input id="submitRecensione" type="submit" value="Pubblica">
    </form>

    <%}
    }%>

</div>
<div class="lisaRec">

    <%if(lRec.size()>0){%>
    <hr>
    <p>Recensioni</p>
    <%
        for(int x=0;x<lRec.size();x++){
            Recensione rec = lRec.get(x);
            Utente u = UtenteDAO.doRetriveByNomeUtente(rec.getNomeUtente());
    %>



    <div id="listaRecensioni" class="<%if(x<3){%>recensioneVisibile<%}else{%>recensioneNonVisibile<%}%>">


        <div class="Utente">
            <%
                String immagine = "";
                if(u.getImmagine()!=null) {
                    immagine = u.getImmagine();
                }else {
                    immagine ="css/pictures/utenteGenerico.png";
                }%>
            <img id="utenteimage" src="<%=immagine%>">
            <p id="NomeUtente"><%=rec.getNomeUtente()%></p>

            <div id="stelleVotate">
                <%for(int j=0;j<5;j++){
                    if(j<rec.getNstelle()){%>
                <img class="stelleRec" src="css/pictures/stella1.png">
                <%} else{%>
                <img class="stelleRec" src="css/pictures/stella0.png">
                <%}%>
                <%}%>
            </div>

        </div>
        <div id="recensioneRegistrata">
            <p id="recensioneInserita"><%=rec.getContenuto()%></p>
        </div>
    </div>
    <%}
    }%>
</div>
<%if(lRec.size()>3){%>
<div id="mostraRecensioni" class="aggiunta" onclick="mostraRecensioni()">
    <p>Mostra tutto</p>
</div>

<div id="nascondiRecensioni" class="aggiunta" onclick="nascondiRecensioni()">
    <p>Nascondi</p>
</div>
<%}%>
</body>
</html>
