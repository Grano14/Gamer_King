package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "CaricaProdotto", value = "/CaricaProdotto")
public class CaricaProdotto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String titolo = request.getParameter("titolo");
        Videogioco v = VideogiocoDAO.doRetriveById(titolo);
        ArrayList lImm = ImmagineDAO.getImagesByVideogame(titolo);
        String immaginePrincipale = ImmagineDAO.getMainImageByVideogame(titolo);
        request.setAttribute("gioco", v);
        request.setAttribute("immagini", lImm);
        request.setAttribute("immPrincipale", immaginePrincipale);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProductPage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }

}
