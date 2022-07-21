package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AppartenereDAO {

    public static Appartenere doRetriveById(String videogioco, String genere){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select videogioco, genere from Appartenere where videogioco=? and genere=?");
            ps.setString(1, videogioco);
            ps.setString(2, genere);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Appartenere a = new Appartenere(rs.getString(1), rs.getString(2));
                return a;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Appartenere a){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Appartenere (videogioco, genere) values (?,?)");
            ps.setString(1, a.getVideogioco());
            ps.setString(2, a.getGenere());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String videogioco, String genere){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from appartenere where videogioco=? and genere=?");
            ps.setString(1, videogioco);
            ps.setString(2, genere);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<String> doRetriveGenereByVideogioco(String videogioco){
        ArrayList<String> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select genere from appartenere where videogioco=?");
            ps.setString(1, videogioco);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                l.add(rs.getString(1));
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
