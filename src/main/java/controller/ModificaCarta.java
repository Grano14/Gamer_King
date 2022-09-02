package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ModificaCarta", value = "/ModificaCarta")
public class ModificaCarta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String address;
        String nomeUtente = (String) request.getSession().getAttribute("nomeUtente");
        String numero = request.getParameter("numero");
        String modifica = request.getParameter("modifica");
        String citta;
        String via;
        String numCivico;
        String cap;

        //valore modifica viene impostato da funzione js ed è nullo nel caso in cui viene chiamata la servlet ma non vengono cambiati i campi da aggiornare
        if(modifica!=null){
            citta = request.getParameter("cittaIniziale");
            via = request.getParameter("viaIniziale");
            numCivico = request.getParameter("numCivicoIniziale");
            cap = request.getParameter("capIniziale");
        }
        else{
            citta = request.getParameter("citta");
            via = request.getParameter("via");
            numCivico = request.getParameter("numCivico");
            cap = request.getParameter("cap");
        }

        Sottoscrivere sottoscrivere = SottoscrivereDAO.doRetriveById(numero, citta, numCivico, cap, via, nomeUtente);

        request.setAttribute("sottoscrivere",sottoscrivere);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModificaCarta.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}