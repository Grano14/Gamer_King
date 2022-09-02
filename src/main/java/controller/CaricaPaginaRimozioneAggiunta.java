package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CaricaPaginaRimozioneAggiunta", value = "/CaricaPaginaRimozioneAggiunta")
public class CaricaPaginaRimozioneAggiunta extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento della lista di prodotti e passaggio dei prodotti alla pagina della rimozione e aggiornamenti dei prodotti
       ArrayList<Prodotto> l = ProdottoDAO.doRetriveAll();
       request.setAttribute("prodotti", l);
       RequestDispatcher requestDispatcher = request.getRequestDispatcher("RimuoviAggiornaProdottoPage.jsp");
       requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
}
