package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet(name = "AcquistoCarrello", value = "/AcquistoCarrello")
public class AcquistoCarrello extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String numCarta = request.getParameter("selezioneCarta");
        HttpSession session = request.getSession();
        ArrayList<Selezionare> list = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));
        int i;
        String mail = UtenteDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente")).getEmail();
        request.setAttribute("mail", mail);
        request.setAttribute("controlloAcquisto", "acquistato");
        ArrayList<Prodotto> carrello = new ArrayList<>();
        for(i=0; i<list.size(); i++){
            Selezionare s = list.get(i);
            Prodotto p = ProdottoDAO.doRetriveById(s.getVideogioco(), s.getPiattaforma());
            carrello.add(p);
        }
        int j;
        boolean flag = true;
        ArrayList<Prodotto> listaProdottiNonDisp = new ArrayList<>();
        for(j=0; j<carrello.size(); j++){
            if(Integer.parseInt(request.getParameter(carrello.get(j).getVideogioco()+carrello.get(j).getPiattaforma())) > ProdottoDAO.doRetriveById(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma()).getnCopie()){
                listaProdottiNonDisp.add(carrello.get(j));
                flag = false;
            }
        }
        if(flag == true){
            for(j=0; j< carrello.size(); j++){
                int g;
                for(g=0; g<Integer.parseInt(request.getParameter(carrello.get(j).getVideogioco()+carrello.get(j).getPiattaforma())); g++){

                    ArrayList<Copia> l = CopiaDAO.doRetriveNotSellByVideogame(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma());

                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");

                    String acquisto = dtf.format(LocalDateTime.now());

                    AcquistoDAO.doSave(new Acquisto(request.getParameter("selezioneCarta"), (String)session.getAttribute("nomeUtente"), l.get(0).getIdCopia(), carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma(), request.getParameter("via"+request.getParameter("selezioneCarta")), request.getParameter("cap"+request.getParameter("selezioneCarta")), request.getParameter("citta"+request.getParameter("selezioneCarta")), request.getParameter("civico"+request.getParameter("selezioneCarta")),acquisto));

                }
                int numCopie = carrello.get(j).getnCopie();
                numCopie -= Integer.parseInt(request.getParameter(carrello.get(j).getVideogioco()+carrello.get(j).getPiattaforma()));
                ProdottoDAO.doUpdateNumeroCopieById(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma(), numCopie);
            }
            SelezionareDAO.doRemoveByUtente((String)session.getAttribute("nomeUtente"));
            CarrelloDAO.doUpdatePrezzo((float) 0, (String)session.getAttribute("nomeUtente"));
            session.setAttribute("numProdottiCarrello", 0);
        }
        else{
            request.setAttribute("prodotti", listaProdottiNonDisp);
            request.setAttribute("controlloAcquisto", "nonAcquistato");
        }


        RequestDispatcher r = request.getRequestDispatcher("RiepilogoAcquistoPage.jsp");
        r.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
