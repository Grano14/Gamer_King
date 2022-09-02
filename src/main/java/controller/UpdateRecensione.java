package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;

@WebServlet(name = "UpdateRecensione", value = "/UpdateRecensione")

public class UpdateRecensione  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomeUtente = request.getSession().getAttribute("nomeUtente").toString();
        String videogioco = request.getParameter("videogioco");
        String piattaforma = request.getParameter("piattaforma");
        String contenuto = request.getParameter("recensione");
        int nStelle = Integer.parseInt(request.getParameter("nStelle"));
        //modifico la recensione sul DB
        RecensioneDAO.updateContent(nomeUtente, videogioco, piattaforma, contenuto, nStelle);
        //ottengo i dati per ricaricare la pagina della modifica recensione
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}