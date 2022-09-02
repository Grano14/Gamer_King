package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PaginaAdmin", value = "/PaginaAdmin")
public class PaginaAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //servlet per passare nella request le recensioni che saranno gestite dall'admin
        ArrayList<Recensione> listaRec = RecensioneDAO.doRetriveAll();

        request.setAttribute("listaRec", listaRec);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AdminPage.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
