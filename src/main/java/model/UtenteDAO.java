package model;

import com.mysql.cj.protocol.Resultset;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UtenteDAO {

    public static Utente doRetriveByNomeUtente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente, mail, pass, adm, immagine from utente where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Utente u = new Utente(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4),rs.getString(5));
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
            PreparedStatement ps = con.prepareStatement("insert into utente (nomeUtente, mail, pass,adm) values (?,?,?,false)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, u.getNomeUtente());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPass());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveByNomeUtente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from utente where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Utente> doRetriveAll(){
        ArrayList<Utente> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente, mail, pass, adm, immagine from utente");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Utente u = new Utente(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4),rs.getString(5));
                l.add(u);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

    public static void updateNomeUtente(Utente u, String nuovoNome){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update Utente set nomeUtente=? where nomeUtente=?");
            ps.setString(1, nuovoNome);
            ps.setString(2, u.getNomeUtente());
            ps.execute();

            u.setNomeUtente(nuovoNome);
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void updateEmailUtente(Utente u, String nuovaMail){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("update Utente set mail=? where nomeUtente=?");
            ps.setString(1, nuovaMail);
            ps.setString(2, u.getNomeUtente());
            ps.execute();

            u.setEmail(nuovaMail);
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
