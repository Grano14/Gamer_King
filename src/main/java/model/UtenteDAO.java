package model;

import com.mysql.cj.protocol.Resultset;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UtenteDAO {

    public static Utente doretriveByNomeUtente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente, mail, pass from utente where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Utente u = new Utente(rs.getString(1), rs.getString(2), rs.getString(3));
                return u;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Utente u){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into utente (nomeUtente, mail, pass) values (?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, u.getNomeUtente());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPass());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
