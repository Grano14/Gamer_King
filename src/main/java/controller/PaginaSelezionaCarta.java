package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PaginaSelezionaCarta", value = "/PaginaSelezionaCarta")
public class PaginaSelezionaCarta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = (String) request.getSession().getAttribute("nomeUtente");
        String videogioco = request.getParameter("videogioco");
        String piattaforma = request.getParameter("piattaforma");

        if(videogioco==null||piattaforma==null){
            videogioco = (String)  request.getAttribute("videogioco");
            piattaforma = (String)  request.getAttribute("piattaforma");
        }

        String img = ImmagineDAO.getMainImageByVideogame(videogioco);

        ArrayList<Sottoscrivere> listaCarte = SottoscrivereDAO.doRetriveByNomeUtente(nome);

        request.setAttribute("listaCarte",listaCarte);
        request.setAttribute("videogioco", videogioco);
        request.setAttribute("piattaforma", piattaforma);
        request.setAttribute("immagine", img);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("SelezionaCartaPage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }
}
