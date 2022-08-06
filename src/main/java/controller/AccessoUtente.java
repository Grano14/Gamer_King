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

@WebServlet(name = "AccessoUtente", value = "/AccessoUtente")
public class AccessoUtente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = request.getParameter("id");
        String pass = request.getParameter("pass");
        ArrayList<Utente> l = UtenteDAO.doRetriveAll();
        int i;
        String address = "loginPage.jsp";
        request.setAttribute("errore","Nome utente o password errati");
        for(i=0;i<l.size();i++){
            if(l.get(i).getNomeUtente().equals(nome) && l.get(i).getPass().equals(pass)){
                HttpSession session = request.getSession();
                session.setAttribute("nomeUtente", nome);
                ArrayList<Prodotto> listProdottiCarrello = (ArrayList<Prodotto>) session.getAttribute("carrello");
                int k;
                ArrayList<Selezionare> listaSelezionare = SelezionareDAO.doRetriveAllByNomeUtente((String) session.getAttribute("nomeUtente"));
                for(k=0; k<listProdottiCarrello.size(); k++){
                    Selezionare s = new Selezionare((String)session.getAttribute("nomeUtente"), listProdottiCarrello.get(k).getVideogioco(), listProdottiCarrello.get(k).getPiattaforma());
                    if(CarrelloDAO.doRetriveById((String)session.getAttribute("nomeUtente")) == null){
                        Carrello c = new Carrello((String)session.getAttribute("nomeUtente"), 0);
                        CarrelloDAO.doSave(c);
                    }
                    if(!listaSelezionare.contains(s)) {
                        SelezionareDAO.doSave(s);
                        Carrello c = CarrelloDAO.doRetriveById((String)session.getAttribute("nomeUtente"));
                        Float prezzo = c.getPrezzoTotale();
                        prezzo += Float.parseFloat(listProdottiCarrello.get(k).getPrezzo().toString());
                        CarrelloDAO.doUpdatePrezzo(prezzo, (String) session.getAttribute("nomeUtente"));
                    }
                }
                int n = SelezionareDAO.doRetriveAllByNomeUtente((String) session.getAttribute("nomeUtente")).size();
                session.setAttribute("numProdottiCarrello", n);

                if(l.get(i).isAdm()){
                    address = "AdminPage.jsp";
                    ArrayList<Recensione> listaRec = RecensioneDAO.doRetriveAll();

                    request.setAttribute("listaRec", listaRec);
                }
                else{
                    address = "index.jsp";
                }
            }
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(address);
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
