package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ModificaRecensione", value = "/ModificaRecensione")
public class ModificaRecensione  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomeUtente = request.getSession().getAttribute("nomeUtente").toString();
        String videogioco = request.getParameter("videogioco");
        String piattaforma = request.getParameter("piattaforma");
        String azione = request.getParameter("azione");

        if(azione.equals("modifica")){

        Prodotto prodotto = ProdottoDAO.doRetriveById(videogioco, piattaforma);
        String img = ImmagineDAO.getMainImageByVideogame(videogioco);
        Recensione rec = RecensioneDAO.doRetriveById(nomeUtente, videogioco, piattaforma);
        Videogioco v = VideogiocoDAO.doRetriveById(videogioco);

        request.setAttribute("immagine", img);
        request.setAttribute("prodotto", prodotto);
        request.setAttribute("rec", rec);
        request.setAttribute("videogioco", v);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("modificaRecensionePage.jsp");
        requestDispatcher.forward(request, response);

    }
    else{
        RecensioneDAO.doRemoveById(nomeUtente, videogioco, piattaforma);
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaUtente");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}