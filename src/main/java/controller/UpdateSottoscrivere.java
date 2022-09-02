package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;

@WebServlet(name = "UpdateSottoscrivere", value = "/UpdateSottoscrivere")

public class UpdateSottoscrivere extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomeUtente =(String) request.getSession().getAttribute("nomeUtente");
        String numero = request.getParameter("numero");
        String citta = request.getParameter("citta");
        String cittaOG = request.getParameter("cittaIniziale");
        String via = request.getParameter("via");
        String viaOG = request.getParameter("viaIniziale");
        String cap = request.getParameter("cap");
        String capOG = request.getParameter("capIniziale");
        String numCivico = request.getParameter("numCivico");
        String numCivicoOriginale = request.getParameter("numCivicoIniziale");
        //controlliamo se l'estremo di fatturazione è già presente nel DB
        if(SottoscrivereDAO.contains(numero, citta, numCivico, cap, via, nomeUtente)){
            //costruiamo la sottoscrizione
            Sottoscrivere sottoscrivere = SottoscrivereDAO.doRetriveById(numero, citta, numCivico, cap, via, nomeUtente);
            //inoltriamo la sottoscrizione alla pagina di modifica per modifiche rapide
            request.setAttribute("sottoscrivere",sottoscrivere);
            //settiamo un messaggio di errore
            request.setAttribute("errore","Questo indirizzo è già associato a questa carta");
            //ritorniamo alla pagina delle modifiche
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModificaCarta.jsp");
            requestDispatcher.forward(request, response);
        }
        else{
            //salva la nuovo modifica, id DB aggiorna automaticamente gli acquisti e le tabelle dipendenti
            Sottoscrivere s = new Sottoscrivere(numero, nomeUtente, via, cap, numCivico, citta);

            SottoscrivereDAO.doSave(s);
            //ritorno alla pagina delle carte di credito
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaModificaCarte");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}