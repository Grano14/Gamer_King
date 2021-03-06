package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SottoscrivereDAO {

    public static Sottoscrivere doRetriveById(String numero, String citta, String numCivico, String cap, String via, String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select numero, nomeUtente, via, cap, numCivico, citta from Sottoscrivere where numero=? and citta=? and numCivico=? and cap=? and via=? and nomeUtente=?");
            ps.setString(1, numero);
            ps.setString(2, citta);
            ps.setString(3, numCivico);
            ps.setString(4, cap);
            ps.setString(5, via);
            ps.setString(6, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Sottoscrivere s = new Sottoscrivere(rs.getString(2), rs.getString(1), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                return s;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Sottoscrivere s){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Sottoscrivere (numero, nomeUtente, via, cap, numCivico, citta) values (?,?,?,?,?,?)");
            ps.setString(1, s.getNumero());
            ps.setString(2, s.getNomeUtente());
            ps.setString(3, s.getVia());
            ps.setString(4, s.getCap());
            ps.setString(5, s.getNumCivico());
            ps.setString(6, s.getCitta());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String numero, String citta, String numCivico, String cap, String via, String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Sottoscrivere where numero=? and citta=? and numCivico=? and cap=? and via=? and nomeUtente=?");
            ps.setString(1, numero);
            ps.setString(2, citta);
            ps.setString(3, numCivico);
            ps.setString(4, cap);
            ps.setString(5, via);
            ps.setString(6, nomeUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
