package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AcquistoCarrello", value = "/AcquistoCarrello")
public class AcquistoCarrello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String numCarta = request.getParameter("selezioneCarta");
        System.out.println(numCarta);
        HttpSession session = request.getSession();
        ArrayList<Selezionare> list = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));
        int i;
        ArrayList<Prodotto> carrello = new ArrayList<>();
        for(i=0; i<list.size(); i++){
            Selezionare s = list.get(i);
            Prodotto p = ProdottoDAO.doRetriveById(s.getVideogioco(), s.getPiattaforma());
            carrello.add(p);
        }
        int j;
        for(j=0; j< carrello.size(); j++){
            int g;
            for(g=0; g<Integer.parseInt(request.getParameter(carrello.get(j).getVideogioco())); g++){

                ArrayList<Copia> l = CopiaDAO.doRetriveNotSellByVideogame(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma());
                AcquistoDAO.doSave(new Acquisto(request.getParameter("selezioneCarta"), (String)session.getAttribute("nomeUtente"), l.get(0).getIdCopia(), carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma(), request.getParameter("via"+request.getParameter("selezioneCarta")), request.getParameter("cap"+request.getParameter("selezioneCarta")), request.getParameter("citta"+request.getParameter("selezioneCarta")), request.getParameter("civico"+request.getParameter("selezioneCarta"))));

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
