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

        //ottenimento nome e piattaforma del prodotto da inserire nel carrello
        String titolo = request.getParameter("nomeGioco");
        String piattaforma = request.getParameter("nomePiattaforma");
        HttpSession session = request.getSession();
        //controllo se sei registrato
        //se l'utente non è registrato il prodotto è salvato nella sessione altrimenti è salvato nel db
        if(session.getAttribute("nomeUtente").equals("LOGIN")){
            Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
            ArrayList<Prodotto> carrello = (ArrayList<Prodotto>) session.getAttribute("carrello");
            carrello.add(p);
            session.setAttribute("carrello", carrello);
            session.setAttribute("numProdottiCarrello", carrello.size());
        }
        else{
            //se il carrello non esiste nel db se non esiste lo crea
            if(CarrelloDAO.doRetriveById(session.getAttribute("nomeUtente").toString()) == null){
                Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
                Selezionare s = new Selezionare(session.getAttribute("nomeUtente").toString(), titolo, piattaforma);
                Carrello c = new Carrello(session.getAttribute("nomeUtente").toString(), Float.parseFloat(p.getPrezzo().toString()));
                CarrelloDAO.doSave(c);
                SelezionareDAO.doSave(s);
                session.setAttribute("numProdottiCarrello", 1);
            }
            else{
                //il carrello esiste nel db allora viene solo aggiunta la tupla selezionare relativa al prodotto, aggiornamento prezzo totale carrello e num di prodotti nel carrello nella sessione
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

        //controllo numero di prodotti nel carrello e  scrittura del numero nella response siccome questa servlet è stata chiamata in modo asincrono con ajax dal bottone aggiungi al carrello in product page
        Integer n = (Integer) session.getAttribute("numProdottiCarrello");
        String numP = n.toString();
        if(n>5){
            numP = "";
        }
        response.setContentType("text/plain");
        response.getWriter().write(numP);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
