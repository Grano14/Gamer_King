package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PaginaImpostazioni", value = "/PaginaImpostazioni")
public class PaginaImpostazioni extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //la servlet riceve il nuovo nome utente aggiornatoo o un messaggio di errore da mostrare non caso in cui il nome utente scelto per 'aggiornamento è già in uso
        String nome = (String) request.getSession().getAttribute("nomeUtente");
        String erroreNome = (String) request.getAttribute("erroreNome");
        request.setAttribute("erroreNome",erroreNome);

        Utente user = UtenteDAO.doRetriveByNomeUtente(nome);

        request.setAttribute("utente", user);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ImpostazioniPage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
