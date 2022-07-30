package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CaricaProdottoCarrello", value = "/CaricaProdottoCarrello")
public class CaricaProdottoCarrello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String titolo = request.getParameter("nomeGioco");
        String piattaforma = request.getParameter("nomePiattaforma");
        HttpSession session = request.getSession();
        if(session.getAttribute("nomeUtente").equals("LOGIN")){
            Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
            ArrayList<Prodotto> carrello = (ArrayList<Prodotto>) session.getAttribute("carrello");
            carrello.add(p);
            session.setAttribute("carrello", carrello);
            session.setAttribute("numProdottiCarrello", carrello.size());
        }
        else{
            if(CarrelloDAO.doRetriveById(session.getAttribute("nomeUtente").toString()) == null){
                Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
                Selezionare s = new Selezionare(session.getAttribute("nomeUtente").toString(), titolo, piattaforma);
                Carrello c = new Carrello(session.getAttribute("nomeUtente").toString(), Float.parseFloat(p.getPrezzo().toString()));
                SelezionareDAO.doSave(s);
                CarrelloDAO.doSave(c);
                session.setAttribute("numProdottiCarrello", 1);
            }
            else{
                Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
                Selezionare s = new Selezionare(session.getAttribute("nomeUtente").toString(), titolo, piattaforma);
                SelezionareDAO.doSave(s);
                Carrello c = CarrelloDAO.doRetriveById(session.getAttribute("nomeUtente").toString());
                Float prezzo = c.getPrezzoTotale();
                prezzo += Float.parseFloat(p.getPrezzo().toString());
                CarrelloDAO.doUpdatePrezzo(prezzo, (String) session.getAttribute("nomeUtente"));
                Integer n = (Integer) session.getAttribute("numProdottiCarrello");
                session.setAttribute("numProdottiCarrello", n+1);
            }
        }

        Integer n = (Integer) session.getAttribute("numProdottiCarrello");
        response.setContentType("text/plain");
        response.getWriter().write(n.toString());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
