package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartaDAO {

    public static Carta doRetriveById(String numero, String citta, String numCivico, String cap, String via){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nome, cognome, numero, scadenza, verifica, via, cap, numCivico, citta from Carta where numero=? and citta=? and numCivico=? and cap=? and via=?");
            ps.setString(1, numero);
            ps.setString(2, citta);
            ps.setString(3, numCivico);
            ps.setString(4, cap);
            ps.setString(5, via);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Carta c = new Carta(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(5), rs.getString(4));
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
            PreparedStatement ps = con.prepareStatement("insert into Carta (nome, cognome, numero, scadenza, verifica, via, cap, numCivico, citta) values (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, c.getNome());
            ps.setString(2, c.getCognome());
            ps.setString(3, c.getNumero());
            ps.setString(4, c.getScadenza());
            ps.setString(5, c.getVerifica());
            ps.setString(6, c.getVia());
            ps.setString(7, c.getCap());
            ps.setString(8, c.getNumCivico());
            ps.setString(9, c.getCitta());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String numero, String citta, String numCivico, String cap, String via){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Carta where numero=? and citta=? and numCivico=? and cap=? and via=?");
            ps.setString(1, numero);
            ps.setString(2, citta);
            ps.setString(3, numCivico);
            ps.setString(4, cap);
            ps.setString(5, via);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
