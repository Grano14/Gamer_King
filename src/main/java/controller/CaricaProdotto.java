package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "CaricaProdotto", value = "/CaricaProdotto")
public class CaricaProdotto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento dei parametri dalla request
        String titolo = request.getParameter("titolo");
        String piattaforma = request.getParameter("piattaforma");

        //controllo se il parametro titolo è nullo perchè la servlet CaricaProdotto può essere chiamata dalla servlet per salvare le recensioni dove il titolo è passato come attributo
        if(titolo==null){
            titolo = (String)request.getAttribute("titolo");
            piattaforma = (String)request.getAttribute("piattaforma");
        }

        //ottenimento dati del prodotto con lista di immagini relative e generi
        Videogioco v = VideogiocoDAO.doRetriveById(titolo);
        String d = v.getDescrizione();
        Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
        ArrayList lImm = ImmagineDAO.getImagesByVideogame(titolo);
        String immaginePrincipale = ImmagineDAO.getMainImageByVideogame(titolo);
        ArrayList<String> listaGeneri = AppartenereDAO.doRetriveGenereByVideogioco(titolo);
        request.setAttribute("generi", listaGeneri);
        request.setAttribute("gioco", p);
        request.setAttribute("immagini", lImm);
        request.setAttribute("immPrincipale", immaginePrincipale);
        request.setAttribute("descrizione", d);

        //ottenimento delle recensioni del prodotto
        ArrayList<Recensione> listaRec = RecensioneDAO.doRetriveByProduct(titolo, piattaforma);

        request.setAttribute("listaRec", listaRec);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProductPage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
