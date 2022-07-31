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

@WebServlet(name = "UpdateNomeUtente", value = "/UpdateNomeUtente")
public class UpdateNomeUtente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String nomeUtente = session.getAttribute("nomeUtente").toString();

        Utente user = UtenteDAO.doRetriveByNomeUtente(nomeUtente);

        String nuovoNome = request.getParameter("nome");

        if(UtenteDAO.contains(nuovoNome)){
            request.setAttribute("erroreNome","Nome utente già in uso");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaImpostazioni");
            requestDispatcher.forward(request, response);
        }else{
            UtenteDAO.updateNomeUtente(user,nuovoNome);

            session.setAttribute("nomeUtente", nuovoNome);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaImpostazioni");
            requestDispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
