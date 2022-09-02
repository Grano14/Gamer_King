package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Prodotto;
import model.ProdottoDAO;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RisultatiAjax", value = "/RisultatiAjax")
public class RisultatiAjax extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento valore inserito nella barra di ricerca
        String valore = request.getParameter("val");
        //ottenimento  lista di prodotti dal db
        ArrayList<Prodotto> list = ProdottoDAO.doRetriveAllVisible();
        //creazione stringa formattata come lista di prodotti in json
        String ritorno = "[";
        if(list.size() == 0){
            ritorno = "Nessun risultato";
        }
        else{
            int i=0;
            int first = 0;
            //scorrimento elementi nella lista di prodotti
            for(i=0; i< list.size(); i++){
                //controllo se il valore inserito nella barra è presente in qualche titolo di prodotto nella lista
                if(list.get(i).getVideogioco().toLowerCase().contains(valore.toLowerCase())){
                    if(first == 0){
                        first = 1;
                    }
                    else{
                        ritorno += ",";
                    }
                    ritorno += "{\"nome\":\"" + list.get(i).getVideogioco() + "\", \"piattaforma\":\"" + list.get(i).getPiattaforma() + "\"}";
                }
            }
            //controllo se nella stringa non sono state aggiunte informazioni il valore non è presente in nessun titolo
            if(ritorno.equals("[")){
                ritorno = "Nessun risultato";
            }
            else {
                ritorno += "]";
            }
        }

        response.setContentType("text/plain");
        response.getWriter().write(ritorno);

    }
}
