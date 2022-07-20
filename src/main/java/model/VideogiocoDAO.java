package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class VideogiocoDAO {

    public static Videogioco doRetriveById(String titolo){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select titolo, descrizione from Videogioco where titolo=?");
            ps.setString(1, titolo);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Videogioco v = new Videogioco(rs.getString(1), rs.getString(2));
                return v;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Videogioco v){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Videogioco(titolo, descrizione) values (?,?)");
            ps.setString(1, v.getTitolo());
            ps.setString(2, v.getDescrizione());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveByName(String titolo){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from videogioco where  titolo=?");
            ps.setString(1, titolo);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Videogioco> doRetriveAll(){
        ArrayList<Videogioco> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select titolo, descrizione from videogioco");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Videogioco v = new Videogioco(rs.getString(1), rs.getString(2));
                l.add(v);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

}
