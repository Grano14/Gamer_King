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

        HttpSession session = request.getSession();
        session.setAttribute("nomeUtente", nome);
        session.setAttribute("numProdottiCarrello", 0);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
