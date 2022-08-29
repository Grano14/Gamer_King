package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RegistraUtente", value = "/RegistraUtente")
public class RegistraUtente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = request.getParameter("userName");
        String mail = request.getParameter("email");
        String pass = request.getParameter("pass");
        ArrayList<Utente> l = UtenteDAO.doRetriveAll();
        for(int i=0;i<l.size();i++){
            if(l.get(i).getNomeUtente().equals(nome) || l.get(i).getEmail().equals(mail)){
                request.setAttribute("errore","Nome utente o mail già in uso");
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("RegistrationPage.jsp");
                requestDispatcher.forward(request, response);
            }
        }
        Utente u = new Utente(nome, mail, pass,false);
        UtenteDAO.doSave(u);
        int i;
        HttpSession session = request.getSession();
        ArrayList<Prodotto> list = (ArrayList<Prodotto>) session.getAttribute("carrello");
        Carrello c = new Carrello(nome, 0);
        CarrelloDAO.doSave(c);
        for(i=0; i<list.size(); i++){
            SelezionareDAO.doSave(new Selezionare(nome, list.get(i).getVideogioco(), list.get(i).getPiattaforma()));
            int n = (int) CarrelloDAO.doRetriveById(nome).getPrezzoTotale();
            n += list.get(i).getPrezzo();
            CarrelloDAO.doUpdatePrezzo((float) n, nome);
        }

        session.setAttribute("nomeUtente", nome);
        session.setAttribute("numProdottiCarrello", list.size());

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
