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

@WebServlet(name = "index", value = "/index.jsp")
public class index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null){
            session = request.getSession();
            session.setAttribute("nomeUtente", "LOGIN");
        }

        ArrayList<Videogioco> l = VideogiocoDAO.doRetriveAll();

        ArrayList<String> listPath = new ArrayList<>();
        int i;
        for(i=0; i<l.size();i++){
            listPath.add(ImmagineDAO.getMainImageByVideogame(l.get(i).getTitolo()));
        }

        request.setAttribute("listaGiochi", l);
        request.setAttribute("listaImmagini", listPath);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
