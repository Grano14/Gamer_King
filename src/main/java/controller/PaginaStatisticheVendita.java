package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "PaginaStatisticheVendita", value = "/PaginaStatisticheVendita")
public class PaginaStatisticheVendita  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento lista con giochi più venduti, più votati e da rifornire e passaggio delle liste nella request
        ArrayList<Integer> listaAcquisti = new ArrayList<>();
        ArrayList<Double> listaVotiMedi = new ArrayList<>();

        ArrayList<Prodotto> listaVenduti = ProdottoDAO.doRetrivePiuAcquistati(listaAcquisti);
        ArrayList<Prodotto> listaVotati = ProdottoDAO.doRetrivePiuVotati(listaVotiMedi);
        ArrayList<Prodotto> listaDaRifornire = ProdottoDAO.doRetriveDaRifornire();

//bisogna aggiungere i prodotti
        request.setAttribute("listaAcquisti", listaAcquisti);
        request.setAttribute("listaVenduti", listaVenduti);
        request.setAttribute("listaVotiMedi", listaVotiMedi);
        request.setAttribute("listaVotati", listaVotati);
        request.setAttribute("listaDaRifornire", listaDaRifornire);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("StatisticheVendita.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        this.doGet(request,response);
    }

}
