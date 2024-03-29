package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

@MultipartConfig
@WebServlet(name = "UpdateProdotto", value = "/UpdateProdotto")
public class UpdateProdotto extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //ottenimento dati e aggiornamento del titolo, piattaforma, data, descrizione e prezzo
        String titolo = request.getParameter("titolo");
        String piattaforma = request.getParameter("piattaforma");
        String data = request.getParameter("data");
        String prezzo = request.getParameter("prezzo");

        Prodotto p = ProdottoDAO.doRetriveById(titolo, piattaforma);
        Videogioco v = VideogiocoDAO.doRetriveById(titolo);

        String descrizione = request.getParameter("desc");

        VideogiocoDAO.doUpdateById(titolo, descrizione);
        ProdottoDAO.doUpdateById(titolo, piattaforma, data, Double.parseDouble(prezzo));

        //ottenimento lista generi
        ArrayList<String> lGeneri = new ArrayList<>();
        int j;
        for(j=0;j<15;j++){
            String n = "c" + (j+1);
            if(request.getParameter(n) == null)
                ;
            else{
                lGeneri.add(request.getParameter(n));
            }
        }

        //rimozione di tutti i generi associati ad un videogioco
        AppartenereDAO.doRemoveByVideogioco(titolo);

        //aggiunta di tutti i generi da capo
        int r;
        for(r=0; r<lGeneri.size(); r++){
            Appartenere a = new Appartenere(v.getTitolo(), lGeneri.get(r));
            AppartenereDAO.doSave(a);
        }

        //ottenimento immagine principale
        Part image = request.getPart("immagine1");
        String nomeImage = image.getSubmittedFileName();

        //controllo se non è stata passata una immagine
        if(!nomeImage.equals("")){
            //aggiunta nuova immagine  nel file e aggiunta del path nel db, eliminazione vecchia immagine
            String dirPath = "C:/Program Files/Apache Software Foundation/Tomcat 10.0/webapps/Gamer_King/css/gameImages" + titolo;
            String path = "css/gameImages/" + titolo + "/" + nomeImage;
            String pathCompleto = dirPath + "/" + nomeImage;
            String oldPath = ImmagineDAO.getMainImageByVideogame(titolo);
            String pathForDeleteFile = "C:/Program Files/Apache Software Foundation/Tomcat 10.0/webapps/Gamer_King/" + oldPath;
            ImmagineDAO.doRemoveById(oldPath);
            Immagine i = new Immagine(path, titolo, true);
            ImmagineDAO.doSave(i);
            InputStream is = image.getInputStream();
            boolean test = uploadFile(is, pathCompleto);
            File f = new File(pathForDeleteFile);
            f.delete();
        }

        //ottenimento immagini secondarie e salvataggio di queste
        ArrayList<String> lImmaginiSecondarie = ImmagineDAO.getSecondaryImagesByVideogame(titolo);

        Part image2 = request.getPart("immagine2");
        String nomeImage2 = image2.getSubmittedFileName();

        if(!nomeImage2.equals("")){
            String dirPath = "C:/Program Files/Apache Software Foundation/Tomcat 10.0/webapps/Gamer_King/css/gameImages/" + titolo;
            String path = "css/gameImages/" + titolo + "/" + nomeImage2;
            String pathCompleto = dirPath + "/" + nomeImage2;
            String pathForDeleteFile = "C:/Program Files/Apache Software Foundation/Tomcat 10.0/webapps/Gamer_King/" + lImmaginiSecondarie.get(0);
            ImmagineDAO.doRemoveById(lImmaginiSecondarie.get(0));
            Immagine i = new Immagine(path, titolo, false);
            ImmagineDAO.doSave(i);
            InputStream is = image2.getInputStream();
            boolean test = uploadFile(is, pathCompleto);
            File f = new File(pathForDeleteFile);
            f.delete();
        }

        Part image3 = request.getPart("immagine3");
        String nomeImage3 = image3.getSubmittedFileName();

        if(!nomeImage3.equals("")){
            String dirPath = "C:/Program Files/Apache Software Foundation/Tomcat 10.0/webapps/Gamer_King/css/gameImages/" + titolo;
            String path = "css/gameImages/" + titolo + "/" + nomeImage3;
            String pathCompleto = dirPath + "/" + nomeImage3;
            String pathForDeleteFile = "C:/Program Files/Apache Software Foundation/Tomcat 10.0/webapps/Gamer_King/" + lImmaginiSecondarie.get(1);
            ImmagineDAO.doRemoveById(lImmaginiSecondarie.get(1));
            Immagine i = new Immagine(path, titolo, false);
            ImmagineDAO.doSave(i);
            InputStream is = image3.getInputStream();
            boolean test = uploadFile(is, pathCompleto);
            File f = new File(pathForDeleteFile);
            f.delete();
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("CaricaPaginaRimozioneAggiunta");
        requestDispatcher.forward(request, response);

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
