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
    <titlee>User1</titlee>
    <link rel="stylesheet" type="text/css" href="css/HomePageStyle.css">
    <link rel="stylesheet" type="text/css" href="css/UserPageStyle.css">

    <script type="text/javascript" src="javaScript/UserPageScript.js"></script>

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

    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
</head>
<body>
<%@include file="NavBar.jsp" %>

<% ArrayList<Recensione> lRec = (ArrayList<Recensione>) request.getAttribute("listaRec");
    Utente user = (Utente) request.getAttribute("utente");
%>

<div id="user">
    <div id="utenteInfo">
        <img id="utenteimage" src="css/pictures/utenteGenerico.png">
        <p id="userid"><%=user.getNomeUtente()%></p>
        <p id="email"><%=user.getEmail()%></p>
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni" id="showM">
                <p>Libreria</p>
            </div>
            <div class="bottoneImpostazioni" id="showM1">
                <p>Review</p>
            </div>

            <div class="bottoneLogout">
                <form class="bottoneModifica" action="Impostazioni">
                    <input type="submit" value="Impostazioni">
                </form>
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

    <div id="m" class="hiddenMenu">
        <%for(int i=0; i<6; i++){%>
        <div class="elemento">
            <a href="#game"><img src="css/pictures/eldenRing.jpg"> </a>
            <p>nome gioco</p>
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
                    <form class="modificaRec" action="ModificaRecensione">
                        <input type="submit" value="Modifica">
                    </form>

                    <form class="modificaRec" action="EliminaRecensione">
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
