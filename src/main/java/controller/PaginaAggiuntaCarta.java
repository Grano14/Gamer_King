package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Utente;
import model.UtenteDAO;

import java.io.IOException;

@WebServlet(name = "PaginaAggiuntaCarta", value = "/PaginaAggiuntaCarta")
public class PaginaAggiuntaCarta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //parametri videogioco e piattaforma utili per ritornare alla pagina del prodotto nel caso in cui l'aggiunta della carta è stata fatta per acquistare un prodotto
        String ritorno = (String) request.getParameter("ritorno");
        String videogioco = (String) request.getParameter("videogioco");
        String piattaforma = (String) request.getParameter("piattaforma");

        request.setAttribute("ritorno", ritorno);
        request.setAttribute("videogioco", videogioco);
        request.setAttribute("piattaforma", piattaforma);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AggiungiCartaPage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
