package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "EliminaRecensione", value = "/EliminaRecensione")
public class EliminaRecensione extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomeUtente = request.getParameter("utente");
        String videogioco = request.getParameter("videogioco");
        String piattaforma = request.getParameter("piattaforma");

        RecensioneDAO.doRemoveById(nomeUtente, videogioco, piattaforma);

        ArrayList<Recensione> listaRec = RecensioneDAO.doRetriveAll();

        request.setAttribute("listaRec", listaRec);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminPage.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}