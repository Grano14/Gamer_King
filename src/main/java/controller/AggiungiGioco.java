package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.*;
import java.util.ArrayList;
import java.util.Random;

@MultipartConfig
@WebServlet(name = "AggiungiGioco", value = "/AggiungiGioco")
public class AggiungiGioco extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //creazione cartella per le immagini del videogioco + salvataggio delle immagini nella cartella
        response.setContentType("text/html;charset=UTF-8");
        try {
            String nome = request.getParameter("titolo");
            String dirPath = "C:\\Users\\Giuseppe Grano\\IdeaProjects\\Gamer_King\\src\\main\\webapp\\css\\gameImages\\" + nome;
            File f = new File(dirPath);
            f.mkdir();

            int i;
            for(i=0;i<3;i++){
                String name = "immagine" + (i+1);
                Part part = request.getPart(name);
                String fileName = part.getSubmittedFileName();

                String path = dirPath + "\\" + fileName;

                InputStream is = part.getInputStream();
                boolean test = uploadFile(is, path);
            }
            //fetch form data
            /*
            Part part = request.getPart("immagine");
            String fileName = part.getSubmittedFileName();

            String path = dirPath + "\\" + fileName;
            //String path = getServletContext().getRealPath("/"+"files"+File.separator+fileName);


            InputStream is = part.getInputStream();
            boolean test = uploadFile(is, path);
            */
        }
        catch (Exception e){
            System.out.println(e);
        }

        //salvataggio gioco nella tabella videogioco + creazione random del codice gioco
        Double c = 0.0;
        Integer codice = 0;
        ArrayList<Videogioco> l = VideogiocoDAO.doRetriveAll();
        Boolean flag = false;
        while (flag == false){
            c = Math.random()*1000;
            codice = c.intValue();
            flag = true;
            int i;
            for(i=0; i<l.size();i++){
                if(l.get(i).getCodice().equals(codice.toString()))
                    flag = false;
            }
        }

        String descrizione = request.getParameter("desc");
        String nome = request.getParameter("titolo");
        Videogioco v = new Videogioco(codice.toString(), nome, descrizione);
        VideogiocoDAO.doSave(v);

        //controllo dei generi selezionati ed inserimento record nella tabella appartenere(codiceGioco, genere)
        int j;
        for(j=0;j<15;j++){
            String n = "c" + (j+1);
            if(request.getParameter(n) == null)
                ;
            else{
                Appartenere a = new Appartenere(codice.toString(), request.getParameter(n));
                AppartenereDAO.doSave(a);
            }
        }

        //inserimento immagine nella tabella immagini(path, codiceGioco)
       // String dirPath = "C:\\Users\\Giuseppe Grano\\IdeaProjects\\Gamer_King\\src\\main\\webapp\\css\\gameImages\\" + nome;
        //Immagine imm = new Immagine(dirPath, codice.toString());
       // ImmagineDAO.doSave(imm);

        //inserimento prodotto nella tabella
        //Prodotto p = new Prodotto(request.getParameter("submit"), request.getParameter("data"), codice.toString(), true, true);
        //ProdottoDAO.doSave(p);

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
