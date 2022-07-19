package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "AggiungiCopia", value = "/AggiungiCopia")
public class AggiungiCopia extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //inserimento prodotto nella tabella
        String piattafprma = request.getParameter("submit");
        String data = request.getParameter("data"+piattafprma);
        String prezzo = request.getParameter("prezzo"+piattafprma);
        String nCopie = request.getParameter("nCopie"+piattafprma);
        String codice = request.getParameter("gioco");
        Prodotto p = new Prodotto(piattafprma, data, codice, true, true, Double.parseDouble(prezzo), Integer.parseInt(nCopie));
        ProdottoDAO.doSave(p);

        //inserimento copia nella tabella
        String copia = request.getParameter("idcopia"+piattafprma);
        Copia c = new Copia(copia, codice, piattafprma);
        CopiaDAO.doSave(c);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AggiungiGiocoPage.jsp");
        requestDispatcher.forward(request, response);

    }

}
