package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RisultatoFiltro", value = "/RisultatoFiltro")
public class RisultatoFiltro extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento elenco delle piattaforme selezionate
        String hide = "hide";
        ArrayList<String> l = new ArrayList<>();
        int i;
        for(i=0; i<6; i++){
            l.add(request.getParameter(hide+(i+1)));
        }
        //ottenimento dei generi selezionati
        ArrayList<String> lGeneri = new ArrayList<>();
        for(i=0; i<15; i++){
            if(request.getParameter("check"+(i+1)) != null)
                lGeneri.add(request.getParameter("check"+(i+1)));
            else
                lGeneri.add("");
        }

        //ottenimento risultati query
        ArrayList<Prodotto> lProdotti = ProdottoDAO.doRetriveByPiattaformaGenere(l, lGeneri);
        ArrayList<String> listPath = new ArrayList<>();
        //ottenimento immagine principale dei prodotti ottenuti in risultato
        for(i=0; i<lProdotti.size();i++){
            listPath.add(ImmagineDAO.getMainImageByVideogame(lProdotti.get(i).getVideogioco()));
        }
        request.setAttribute("listaGiochi", lProdotti);
        request.setAttribute("listaImmagini", listPath);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("RisultatiRicerca.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
