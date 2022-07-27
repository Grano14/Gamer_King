package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.ProdottoDAO;

import java.io.IOException;

@WebServlet(name = "GestioneVisibilita", value = "/GestioneVisibilita")
public class GestioneVisibilita extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String titolo = request.getParameter("titolo");
        String piattaforma = request.getParameter("piattaforma");
        String visibilita = request.getParameter("visibilita");

        if(visibilita.equals("nascondi")){
            ProdottoDAO.doUpdateVisibilitaById(titolo, piattaforma, false);
        }
        else{
            ProdottoDAO.doUpdateVisibilitaById(titolo, piattaforma, true);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}