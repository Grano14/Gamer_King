package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

@WebServlet(name = "AcquistoSingolo", value = "/AcquistoSingolo")
public class AcquistoSingolo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento sessione e parametri per effettuare l'acquisto del singolo prodotto
        HttpSession session = request.getSession();
        String numCarta = request.getParameter("selezioneCarta");
        String nomeUtente = (String) session.getAttribute("nomeUtente");
        String videogioco = request.getParameter("videogioco");
        String piattaforma = request.getParameter("piattaforma");
        String via = request.getParameter("via"+numCarta);
        String cap = request.getParameter("cap"+numCarta);
        String citta = request.getParameter("citta"+numCarta);
        String civico = request.getParameter("civico"+numCarta);
        String quantita = request.getParameter("quantita");
        //System.out.println(nomeUtente+numCarta+videogioco+piattaforma+via+cap+citta+civico+quantita);
        String mail = UtenteDAO.doRetriveByNomeUtente(nomeUtente).getEmail();
        request.setAttribute("mail", mail);
        //impostare parametro della richiesta controlloAcquisto ad acquistato utile per la pagina di riepilogo
        request.setAttribute("controlloAcquisto", "acquistato");
        //controllo se il numero di copie disponibili è maggiore di quello che si intende acquistare
        if(Integer.parseInt(quantita) > ProdottoDAO.doRetriveById(videogioco, piattaforma).getnCopie()){
            ArrayList<Prodotto> listaProdottiNonDisp = new ArrayList<>();
            listaProdottiNonDisp.add(ProdottoDAO.doRetriveById(videogioco, piattaforma));
            request.setAttribute("prodotti", listaProdottiNonDisp);
            request.setAttribute("controlloAcquisto", "nonAcquistato");
        }
        else{
            //effettua acquisto
            //conversione lista di oggetti selezionare in oggetti prodotto del carrello
            ArrayList<Selezionare> list = SelezionareDAO.doRetriveAllByNomeUtente(nomeUtente);
            int i;
            //controllo se il prodotto da acquistare è già nel carrello, se è presente viene rimosso dal carrello il singolo prodotto
            for(i=0; i<list.size(); i++){
                if(list.get(i).getVideogioco().equals(videogioco) && list.get(i).getPiattaforma().equals(piattaforma)){
                    SelezionareDAO.doRemoveById(nomeUtente, videogioco, piattaforma);
                    int n = (int)session.getAttribute("numProdottiCarrello");
                    session.setAttribute("numProdottiCarrello", n-1);
                }
            }
            //System.out.println(quantita);
            //ciclo per l'acquisto delle copie nella quantità richiesta
            for(int k=0; k<Integer.parseInt(quantita); k++){
                ArrayList<Copia> l = CopiaDAO.doRetriveNotSellByVideogame(videogioco, piattaforma);
                String idCopia = l.get(0).getIdCopia();

                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");

                String data = dtf.format(LocalDateTime.now());

                AcquistoDAO.doSave(new Acquisto(numCarta, nomeUtente, idCopia, videogioco, piattaforma, via, cap, citta, civico, data));
            }
            //decremento numero di copie disponibili del prodotto appena acquistato
            int n = ProdottoDAO.doRetriveById(videogioco, piattaforma).getnCopie();
            ProdottoDAO.doUpdateNumeroCopieById(videogioco, piattaforma, (n-Integer.parseInt(quantita)));
        }

        RequestDispatcher r = request.getRequestDispatcher("RiepilogoAcquistoPage.jsp");
        r.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
