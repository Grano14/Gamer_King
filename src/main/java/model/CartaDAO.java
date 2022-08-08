package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartaDAO {

    public static Carta doRetriveById(String numero){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nome, cognome, numero, scadenza, verifica from Carta where numero=?");
            ps.setString(1, numero);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Carta c = new Carta(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getString(4));
                return c;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Carta c){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Carta (nome, cognome, numero, scadenza, verifica) values (?,?,?,?,?)");
            ps.setString(1, c.getNome());
            ps.setString(2, c.getCognome());
            ps.setString(3, c.getNumero());
            ps.setString(4, c.getScadenza());
            ps.setString(5, c.getVerifica());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String numero){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Carta where numero=? ");
            ps.setString(1, numero);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Carta> doRetriveAll(){
        ArrayList<Carta> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nome, cognome, numero, scadenza, verifica from Carta");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Carta c = new Carta(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(5), rs.getString(4));
                l.add(c);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

    public static boolean containsAny(String numero){
        Carta c = CartaDAO.doRetriveById(numero);
        if(c != null)
            return true;
        return false;
    }

}
