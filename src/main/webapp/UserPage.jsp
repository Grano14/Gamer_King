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
    <script type="text/javascript" src="javaScript/UtenteScript.js"></script>
    <link rel="icon" type="image/x-icon" href="css/pictures/favicon.png">
<!--Script per le animazioni di dei menù nascosti-->
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
//animazione per il menù delle immagini
        $(document).ready(function(){
            $("#togglteImmagine").click(function(){
                $("#formImg").slideToggle("fast");
            });
        });
    </script>

</head>
<body>
<!--Inserimento navBar-->
<%@include file="NavBar.jsp" %>
<!--liste per i menù nascosti-->
<% ArrayList<Recensione> lRec = (ArrayList<Recensione>) request.getAttribute("listaRec");
    ArrayList<Prodotto> l = (ArrayList<Prodotto>) request.getAttribute("listaProdotti");
    Utente user = (Utente) request.getAttribute("utente");
%>

<div id="user">
    <!--informazioni utente-->
    <div id="utenteInfo">
        <!--cambio immagine utente-->
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
            <button style="position: relative;bottom: 35px; right: 50px" id="togglteImmagine"><img src="css/pictures/matita.png"></button>
            <form action="" method="POST" id="formImg" style="display: none" enctype="multipart/form-data">
                <label id="updateImg">Carica file
                    <input type="file" name="immagine" oninput="chekImmagineUtente('updateImg','formImg')">
                </label>
                <br>
                <br>
                <input id="bottoneImmagine" type="submit" value="Aggiorna">
            </form>
        </div>
        <!--dati utente-->
        <p id="userid"><%=user.getNomeUtente()%></p>
        <p id="email"><%=user.getEmail()%></p>
        <!--sezione bottoni-->
        <div id="impostazioniUtente">
            <div class="bottoneImpostazioni" id="showM">
                <p>Libreria</p>
            </div>
            <div class="bottoneImpostazioni" id="showM1">
                <p>Review</p>
            </div>
            <!--bottone impostazioni-->
            <div class="bottoneImpostazioni">
                <form class="bottoneModifica" action="PaginaImpostazioni">
                    <input type="submit" value="Impostazioni">
                </form>
            </div>
            <!--bottone logout-->
            <div class="bottoneImpostazioni">
                <form class="bottoneModifica" method="GET" action="Logout">
                    <input type="submit" value="Logout">
                </form>
            </div>

        </div>
    </div>
</div>

<div id="menuUtente">
<!--Menù nascosti-->
    <!--libreria dei prodotti acquistati-->
    <div id="m" class="hiddenMenu">
        <%if(l!=null){
            for(int i=0; i<l.size(); i++){%>
        <div class="elemento">
            <!--link alle pagine prodotto. Disponibili solo se i prodotti sono visualizzabili-->
            <a href="CaricaProdotto?titolo=<%=l.get(i).getVideogioco()%>&piattaforma=<%=l.get(i).getPiattaforma()%>"><img src="<%=ImmagineDAO.getMainImageByVideogame(l.get(i).getVideogioco())%>"> </a>
            <p><%=l.get(i).getVideogioco()%>, <%=l.get(i).getPiattaforma()%></p>
        </div>
        <%}
        }else{%>
        <p>Nessuna acquisto effetuato</p>
        <%}%>
    </div>
    <!--recensioni lasciate dall'utente-->
    <div id="m1" class="hiddenMenu">
        <div class="lisaRec">

            <%if(lRec!=null){
                for(int x=0;x<lRec.size();x++){
                    Recensione rec = lRec.get(x);
            %>
            <div id="listaRecensioni" class="recensione">

                <div class="Utente">
                    <!--visializzazione prodotto e numero di stelle votate-->
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
                <!--visializzazione contenuto recensione-->
                <div id="recensioneRegistrata">
                    <p id="recensioneInserita"><%=rec.getContenuto()%></p>
                </div>
                <div id="modificaElimina">
                    <!--bottone di modifica del contenuto-->
                    <form class="modificaRec" method="GET" action="ModificaRecensione">
                        <input type="hidden" name="azione" value="modifica">
                        <input type="hidden" name="videogioco" value="<%=rec.getVideogioco()%>">
                        <input type="hidden" name="piattaforma" value="<%=rec.getPiattaforma()%>">
                        <input type="submit" value="Modifica">
                    </form>
                    <!--bottone di eliminazione del contenuto-->
                    <form class="modificaRec" method="POST" action="ModificaRecensione">
                        <input type="hidden" name="azione" value="elimina">
                        <input type="hidden" name="videogioco" value="<%=rec.getVideogioco()%>">
                        <input type="hidden" name="piattaforma" value="<%=rec.getPiattaforma()%>">
                        <input type="submit" value="Elimina">
                    </form>
                </div>
            </div>
            <%}
            }else{%>

            <p>Nessuna recensione esistente</p>
            <%}%>
        </div>
    </div>

</div>

</body>
</html>
