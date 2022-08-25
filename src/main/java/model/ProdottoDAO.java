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

    public static ArrayList<Prodotto> doRetriveAllVisible(){
        ArrayList<Prodotto> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select piattaforma, visibilita, datauscita, disponibilita, videogioco, numeroCopie, prezzo from Prodotto where visibilita=true");
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
            PreparedStatement ps = con.prepareStatement("select piattaforma, visibilita, datauscita, disponibilita, videogioco, numeroCopie, prezzo from prodotto where visibilita=true order by dataUscita desc");
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
        String query = "";
        String queryPiattaforme=" and ( ";
        String queryGeneri=" and p.videogioco = any(  select a.videogioco from Appartenere a where ";

        try(Connection con = ConPool.getConnection()){

             for(int i=0; i<lPiattaforme.size();i++){
                 if(!lPiattaforme.get(i).equals("false"))
                     queryPiattaforme +="p.piattaforma = \""+ lPiattaforme.get(i) +"\" or ";
             }

            for(int j = 0; j <lGeneri.size(); j++){
                if(!lGeneri.get(j).equals(""))
                    queryGeneri +="a.genere = \""+ lGeneri.get(j) +"\" or ";
            }

            if(queryPiattaforme.equals(" and ( ") && queryGeneri.equals(" and p.videogioco = any(  select a.videogioco from Appartenere a where "))
                return l;
                else
                query += "select distinct p.piattaforma, p.visibilita, p.datauscita, p.disponibilita, p.videogioco," +
                        " p.numeroCopie, p.prezzo from prodotto p where p.visibilita=true";

            if(!queryPiattaforme.equals(" and ( "))
                query += queryPiattaforme.substring(0, queryPiattaforme.length()-4) + " ) ";

            if(!queryGeneri.equals(" and p.videogioco = any(  select a.videogioco from Appartenere a where "))
                query += queryGeneri.substring(0, queryGeneri.length()-4) + " ) ";

            PreparedStatement ps = con.prepareStatement(query);

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

    public static void doUpdateById(String titolo, String piattaforma, String data, Double prezzo){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update prodotto set datauscita=?, prezzo=? where videogioco=? and piattaforma=?");
            ps.setString(1, data);
            ps.setDouble(2, prezzo);
            ps.setString(3, titolo);
            ps.setString(4, piattaforma);
            ps.execute();
        }
        catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doUpdateVisibilitaById(String titolo, String piattaforma, boolean visibilita){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update prodotto set visibilita=? where videogioco=? and piattaforma=?");
            ps.setBoolean(1, visibilita);
            ps.setString(2, titolo);
            ps.setString(3, piattaforma);
            ps.execute();
        }
        catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static int doRetriveNumeroCopieById(String titolo, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select numeroCopie from prodotto where videogioco=? and piattaforma=?");
            ps.setString(1, titolo);
            ps.setString(2, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return rs.getInt(1);
            }
            return -1;
        }
        catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doUpdateNumeroCopieById(String titolo, String piattaforma, int nCopie){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update prodotto set numeroCopie=? where videogioco=? and piattaforma=?");
            ps.setString(2, titolo);
            ps.setString(3, piattaforma);
            ps.setInt(1, nCopie);
            ps.execute();
        }
        catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

}
