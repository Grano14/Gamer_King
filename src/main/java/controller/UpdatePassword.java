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

@WebServlet(name = "UpdatePassword", value = "/UpdatePassword")
public class UpdatePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String nomeUtente = session.getAttribute("nomeUtente").toString();

        Utente user = UtenteDAO.doRetriveByNomeUtente(nomeUtente);

        String passwordVecchia = request.getParameter("pass");

        String password = request.getParameter("newPass");

        //controllo se il nome inserito da aggiornare è già in uso
        if(!user.getPass().equals(passwordVecchia)){
            request.setAttribute("errorePassword","Password incorretta");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaImpostazioni");
            requestDispatcher.forward(request, response);
        }else{
            UtenteDAO.updatePassword(user,password);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaImpostazioni");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
