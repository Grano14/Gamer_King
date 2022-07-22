package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProdottoDAO {

    public static Prodotto doRetriveById(String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select piattaforma, visibilita, datauscita, disponibilita, videogioco, numeroCopie, prezzo from Prodotto where videogioco=? and piattaforma=?");
            ps.setString(1, videogioco);
            ps.setString(2, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Prodotto p = new Prodotto(rs.getString(1), rs.getString(3), rs.getString(5), rs.getBoolean(2), rs.getBoolean(4), rs.getDouble(7), rs.getInt(6));
                return p;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Prodotto p){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Prodotto (piattaforma, visibilita, dataUscita, disponibilita, videogioco, numeroCopie, prezzo) values (?,?,?,?,?,?,?)");
            ps.setString(1, p.getPiattaforma());
            ps.setBoolean(2, p.isVisibilita());
            ps.setString(3, p.getDataUscita());
            ps.setBoolean(4, p.isDisponibilita());
            ps.setString(5, p.getVideogioco());
            ps.setInt(6, p.getnCopie());
            ps.setDouble(7, p.getPrezzo());

            System.out.println(44);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Prodotto where videogioco=? and piattaforma=?");
            ps.setString(1, videogioco);
            ps.setString(2, piattaforma);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Prodotto> doRetriveAll(){
        ArrayList<Prodotto> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select piattaforma, visibilita, datauscita, disponibilita, videogioco, numeroCopie, prezzo from Prodotto");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Prodotto p = new Prodotto(rs.getString(1), rs.getString(3), rs.getString(5), rs.getBoolean(2), rs.getBoolean(4), rs.getDouble(7), rs.getInt(6));
                l.add(p);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

    public static ArrayList<Prodotto> doRetriveByData(){
        ArrayList<Prodotto> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select piattaforma, visibilita, datauscita, disponibilita, videogioco, numeroCopie, prezzo from prodotto order by dataUscita desc");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Prodotto p = new Prodotto(rs.getString(1), rs.getString(3), rs.getString(5), rs.getBoolean(2), rs.getBoolean(4), rs.getDouble(7), rs.getInt(6));
                l.add(p);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Prodotto> doRetriveByPiattaformaGenere(ArrayList<String> lPiattaforme, ArrayList<String> lGeneri){
        ArrayList<Prodotto> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select distinct p.piattaforma, p.visibilita, p.datauscita, p.disponibilita, p.videogioco, p.numeroCopie, p.prezzo from prodotto p, appartenere a\n" +
                    "where p.videogioco=a.videogioco and (a.genere=? or a.genere=? or a.genere=? or a.genere=? or a.genere=? or a.genere=? or a.genere=? or a.genere=? or a.genere=?" +
                    "or a.genere=? or a.genere=? or a.genere=? or a.genere=? or a.genere=? or a.genere=?) and (p.piattaforma=? or p.piattaforma=? or p.piattaforma=? or p.piattaforma=? or p.piattaforma=? or p.piattaforma=?)");
            int i;
            for(i=0; i<lGeneri.size(); i++){
                ps.setString(i+1, lGeneri.get(i));
            }
            for(i=16; i<=21; i++){
                ps.setString(i, lPiattaforme.get(i-16));
            }
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Prodotto p = new Prodotto(rs.getString(1), rs.getString(3), rs.getString(5), rs.getBoolean(2), rs.getBoolean(4), rs.getDouble(7), rs.getInt(6));
                l.add(p);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
