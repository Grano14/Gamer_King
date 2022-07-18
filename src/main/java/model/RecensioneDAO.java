package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RecensioneDAO {

    public static Recensione doRetriveById(String nomeUtente, String videogioco, String piattaforma, String pubblicazione){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente, videogioco, piattaforma, pubblicazione, contenuto, nstelle from Recensione where nomeUtente=? and videogioco=? and piattaforma=? and pubblicazione=?");
            ps.setString(1, nomeUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.setString(4, pubblicazione);
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

    public static void doRemoveById(String nomeUtente, String videogioco, String piattaforma, String pubblicazione){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Recensione where nomeUtente=? and videogioco=? and piattaforma=? and pubblicazione=?");
            ps.setString(1, nomeUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.setString(4, pubblicazione);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}