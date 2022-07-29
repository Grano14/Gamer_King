package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecensioneDAO {

    public static Recensione doRetriveById(int idUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select * from Recensione where idUtente=? and videogioco=? and piattaforma=?");
            ps.setInt(1, idUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Recensione r = new Recensione(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), Integer.parseInt(rs.getString(6)));
                return r;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static Recensione doRetriveById(String nome, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select r.idUtente,r.videogioco,r.piattaforma,r.pubblicazione,r.contenuto,r.nStelle from Recensione r join Utente u on u.id=r.idUtente where nomeUtente=? and videogioco=? and piattaforma=?");
            ps.setString(1, nome);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Recensione r = new Recensione(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), Integer.parseInt(rs.getString(6)));
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
            PreparedStatement ps = con.prepareStatement("insert into Recensione (idUtente, videogioco, piattaforma, pubblicazione, contenuto, nstelle) values (?,?,?,?,?,?)");
            ps.setInt(1, r.getIdUtente());
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

    public static void doRemoveById(int idUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Recensione where idUtente=? and videogioco=? and piattaforma=?");
            ps.setInt(1, idUtente);
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
            PreparedStatement ps = con.prepareStatement("select idUtente, videogioco, piattaforma, pubblicazione, contenuto, nstelle from Recensione ");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Recensione rec = new Recensione(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4),rs.getString(5), rs.getInt(6));
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
                Recensione rec = new Recensione(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4),rs.getString(5), rs.getInt(6));
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
            PreparedStatement ps = con.prepareStatement("select * from Recensione r join Utente u on u.id=r.idUtente where u.nomeUtente=? order by r.pubblicazione desc");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Recensione rec = new Recensione(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getString(4),rs.getString(5), rs.getInt(6));
                l.add(rec);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


    public static boolean contains(int id, String videogioco, String piattaforma){
       Recensione rec = RecensioneDAO.doRetriveById(id, videogioco, piattaforma);

            if(rec != null)
                return true;
        return false;
    }

    public static boolean contains(String nome, String videogioco, String piattaforma){
        Recensione rec = RecensioneDAO.doRetriveById(nome, videogioco, piattaforma);

        if(rec != null)
            return true;
        return false;
    }

    public static void updateContent(int idUtente, String videogioco, String piattaforma,String contenuto, int nStelle){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update Recensione set contenuto=?, nstelle=? where idUtente=? and videogioco=? and piattaforma=?");
            ps.setString(1, contenuto);
            ps.setInt(2, nStelle);
            ps.setInt(3, idUtente);
            ps.setString(4, videogioco);
            ps.setString(5, piattaforma);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
