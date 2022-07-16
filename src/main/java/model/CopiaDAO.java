package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CopiaDAO {

    public static Copia doRetriveById(String IdCopia, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select IdCopia, videogioco, piattaforma from Copia where IdCopia=? and videogioco=? and piattaforma=?");
            ps.setString(1, IdCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Copia c = new Copia(rs.getString(1), rs.getString(2), rs.getString(3));
                return c;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Copia c){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Copia (IdCopia, videogioco, piattaforma) values (?,?,?)");
            ps.setString(1, c.getIdCopia());
            ps.setString(2, c.getVideogioco());
            ps.setString(3, c.getPiattaforma());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String IdCopia, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Copia where IdCopia=? and videogioco=? and piattaforma=?");
            ps.setString(1, IdCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


}
