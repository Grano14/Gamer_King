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

        //ottenimento elenco di giochi nel db
        ArrayList<Videogioco> l = VideogiocoDAO.doRetriveAll();
        //ottenimento dei parametri dalla request
        String descrizione = request.getParameter("desc");
        String nome = request.getParameter("titolo");

        //controllo che il nome inserito non sia gia presente nel db
        Boolean flag = false;
        while (flag == false){
            flag = true;
            int i;
            for(Videogioco e:l){
                if(e.getTitolo().equals(nome))
                    flag = false;
            }
        }

        //inserimento nuovo gioco nel db
        Videogioco v = new Videogioco(nome, descrizione);
        VideogiocoDAO.doSave(v);

        //controllo dei generi selezionati ed inserimento record nella tabella appartenere(codiceGioco, genere)
        int j;
        for(j=0;j<15;j++){
            String n = "c" + (j+1);
            if(request.getParameter(n) == null)
                ;
            else{
                Appartenere a = new Appartenere(v.getTitolo(), request.getParameter(n));
                AppartenereDAO.doSave(a);
            }
        }

        //creazione cartella per le immagini del videogioco + salvataggio delle immagini nella cartella
        response.setContentType("text/html;charset=UTF-8");
        try {
            String nomeGioco = request.getParameter("titolo");
            String dirPath = "C:/Users/utente/IdeaProjects/Gamer_King/src/main/webapp/css/gameImages/" + nomeGioco;
            File f = new File(dirPath);
            f.setWritable(true);
            System.out.println(f.canWrite());
            f.mkdir();

            int i;
            for(i=0;i<3;i++){
                String name = "immagine" + (i+1);
                Part part = request.getPart(name);
                String fileName = part.getSubmittedFileName();
                if(fileName.equals(""))
                    continue;

                String path = "css/gameImages/" + nomeGioco + "/" + fileName;
                //String pathCompleto = "C:/Users/Giuseppe utente/IdeaProjects/Gamer_King/src/main/webapp/css/gameImages/" + fileName;
                String pathCompleto = dirPath + "/" + fileName;

                //inserimento immagine nella tabella immagini(path, titoloGioco)
                if(i == 0){
                    Immagine imm = new Immagine(path, nomeGioco, true);
                    ImmagineDAO.doSave(imm);
                }
                else{
                    Immagine imm = new Immagine(path, nomeGioco, false);
                    ImmagineDAO.doSave(imm);
                }

                InputStream is = part.getInputStream();
                boolean test = uploadFile(is, pathCompleto);
            }

            request.setAttribute("messaggio", "Aggiunta gioco effettuata!");
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
            request.setAttribute("messaggio", "Aggiunta gioco non effettuata!");
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("AggiungiGiocoPage.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request,response);
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
