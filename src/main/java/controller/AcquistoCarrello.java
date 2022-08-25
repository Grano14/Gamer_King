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
                ArrayList<Copia> l = CopiaDAO.doRetriveAllByVideogiocoPiattaforma(carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma());
                ArrayList<Acquisto> listaAcquisti = AcquistoDAO.doRetriveAll();
                int t;
                boolean flag = true;
                for(t=0; t<l.size(); t++){
                    int k;
                    if(listaAcquisti.size() == 0 && flag == true){
                        AcquistoDAO.doSave(new Acquisto(request.getParameter("selezioneCarta"), (String)session.getAttribute("nomeUtente"), l.get(0).getIdCopia(), carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma(), request.getParameter("via"), request.getParameter("cap"), request.getParameter("citta"), request.getParameter("civico")));
                        flag = false;
                    }
                    for(g=0; g<listaAcquisti.size(); g++){
                        if(!listaAcquisti.get(g).getIdCopia().equals(l.get(t).getIdCopia()) && flag == true){
                            AcquistoDAO.doSave(new Acquisto(request.getParameter("selezioneCarta"), (String)session.getAttribute("nomeUtente"), l.get(0).getIdCopia(), carrello.get(j).getVideogioco(), carrello.get(j).getPiattaforma(), request.getParameter("via"), request.getParameter("cap"), request.getParameter("citta"), request.getParameter("civico")));
                            flag = false;
                        }
                    }
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
