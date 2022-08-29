package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.UtenteDAO;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name = "AggiornaImmagineUtente", value = "/AggiornaImmagineUtente")
public class AggiornaImmagineUtente extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Part part = request.getPart("immagine");
        String fileName = part.getSubmittedFileName();
        if(fileName.equals(""))
            return;
        String path = "css/pictures/" + fileName;
        UtenteDAO.updateImmage(path, (String)session.getAttribute("nomeUtente"));
        InputStream is = part.getInputStream();
        boolean test = uploadFile(is, "C:\\Users\\Giuseppe Grano\\IdeaProjects\\Gamer_King\\src\\main\\webapp\\css\\pictures\\"+fileName);

        RequestDispatcher r = request.getRequestDispatcher("PaginaUtente");
        r.forward(request, response);

    }

    public boolean uploadFile(InputStream is, String path){
        boolean test = false;
        try{
            byte[] byt = new byte[is.available()];
            is.read(byt);

            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();

            test = true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return test;
    }

}
