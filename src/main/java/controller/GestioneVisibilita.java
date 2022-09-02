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

        //controllo se il prodotto è visibile se si lo nasconde
        if(visibilita.equals("nascondi")){
            ProdottoDAO.doUpdateVisibilitaById(titolo, piattaforma, false);
        }
        else{
            ProdottoDAO.doUpdateVisibilitaById(titolo, piattaforma, true);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("CaricaPaginaRimozioneAggiunta");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
