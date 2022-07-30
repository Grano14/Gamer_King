package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CarrelloDAO {

    public static Carrello doRetriveById(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select idUtente, prezzoTotale from Carrello where idUtente=?");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Carrello c = new Carrello(rs.getString(1), rs.getFloat(2));
                return c;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Carrello c){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Carrello (nomeUtente, prezzoTotale) values (?,?)");
            ps.setString(1, c.getNomeUtente());
            ps.setFloat(2, c.getPrezzoTotale());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveByIdutente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Carrello where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doUpdatePrezzo(Float prezzo, String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update Carrello set prezzoTotale=? where nomeUtente=?");
            ps.setFloat(1, prezzo);
            ps.setString(2, nomeUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
