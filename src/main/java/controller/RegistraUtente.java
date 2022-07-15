package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;

@WebServlet(name = "RegistraUtente", value = "/RegistraUtente")
public class RegistraUtente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nome = request.getParameter("userName");
        String mail = request.getParameter("email");
        String pass = request.getParameter("pass");
        Utente u = new Utente(nome, mail, pass);
        UtenteDAO.doSave(u);
        UtenteDAO.doRemoveByNomeUtente(nome);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
