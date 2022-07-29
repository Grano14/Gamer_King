package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SelezionareDAO {

    public static Selezionare doRetriveById(String nomeUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente, videogioco, piattaforma from Selezionare where nomeUtente=? and videogioco=? and piattaforma=?");
            ps.setString(1, nomeUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Selezionare s = new Selezionare(rs.getString(1), rs.getString(2), rs.getString(3));
                return s;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Selezionare s){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Selezionare (nomeUtente, videogioco, piattaforma) values (?,?,?)");
            ps.setString(1, s.getNomeUtente());
            ps.setString(2, s.getVideogioco());
            ps.setString(3, s.getPiattaforma());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String nomeUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Selezionare where nomeUtente=? and videogioco=? and piattaforma=?");
            ps.setString(1, nomeUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Selezionare> doRetriveAllByNomeUtente(String nomeUtente){
        ArrayList<Selezionare> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente, videogioco, piattaforma from Selezionare where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Selezionare s = new Selezionare(rs.getString(1), rs.getString(2), rs.getString(3));
                l.add(s);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
