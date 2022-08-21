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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String valore = request.getParameter("val");
        ArrayList<Prodotto> list = ProdottoDAO.doRetriveAllVisible();
        String ritorno = "[";
        if(list.size() == 0){
            ritorno = "Nessun risultato";
        }
        else{
            int i=0;
            int first = 0;
            for(i=0; i< list.size(); i++){
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
