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

        //ottenimento parametri dalla richiesta e sessione
        String numCarta = request.getParameter("selezioneCarta");
        HttpSession session = request.getSession();
        //creare lista di oggetti selezionare (prodotto del carrello dal db)
        ArrayList<Selezionare> list = SelezionareDAO.doRetriveAllByNomeUtente((String)session.getAttribute("nomeUtente"));
        int i;
        //ottenimento mail e passaggio della mail nella richiesta
        String mail = UtenteDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente")).getEmail();
        request.setAttribute("mail", mail);
        //controlloacquisto per verificare nella pagina di riepilogo se l'acquisto è stato effettuato o è fallito
        request.setAttribute("controlloAcquisto", "acquistato");
        //conversione lista do oggetto selezionare in lista di prodotti
        ArrayList<Prodotto> carrello = new ArrayList<>();
        for(i=0; i<list.size(); i++){
            Selezionare s = list.get(i);
            Prodotto p = ProdottoDAO.doRetriveById(s.getVideogioco(), s.getPiattaforma());
            carrello.add(p);
        }
        //verifica se alcuni prodotti non sono diponibili effettuando un controllo sul numero di copie disponibili e quelle richieste
        int j;
        boolean flag = true;
        ArrayList<Prodotto> listaProdottiNonDisp = new ArrayList<>();
        for(j=0; j<carrello.size(); j++){
            if(Integer.parseInt(request.getParameter(carrello.get(j).getVideogioco()+carrello.get(j).getPiattaforma())) > ProdottoDAO.doRetriveById(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma()).getnCopie()){
                listaProdottiNonDisp.add(carrello.get(j));
                flag = false;
            }
        }
        //se flag è true tutti i prodotti sono disponibili e si procede con l'acquisto dei prodotti
        if(flag == true){
            for(j=0; j< carrello.size(); j++){
                int g;
                //ciclo per l'acquisto del numero selezionato per ogni prodotto
                for(g=0; g<Integer.parseInt(request.getParameter(carrello.get(j).getVideogioco()+carrello.get(j).getPiattaforma())); g++){

                    ArrayList<Copia> l = CopiaDAO.doRetriveNotSellByVideogame(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma());

                    //settare il formato della data per salvarlo nel db
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");

                    String acquisto = dtf.format(LocalDateTime.now());

                    AcquistoDAO.doSave(new Acquisto(request.getParameter("selezioneCarta"), (String)session.getAttribute("nomeUtente"), l.get(0).getIdCopia(), carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma(), request.getParameter("via"+request.getParameter("selezioneCarta")), request.getParameter("cap"+request.getParameter("selezioneCarta")), request.getParameter("citta"+request.getParameter("selezioneCarta")), request.getParameter("civico"+request.getParameter("selezioneCarta")),acquisto));

                }
                //decremento numero di copie disponibili per quel prodotto dopo l'acquisto
                int numCopie = carrello.get(j).getnCopie();
                numCopie -= Integer.parseInt(request.getParameter(carrello.get(j).getVideogioco()+carrello.get(j).getPiattaforma()));
                ProdottoDAO.doUpdateNumeroCopieById(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma(), numCopie);
            }
            //rimozioni tuple da tabella selezionare per svuotare il carrello nel db
            SelezionareDAO.doRemoveByUtente((String)session.getAttribute("nomeUtente"));
            CarrelloDAO.doUpdatePrezzo((float) 0, (String)session.getAttribute("nomeUtente"));
            session.setAttribute("numProdottiCarrello", 0);
        }
        else{
            //se flag è false l'acquisto non è possibile perche ci sono alcune copie non diponibili, la lista di prodotti non disponibili viene passata nella request
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
