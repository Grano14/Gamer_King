package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SelezionareDAO {

    public static Selezionare doRetriveById(int idUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select idUtente, videogioco, piattaforma from Recensione where idUtente=? and videogioco=? and piattaforma=?");
            ps.setInt(1, idUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Selezionare s = new Selezionare(rs.getInt(1), rs.getString(2), rs.getString(3));
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
            PreparedStatement ps = con.prepareStatement("insert into Selezionare (idUtente, videogioco, piattaforma) values (?,?,?)");
            ps.setInt(1, s.getIdUtente());
            ps.setString(2, s.getVideogioco());
            ps.setString(3, s.getPiattaforma());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Selezionare> doRetriveAllByNomeUtente(String nome){
        ArrayList<Selezionare> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select s.idUtente,s.videogioco,s.piattaforma from Selezionare s join Utente u on u.id=s.idUtente where u.nomeUtente=?");
            ps.setString(1, nome);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Selezionare s = new Selezionare(rs.getInt(1), rs.getString(2), rs.getString(3));
                l.add(s);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


    public static void doRemoveById(int idUtente, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Selezionare where idUtente=? and videogioco=? and piattaforma=?");
            ps.setInt(1, idUtente);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
