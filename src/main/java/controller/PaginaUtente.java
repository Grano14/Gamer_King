package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PaginaUtente", value = "/PaginaUtente")
public class PaginaUtente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = (String) request.getSession().getAttribute("nomeUtente");

        Utente user = UtenteDAO.doretriveByNomeUtente(nome);
        ArrayList<Recensione> listaRec = RecensioneDAO.doRetriveByUser(nome);
//bisogna aggiungere i prodotti
        request.setAttribute("utente", user);
        request.setAttribute("listaRec", listaRec);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("UserPage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
