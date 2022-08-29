package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AcquistoSingolo", value = "/AcquistoSingolo")
public class AcquistoSingolo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String numCarta = request.getParameter("selezioneCarta");
        String nomeUtente = (String)session.getAttribute("nomeUtente");
        String videogioco = request.getParameter("videogioco");
        String piattaforma = request.getParameter("piattaforma");
        String via = request.getParameter("via"+request.getParameter("selezioneCarta"));
        String cap = request.getParameter("cap"+request.getParameter("selezioneCarta"));
        String citta = request.getParameter("citta"+request.getParameter("selezioneCarta"));
        String civico = request.getParameter("civico"+request.getParameter("selezioneCarta"));
        String quantita = request.getParameter("quantita");
        //System.out.println(nomeUtente+numCarta+videogioco+piattaforma+idCopia+via+cap+citta+civico+quantita);
        String mail = UtenteDAO.doRetriveByNomeUtente((String)session.getAttribute("nomeUtente")).getEmail();
        request.setAttribute("mail", mail);
        request.setAttribute("controlloAcquisto", "acquistato");
        if(Integer.parseInt(quantita) > ProdottoDAO.doRetriveById(videogioco, piattaforma).getnCopie()){
            ArrayList<Prodotto> listaProdottiNonDisp = new ArrayList<>();
            listaProdottiNonDisp.add(ProdottoDAO.doRetriveById(videogioco, piattaforma));
            request.setAttribute("prodotti", listaProdottiNonDisp);
            request.setAttribute("controlloAcquisto", "nonAcquistato");
        }
        else{
            ArrayList<Selezionare> list = SelezionareDAO.doRetriveAllByNomeUtente(nomeUtente);
            int i;
            for(i=0; i<list.size(); i++){
                if(list.get(i).getVideogioco().equals(videogioco) && list.get(i).getPiattaforma().equals(piattaforma)){
                    SelezionareDAO.doRemoveById(nomeUtente, videogioco, piattaforma);
                    int n = (int)session.getAttribute("numProdottiCarrello");
                    session.setAttribute("numProdottiCarrello", n-1);
                }
            }
            System.out.println(quantita);
            for(int k=0; k<Integer.parseInt(quantita); k++){
                ArrayList<Copia> l = CopiaDAO.doRetriveNotSellByVideogame(videogioco, piattaforma);
                String idCopia = l.get(0).getIdCopia();
                AcquistoDAO.doSave(new Acquisto(numCarta, nomeUtente, idCopia, videogioco, piattaforma, via, cap, citta, civico));
            }
            int n = ProdottoDAO.doRetriveById(videogioco, piattaforma).getnCopie();
            ProdottoDAO.doUpdateNumeroCopieById(videogioco, piattaforma, n-Integer.parseInt(quantita));
        }

        RequestDispatcher r = request.getRequestDispatcher("RiepilogoAcquistoPage.jsp");
        r.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
