package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "EliminaProdottoCarrello", value = "/EliminaProdottoCarrello")
public class EliminaProdottoCarrello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomeUtente = request.getParameter("nomeUtente");
        String piattaforma = request.getParameter("piattaforma");
        String titolo = request.getParameter("titolo");

        if(nomeUtente.equals("LOGIN")){
            Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
            HttpSession s = request.getSession();
            ArrayList<Prodotto> l = (ArrayList<Prodotto>) s.getAttribute("carrello");
            int i;
            for(i=0; i<l.size(); i++){
                if(l.get(i).equals(p)){
                    l.remove(i);
                    int n = (int) s.getAttribute("numProdottiCarrello");
                    s.setAttribute("numProdottiCarrello", n-1);
                    break;
                }
            }
            s.setAttribute("carrello", l);
        }
        else{
            Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
            SelezionareDAO.doRemoveById(nomeUtente, titolo, piattaforma);
            HttpSession s = request.getSession();
            int n = (int) s.getAttribute("numProdottiCarrello");
            s.setAttribute("numProdottiCarrello", n-1);
            Carrello c = CarrelloDAO.doRetriveById(nomeUtente);
            CarrelloDAO.doUpdatePrezzo((float) (c.getPrezzoTotale()-p.getPrezzo()), nomeUtente);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("CaricaCarrello");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
