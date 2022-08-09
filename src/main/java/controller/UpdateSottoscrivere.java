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

        if(SottoscrivereDAO.contains(numero, citta, numCivico, cap, via, nomeUtente)){
            Sottoscrivere sottoscrivere = SottoscrivereDAO.doRetriveById(numero, citta, numCivico, cap, via, nomeUtente);

            request.setAttribute("sottoscrivere",sottoscrivere);
            request.setAttribute("errore","Questo indirizzo è già associato a questa carta");

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModificaCarta.jsp");
            requestDispatcher.forward(request, response);
        }
        else{
            Sottoscrivere s = new Sottoscrivere(numero, nomeUtente, via, cap, numCivico, citta);

            SottoscrivereDAO.doSave(s);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaModificaCarte");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}