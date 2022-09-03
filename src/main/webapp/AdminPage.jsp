<%@ page import="model.*" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: utente
  Date: 28/06/2022
  Time: 21:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>GamerKing | AdminPage</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script type="text/javascript" src="javaScript/UtenteScript.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
<!--jQuery per gestire il click del tasto delle impostazioni e dell'effetto del bottone dell'aggiornamento dell'immagine di profilo-->
        $(document).ready(function(){
            $("#showM1").click(function(){
                $("#m1").toggle();
            });
        });

        $(document).ready(function(){
            $("#togglteImmagine").click(function(){
                $("#formImg").slideToggle("fast");
            });
        });
    </script>
</head>
<body>
<div id="user">
    <div id="utenteInfo">
        <%Utente u = UtenteDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente"));
            ArrayList<Recensione> lRec = (ArrayList<Recensione>) request.getAttribute("listaRec");
        %>
        <!--div per la gestione dell'aggiornamento dell'immagine di profilo-->
        <div style="width: 200px; display: inline-block">
        <%
            String path = "";
            if(u.getImmagine() == null){
                path = "css/pictures/utenteGenerico.png";
            }
            else{
                path = u.getImmagine();
            }
        %>
        <img id="utenteimage" src="<%=path%>">

        <button style="position: relative;bottom: 35px; right: 50px" id="togglteImmagine"><img src="css/pictures/matita.png"></button>
            <!--form per prendere in input la nuova immagine di profilo ed inviarla alla servlet-->
            <form action="" method="POST" id="formImg" style="display: none" enctype="multipart/form-data">
                <label id="updateImg">Carica file
                    <input type="file" name="immagine" oninput="chekImmagineUtente('updateImg','formImg')">
                </label>
                <br>
                <br>
                <input id="bottoneImmagine" type="submit" value="Aggiorna">
            </form>

    </div>
        <p id="userid"><%=u.getNomeUtente()%></p>
        <p id="email"><%=u.getEmail()%></p>
        <div id="impostazioniUtente">
            <!--bottone per l'aggiunta del gioco-->
            <a href="AggiungiGiocoPage.jsp" style="text-decoration:none">
                <div class="bottoneImpostazioni">
                    <p>Aggiungi prodotto</p>
                </div>
            </a>
            <!--bottone per portare alla pagina di aggiornamento del gioco-->
            <a href="CaricaPaginaRimozioneAggiunta" style="text-decoration: none">
                <div class="bottoneImpostazioni">
                    <p>Aggiorna prodotto</p>
                </div>
            </a>
            <!--bottone delle recensioni-->
            <div class="bottoneImpostazioni" id="showM1">
                <p>Review</p>
            </div>
            <!--bottone per visualizzare le statistiche di vendita-->
            <div class="bottoneImpostazioni">
                <form class="bottoneModifica" method="POST" action="PaginaStatisticheVendita">
                    <input type="submit" value="Statistiche giochi">
                </form>
            </div>
            <!--bottone per effettuare il logout-->
            <div class="bottoneImpostazioni">
                <form class="bottoneModifica" method="GET" action="Logout">
                    <input type="submit" value="Logout">
                </form>
            </div>
        </div>
    </div>
</div>

<!--div per la visualizzazione delle recensioni inizialmente è nascosto-->
<div id="menuUtente">
    <div id="m1" class="hiddenMenu">
        <div class="lisaRec">

            <%if(lRec!=null){
                for(int x=0;x<lRec.size();x++){
                    Recensione rec = lRec.get(x);
                    Utente utente = UtenteDAO.doRetriveByNomeUtente(rec.getNomeUtente());
            %>



            <div id="listaRecensioni" class="recensione">

                <!--dati utente che ha effettuato la recensione-->
                <div class="Utente">
                    <%
                        String immagine = "";
                        if(utente.getImmagine()!=null){
                            immagine = utente.getImmagine();
                        }
                    else
                        {
                            immagine="css/pictures/utenteGenerico.png";
                        }%>
                    <img id="utenteimage2" src="<%=immagine%>">
                    <p id="NomeUtente"><%=rec.getNomeUtente()%></p>
                    <!--visualizzazione stelle votate-->
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
                    <!--visualizzazione contenuto recensione-->
                    <p id="recensioneInserita"><%=rec.getContenuto()%></p>
                </div>
                <div id="modificaElimina">

                    <!--form per eliminare una recensione-->
                    <form class="modificaRec" method="GET" action="EliminaRecensione">
                        <input type="hidden" name="utente" value="<%=rec.getNomeUtente()%>">
                        <input type="hidden" name="videogioco" value="<%=rec.getVideogioco()%>">
                        <input type="hidden" name="piattaforma" value="<%=rec.getPiattaforma()%>">
                        <input type="submit" value="Elimina">
                    </form>
                </div>
            </div>
            <%}
            }%>
        </div>
    </div>
</div>

</body>
</html>

