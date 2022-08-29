<%@ page import="java.util.ArrayList" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Giuseppe Grano
  Date: 23/06/2022
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>GamerKing | Pagina Utente</title>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">
    <script type="text/javascript" src="javaScript/AggiungiGiocoScript.js">
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#showM").click(function(){
                $("#m1").hide();
                $("#m").toggle();
            });
        });

        $(document).ready(function(){
            $("#showM1").click(function(){
                $("#m").hide();
                $("#m1").toggle();
            });
        });
    </script>

</head>
<body>
<%@include file="NavBar.jsp" %>

<% ArrayList<Recensione> lRec = (ArrayList<Recensione>) request.getAttribute("listaRec");
    Utente user = (Utente) request.getAttribute("utente");
%>

<div id="user">
    <div id="utenteInfo">
        <div style="width: 200px; display: inline-block">
            <%
                String nome = (String) session.getAttribute("nomeUtente");
                Utente u = UtenteDAO.doRetriveByNomeUtente(nome);
                String path = "";
                if(u.getImmagine() == null){
                    path = "css/pictures/utenteGenerico.png";
                }
                else{
                    path = u.getImmagine();
                }
            %>
            <img id="utenteimage" src="<%=path%>">
            <button style="position: relative;bottom: 35px; right: 50px" onclick="hideForm()"><img src="css/pictures/matita.png"></button>
            <script>
                function hideForm(){
                    if(document.getElementById("formImg").style.display == "none"){
                        document.getElementById("formImg").style.display = "block";
                    }
                    else{
                        document.getElementById("formImg").style.display = "none";
                    }
                }
            </script>
            <form action="AggiornaImmagineUtente" method="POST" id="formImg" style="display: none" enctype="multipart/form-data">
                <label id="updateImg">Carica file<input type="file" name="immagine" oninput="verde('updateImg')"></label>
                <input type="submit" value="Aggiorna">
            </form>
        </div>

        <p id="userid"><%=user.getNomeUtente()%></p>
        <p id="email"><%=user.getEmail()%></p>
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni" id="showM">
                <p>Libreria</p>
            </div>
            <div class="bottoneImpostazioni" id="showM1">
                <p>Review</p>
            </div>

            <div class="bottoneImpostazioni">
                <form class="bottoneModifica" action="PaginaImpostazioni">
                    <input type="submit" value="Impostazioni">
                </form>
            </div>

            <div class="bottoneImpostazioni">
                <form class="bottoneModifica" method="GET" action="Logout">
                    <input type="submit" value="Logout">
                </form>
            </div>

        </div>
    </div>
</div>

<div id="menuUtente">

    <div id="m" class="hiddenMenu">
        <%
            ArrayList<Prodotto> l = AcquistoDAO.doRetriveAllByUtente((String)session.getAttribute("nomeUtente"));
            for(int i=0; i<l.size(); i++){%>
        <div class="elemento">
            <a href="CaricaProdotto?titolo=<%=l.get(i).getVideogioco()%>&piattaforma=<%=l.get(i).getPiattaforma()%>"><img src="<%=ImmagineDAO.getMainImageByVideogame(l.get(i).getVideogioco())%>"> </a>
            <p><%=l.get(i).getVideogioco()%>, <%=l.get(i).getPiattaforma()%></p>
        </div>
        <%}%>

    </div>
    <div id="m1" class="hiddenMenu">
        <div class="lisaRec">

            <%if(lRec!=null){
                for(int x=0;x<lRec.size();x++){
                    Recensione rec = lRec.get(x);
            %>



            <div id="listaRecensioni" class="recensione">


                <div class="Utente">

                    <div id="stelleVotate">
                        <p><%=rec.getVideogioco()%> <%=rec.getPiattaforma()%></p>
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
                    <form class="modificaRec" method="GET" action="ModificaRecensione">
                        <input type="hidden" name="azione" value="modifica">
                        <input type="hidden" name="videogioco" value="<%=rec.getVideogioco()%>">
                        <input type="hidden" name="piattaforma" value="<%=rec.getPiattaforma()%>">
                        <input type="submit" value="Modifica">
                    </form>

                    <form class="modificaRec" method="POST" action="ModificaRecensione">
                        <input type="hidden" name="azione" value="elimina">
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

    <div id="m2" class="hiddenMenu">

    </div>

    </div>
</body>
</html>
