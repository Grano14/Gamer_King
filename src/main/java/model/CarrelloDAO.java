package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CarrelloDAO {

    public static Carrello doRetriveById(int idUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select idUtente, prezzoTotale from Carrello where idUtente=?");
            ps.setInt(1, idUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Carrello c = new Carrello(rs.getInt(1), rs.getFloat(2));
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
            PreparedStatement ps = con.prepareStatement("insert into Carrello (idUtente, prezzoTotale) values (?,?)");
            ps.setInt(1, c.getIdUtente());
            ps.setFloat(2, c.getPrezzoTotale());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveByIdutente(int idUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Carrello where idUtente=?");
            ps.setInt(1, idUtente);
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
