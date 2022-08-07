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
    <title>UserPage </title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>

        $(document).ready(function(){
            $("#showM1").click(function(){
                $("#m1").toggle();
            });
        });
    </script>
</head>
<body>
<div id="user">
    <div id="utenteInfo">
        <img id="utenteimage" src="css/pictures/utenteGenerico.png">
        <%Utente u = UtenteDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente"));
            ArrayList<Recensione> lRec = (ArrayList<Recensione>) request.getAttribute("listaRec");
        %>
        <p id="userid"><%=u.getNomeUtente()%></p>
        <p id="email"><%=u.getEmail()%></p>
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni">
                <p>Statistiche vendite</p>
            </div>
            <a href="AggiungiGiocoPage.jsp" style="text-decoration:none">
                <div class="bottoneImpostazioni">
                    <p>Aggiungi prodotto</p>
                </div>
            </a>
            <a href="CaricaPaginaRimozioneAggiunta" style="text-decoration: none">
                <div class="bottoneImpostazioni">
                    <p>Aggiorna prodotto</p>
                </div>
            </a>
            <div class="bottoneImpostazioni" id="showM1">
                <p>Review</p>
            </div>
            <div class="bottoneLogout">
                <form class="bottoneModifica" action="Logout">
                    <input type="submit" value="Logout">
                </form>
            </div>
        </div>
    </div>
</div>

<div id="menuUtente">
    <div id="m1" class="hiddenMenu">
        <div class="lisaRec">

            <%if(lRec!=null){
                for(int x=0;x<lRec.size();x++){
                    Recensione rec = lRec.get(x);
            %>



            <div id="listaRecensioni" class="recensione">


                <div class="Utente">
                    <img id="utenteimage2" src="css/pictures/utenteGenerico.png">
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
                <div id="modificaElimina">

                    <form class="modificaRec" action="EliminaRecensione">
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

