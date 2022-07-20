package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ImmagineDAO {

    public static Immagine doRetriveById(String path){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select path, videogioco, principale from Immagine where path=?");
            ps.setString(1, path);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Immagine i = new Immagine(rs.getString(1), rs.getString(2), rs.getBoolean(3));
                return i;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Immagine i){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Immagine (path, videogioco,principale) values (?,?,?)");
            ps.setString(1, i.getPath());
            ps.setString(2, i.getVideogioco());
            ps.setBoolean(3, i.isPrincipale());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String path){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Immagine where pathGame=?");
            ps.setString(1, path);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
