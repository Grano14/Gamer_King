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
@WebServlet(name = "AggiungiCarta", value = "/AggiungiCarta")
public class AggiungiCarta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String piattaforma = request.getParameter("piattaforma");
        String videogioco = request.getParameter("videogioco");
        String ritorno = request.getParameter("ritorno");
        String numero = request.getParameter("numero");
        String verifica = request.getParameter("verifica");
        String scadenza = request.getParameter("scadenza");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String citta = request.getParameter("citta");
        String via = request.getParameter("via");
        String numCivico = request.getParameter("numCivico");
        String cap = request.getParameter("cap");

        Carta carta = new Carta(nome, cognome, numero, via, cap, numCivico, citta, verifica, scadenza);

        CartaDAO.doSave(carta);

        String Utente = (String) request.getSession().getAttribute("nomeUtente");

        ArrayList<Carta> listaCarte = CartaDAO.doRetriveByNomeUtente(Utente);

        request.setAttribute("listaCarte",listaCarte);
        request.setAttribute("utente", listaCarte);

        request.setAttribute("videogioco", videogioco);
        request.setAttribute("piattaforma", piattaforma);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(ritorno);
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
