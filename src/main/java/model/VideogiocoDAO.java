package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class VideogiocoDAO {

    public static Videogioco doRetriveById(String codice){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select codice, titolo, descrizione from Videogioco where codice=?");
            ps.setString(1, codice);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Videogioco v = new Videogioco(rs.getString(1), rs.getString(2), rs.getString(3));
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
            PreparedStatement ps = con.prepareStatement("insert into Videogioco(codice, titolo, descrizione) values (?,?,?)");
            ps.setString(1, v.getCodice());
            ps.setString(2, v.getTitolo());
            ps.setString(3, v.getDescrizione());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String codice){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from videogioco where  codice=?");
            ps.setString(1, codice);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Videogioco> doRetriveAll(){
        ArrayList<Videogioco> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select codice, titolo, descrizione from videogioco");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Videogioco v = new Videogioco(rs.getString(1), rs.getString(2), rs.getString(3));
                l.add(v);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

}
