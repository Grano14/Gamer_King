package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RegistrazioneCarta", value = "/RegistrazioneCarta")
public class RegistrazioneCarta extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String numeroCarta = request.getParameter("numeroCarta");
        String verifica = request.getParameter("verifica");
        String scadenza = request.getParameter("scadenza");
        String via = request.getParameter("via");
        String numCivico = request.getParameter("numCivico");
        String citta = request.getParameter("citta");
        String cap = request.getParameter("cap");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");

        String nomeUtente;

        ArrayList<Carta> l = CartaDAO.doRetriveAll();
        int i;
        for(i=0;i<l.size();i++){
            if(l.get(i).getNumero().equals(numeroCarta) && l.get(i).getCitta().equals(citta) &&
                    l.get(i).getNumCivico().equals(numCivico) && l.get(i).getCap().equals(cap) &&
                    l.get(i).getVia().equals(via)){
                request.setAttribute("errore","Nome utente o mail già in uso");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("RegistrationPage.jsp");
                requestDispatcher.forward(request, response);
            }
        }
        Carta c = new Carta(nome, cognome, numeroCarta, via, cap, numCivico, citta, verifica, scadenza);
        CartaDAO.doSave(c);
        /*Acquirente a = new Acquirente(nome);
        AcquirenteDAO.doSave(a);

        HttpSession session = request.getSession();
        session.setAttribute("nomeUtente", nome);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
        requestDispatcher.forward(request, response);*/

}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }


}

