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
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //ottenimento parametri dalla richiesta
        String piattaforma = request.getParameter("piattaforma");
        String data = request.getParameter("data");
        String prezzo = request.getParameter("prezzo");
        String nCopie = request.getParameter("nCopie");
        String titolo = request.getParameter("gioco");

        ArrayList<Prodotto> l = ProdottoDAO.doRetriveAll();
        boolean flag = true;
        int k = 0;
        //controllo se il prodotto è gia presente nel db
        for(k=0; k<l.size(); k++){
            if(l.get(k).getVideogioco().equals(titolo) && l.get(k).getPiattaforma().equals(piattaforma))
                flag = false;
        }
        //se flag è false allora il prodotto è già presente nel db perciò non deve essere salvato ma bisogna solo aggiungere le nuove copie
        if(flag == true){
            Prodotto p = new Prodotto(piattaforma, data, titolo, true, true, Double.parseDouble(prezzo), Integer.parseInt(nCopie));
            ProdottoDAO.doSave(p);
        }
        else{
            //aggiornamento numero di copie
            int n = Integer.parseInt(request.getParameter("nCopie"));
            int num = ProdottoDAO.doRetriveNumeroCopieById(titolo, piattaforma);
            ProdottoDAO.doUpdateNumeroCopieById(titolo, piattaforma, num+n);
        }

        //inserimento copie nella tabella
        int n = Integer.parseInt(request.getParameter("nCopie"));
        for (int t=0; t<n; t++) {
            Integer codice = 0;
            flag = false;
            //generazione id copia random se gia presente ne viene generato uno nuovo nel while
            while (flag == false) {
                flag = true;
                Double c = 0.0;
                c = Math.random() * 20000 + 20000;
                codice = c.intValue();
                ArrayList<Copia> lCopia = CopiaDAO.doRetriveAll();
                for (int p = 0; p < lCopia.size(); p++) {
                    if (lCopia.get(p).getIdCopia().equals(codice.toString())) {
                        flag = false;
                    }
                }
            }

            //salvataggio nuova copia nel db
            Copia c = new Copia(codice.toString(), titolo, piattaforma);
            CopiaDAO.doSave(c);
        }

        request.setAttribute("messaggio", "Aggiunta copia effettuata!");

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AggiungiGiocoPage.jsp");
        requestDispatcher.forward(request, response);

    }

}
