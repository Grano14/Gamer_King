package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PaginaModificaCarte", value = "/PaginaModificaCarte")
public class PaginaModificaCarte extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento della lista delle carte e le sottoscrizioni e passaggio della lista alla jsp
        String nome = (String) request.getSession().getAttribute("nomeUtente");

        ArrayList<Sottoscrivere> listaCarte = SottoscrivereDAO.doRetriveByNomeUtente(nome);

        request.setAttribute("listaCarte",listaCarte);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("ListaModificaCartePage.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }
}
