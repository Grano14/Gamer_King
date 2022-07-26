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

import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

@MultipartConfig
@WebServlet(name = "AggiungiRecensione", value = "/AggiungiRecensione")
public class AggiungiRecensione extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String contenuto = request.getParameter("recensione");;
        String piattaforma = request.getParameter("piattaforma");
        String nomeUtente = request.getSession().getAttribute("nomeUtente").toString();
        String videogioco = request.getParameter("videogioco");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");

        String pubblicazione = dtf.format(LocalDateTime.now());

        int nStelle = Integer.parseInt(request.getParameter("nStelle"));

        Recensione rec = new Recensione(nomeUtente, videogioco, piattaforma, pubblicazione, contenuto, nStelle);
        RecensioneDAO.doSave(rec);

        request.setAttribute("titolo",videogioco);
        request.setAttribute("piattaforma",piattaforma);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("CaricaProdotto");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }
}
