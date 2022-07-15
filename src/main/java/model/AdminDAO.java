package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AdminDAO {

    public static Admin doRetriveByNomeUtente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select adm, nomeUtente from Amministratore where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Admin a = new Admin(rs.getBoolean(1), rs.getString(2));
                return a;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Admin a){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Amministratore (adm, nomeUtente) values (?,?)");
            ps.setBoolean(1, a.getAdm());
            ps.setString(2, a.getnomeUtente());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveByNomeUtente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete * from amministratore where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Admin> doRetriveAll(){
        ArrayList<Admin> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select adm, nomeUtente from amministratore");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Admin a = new Admin(rs.getBoolean(1), rs.getString(2));
                l.add(a);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
