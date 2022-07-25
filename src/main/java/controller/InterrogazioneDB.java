package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "InterrogazioneDB", value = "/InterrogazioneDB")
public class InterrogazioneDB extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String titolo = request.getParameter("titolo");
        String piattaforma = request.getParameter("piattaforma");
        String type = request.getParameter("tipo");

        Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
        Videogioco v = VideogiocoDAO.doRetriveById(p.getVideogioco());
        ArrayList<String> i = ImmagineDAO.getImagesByVideogame(p.getVideogioco());
        ArrayList<String> g = AppartenereDAO.doRetriveGenereByVideogioco(p.getVideogioco());
        String generi = "";
        int k;
        for(k=0; k<g.size(); k++){
            generi += g.get(k);
        }
        String testo = "";
        if(type.equals("dati")){
            System.out.println(i.get(0));
            testo = "{\"dataUscita\":\"" + p.getDataUscita() + "\", \"prezzo\":\"" + p.getPrezzo() + "\", \"immagine1\":\"" + i.get(0) + "\", \"immagine2\":\"" + i.get(1) + "\", \"immagine3\":\"" + i.get(2) + "\", \"generi\":\"" + generi +"\"}";
        }
        else{
            testo = v.getDescrizione();
        }

        response.setContentType("text/plain");
        response.getWriter().write(testo);

    }

}
