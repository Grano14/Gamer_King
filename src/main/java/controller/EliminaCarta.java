package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;

@WebServlet(name = "EliminaCarta", value = "/EliminaCarta")

public class EliminaCarta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomeUtente = request.getSession().getAttribute("nomeUtente").toString();
        String numero = request.getParameter("numero");
        String citta = request.getParameter("citta");
        String via = request.getParameter("via");
        String cap = request.getParameter("cap");
        String numCivico = request.getParameter("numCivico");

        SottoscrivereDAO.doRemoveById(numero, citta, numCivico, cap, via, nomeUtente);

        if(SottoscrivereDAO.doRetriveByNumero(numero).isEmpty()){
            CartaDAO.doRemoveById(numero);
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("PaginaModificaCarte");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}