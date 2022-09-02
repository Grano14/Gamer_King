package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "index", value = "/index.jsp")
public class index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //prendere la sessione
        HttpSession session = request.getSession(false);
        //utente non loggato
        if(session == null){
            session = request.getSession();
            session.setAttribute("nomeUtente", "LOGIN");
            ArrayList<Prodotto> carrello = new ArrayList<>();
            session.setAttribute("carrello", carrello);
            session.setAttribute("numProdottiCarrello", 0);
        }
        //prodotti più venduti per la home
        ArrayList<Prodotto> lPrincipali = ProdottoDAO.doRetriveByVenduti();
        //immagini per i prodotti
        ArrayList<String> listPath = new ArrayList<>();
        int i;
        for(i=0; i<lPrincipali.size();i++){
            listPath.add(ImmagineDAO.getMainImageByVideogame(lPrincipali.get(i).getVideogioco()));
        }
        //inoltriamo i prodotti e le loro immagini alla home
        request.setAttribute("listaGiochi", lPrincipali);
        request.setAttribute("listaImmagini", listPath);
        //giochi usciti recentemente e le loro immagini per la home
        ArrayList<Prodotto> lRecenti = ProdottoDAO.doRetriveByData();
        ArrayList<String> lPathAvv = new ArrayList<>();
        for(i=0; i< lRecenti.size(); i++){
            lPathAvv.add(ImmagineDAO.getMainImageByVideogame(lRecenti.get(i).getVideogioco()));
        }
        //inoltriamo i prodotti e le loro immagini alla home
        request.setAttribute("listaGiochiRecenti", lRecenti);
        request.setAttribute("listaImmaginiRecenti", lPathAvv);
        //carichiamo la HomePage
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
