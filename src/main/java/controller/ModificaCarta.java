package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ModificaCarta", value = "/ModificaCarta")
public class ModificaCarta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String nomeUtente = (String) request.getSession().getAttribute("nomeUtente");
        String numero = request.getParameter("numero");
        String citta = request.getParameter("citta");
        String via = request.getParameter("via");
        String numCivico = request.getParameter("numCivico");
        String cap = request.getParameter("cap");

        Sottoscrivere sottoscrivere = SottoscrivereDAO.doRetriveById(numero, citta, numCivico, cap, via, nomeUtente);

        request.setAttribute("sottoscrivere",sottoscrivere);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ModificaCarta.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}