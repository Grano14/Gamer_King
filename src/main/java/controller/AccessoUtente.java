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

                Utente u = UtenteDAO.doRetriveByNomeUtente(nome);

                session.setAttribute("idUtente", u.getId());

                if(u.isAdm()){
                    address = "AdminPage.jsp";
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
