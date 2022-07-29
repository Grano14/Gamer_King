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
            PreparedStatement ps = con.prepareStatement("select * from utente where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Utente u = new Utente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                return u;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static Utente doRetriveById(int id){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select * from utente where id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Utente u = new Utente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                return u;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static Utente doRetriveAdmin(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select * from utente where nomeUtente=? and adm=true");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Utente u = new Utente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
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
            PreparedStatement ps = con.prepareStatement("insert into utente (nomeUtente, mail, pass,adm) values (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, u.getNomeUtente());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPass());
            ps.setBoolean(4, u.isAdm());
            ps.execute();
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            u.setId(id);

        } catch (SQLException e) {
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

    public static ArrayList<Utente> doRetriveAllUser(){
        ArrayList<Utente> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select * from utente where adm=false");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Utente u = new Utente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                l.add(u);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

    public static ArrayList<Utente> doRetriveAll(){
        ArrayList<Utente> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select * from utente");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Utente u = new Utente(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5));
                l.add(u);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

}

