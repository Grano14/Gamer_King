package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecensioneDAO {

    public static Recensione doRetriveById(String nomeUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select * from Recensione where nomeUtente=? and videogioco=? and piattaforma=?");
            ps.setString(1, nomeUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Recensione r = new Recensione(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), Integer.parseInt(rs.getString(6)));
                return r;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Recensione r){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Recensione (nomeUtente, videogioco, piattaforma, pubblicazione, contenuto, nstelle) values (?,?,?,?,?,?)");
            ps.setString(1, r.getNomeUtente());
            ps.setString(2, r.getVideogioco());
            ps.setString(3, r.getPiattaforma());
            ps.setString(4, r.getPubblicazione());
            ps.setString(5, r.getContenuto());
            ps.setInt(6, r.getNstelle());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String nomeUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Recensione where nomeUtente=? and videogioco=? and piattaforma=?");
            ps.setString(1, nomeUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Recensione> doRetriveAll(){
        ArrayList<Recensione> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente, videogioco, piattaforma, pubblicazione, contenuto, nstelle from Recensione ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Recensione rec = new Recensione( rs.getString(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5), rs.getInt(6));
                l.add(rec);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Recensione> doRetriveByProduct(String videogioco, String piattaforma){
        ArrayList<Recensione> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
        PreparedStatement ps = con.prepareStatement("select * from Recensione where videogioco=? and piattaforma=? order by pubblicazione desc");
        ps.setString(1, videogioco);
        ps.setString(2, piattaforma);
        ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Recensione rec = new Recensione( rs.getString(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5), rs.getInt(6));
                l.add(rec);
            }
            return l;
        }
        catch (SQLException e){
        throw new RuntimeException(e);
    }
}

    public static ArrayList<Recensione> doRetriveByUser(String nomeUtente){
        ArrayList<Recensione> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select * from Recensione  where nomeUtente=? order by pubblicazione desc");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Recensione rec = new Recensione( rs.getString(1),rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(5), rs.getInt(6));
                l.add(rec);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


    public static boolean contains(String nomeUtente, String videogioco, String piattaforma){
       Recensione rec = RecensioneDAO.doRetriveById(nomeUtente, videogioco, piattaforma);

            if(rec != null)
                return true;
        return false;
    }

    public static void updateContent(String nomeUtente, String videogioco, String piattaforma,String contenuto, int nStelle){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update Recensione set contenuto=?, nstelle=? where nomeUtente=? and videogioco=? and piattaforma=?");
            ps.setString(1, contenuto);
            ps.setInt(2, nStelle);
            ps.setString(3, nomeUtente);
            ps.setString(4, videogioco);
            ps.setString(5, piattaforma);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
