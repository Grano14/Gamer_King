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
@WebServlet(name = "AggiungiCopia", value = "/AggiungiCopia")
public class AggiungiCopia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //inserimento prodotto nella tabella
        String piattafprma = request.getParameter("submit");
        String data = request.getParameter("data"+piattafprma);
        String prezzo = request.getParameter("prezzo"+piattafprma);
        String nCopie = request.getParameter("nCopie"+piattafprma);
        String titolo = request.getParameter("gioco");
        ArrayList<Prodotto> l = ProdottoDAO.doRetriveAll();
        boolean flag = true;
        int k = 0;
        for(k=0; k<l.size(); k++){
            if(l.get(k).getVideogioco().equals(titolo) && l.get(k).getPiattaforma().equals(piattafprma))
                flag = false;
        }
        if(flag == true){
            Prodotto p = new Prodotto(piattafprma, data, titolo, true, true, Double.parseDouble(prezzo), Integer.parseInt(nCopie));
            ProdottoDAO.doSave(p);
        }

        //inserimento copia nella tabella
        String copia = request.getParameter("idcopia"+piattafprma);
        Copia c = new Copia(copia, titolo, piattafprma);
        CopiaDAO.doSave(c);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AggiungiGiocoPage.jsp");
        requestDispatcher.forward(request, response);

    }

}
