package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CaricaCarrello", value = "/CaricaCarrello")
public class CaricaCarrello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento della sessione e controllo del nome utente
        HttpSession session = request.getSession();
        //se il nome utente è uguale a LOGIN il carrello si riempie dei prodotti presenti nella sessione e li passa alla request
        if(session.getAttribute("nomeUtente").equals("LOGIN")){
            ArrayList<Prodotto> l = (ArrayList<Prodotto>) session.getAttribute("carrello");
            request.setAttribute("carrello", l);
            //creazione di una lista con i path principali delle immagini per ogni prodotto
            ArrayList<String> listPath = new ArrayList<>();
            int i;
            for(i=0; i<l.size();i++){
                listPath.add(ImmagineDAO.getMainImageByVideogame(l.get(i).getVideogioco()));
            }
            request.setAttribute("lImmagini", listPath);
        }
        else{
            //se l'utente è registrato i prodotti sono presi dal db
            ArrayList<Selezionare> l = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));
            int i;
            ArrayList<Prodotto> lProdotti = new ArrayList<>();
            for(i=0; i<l.size(); i++){
                Selezionare s = l.get(i);
                Prodotto p = ProdottoDAO.doRetriveById(s.getVideogioco(), s.getPiattaforma());
                lProdotti.add(p);
            }
            request.setAttribute("carrello", lProdotti);
            //creazione di una lista con i path principali delle immagini per ogni prodotto
            ArrayList<String> listPath = new ArrayList<>();
            for(i=0; i<lProdotti.size();i++){
                listPath.add(ImmagineDAO.getMainImageByVideogame(lProdotti.get(i).getVideogioco()));
            }
            request.setAttribute("lImmagini", listPath);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("Carrello.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

}
