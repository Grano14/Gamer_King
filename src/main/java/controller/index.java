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

        HttpSession session = request.getSession(false);

        if(session == null){
            session = request.getSession();
            session.setAttribute("nomeUtente", "LOGIN");
            ArrayList<Prodotto> carrello = new ArrayList<>();
            session.setAttribute("carrello", carrello);
            session.setAttribute("numProdottiCarrello", 0);
        }

        ArrayList<Prodotto> lPrincipali = ProdottoDAO.doRetriveAllVisible();

        ArrayList<String> listPath = new ArrayList<>();
        int i;
        for(i=0; i<lPrincipali.size();i++){
            listPath.add(ImmagineDAO.getMainImageByVideogame(lPrincipali.get(i).getVideogioco()));
        }

        request.setAttribute("listaGiochi", lPrincipali);
        request.setAttribute("listaImmagini", listPath);

        ArrayList<Prodotto> lAvventura = ProdottoDAO.doRetriveByData();
        ArrayList<String> lPathAvv = new ArrayList<>();
        for(i=0; i<lAvventura.size(); i++){
            lPathAvv.add(ImmagineDAO.getMainImageByVideogame(lAvventura.get(i).getVideogioco()));
        }

        request.setAttribute("listaGiochiRecenti", lAvventura);
        request.setAttribute("listaImmaginiRecenti", lPathAvv);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
