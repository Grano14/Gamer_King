package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcquirenteDAO {

    public static Acquirente doRetriveByNomeUtente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente from acquirente where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Acquirente a = new Acquirente(rs.getString(1));
                return a;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Acquirente a){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into acquirente (nomeUtente) values (?)");
            ps.setString(1, a.getNomeUtente());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveByNomeUtente(String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from acquirente where nomeUtente=?");
            ps.setString(1, nomeUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Acquirente> doRetriveAll(){
        ArrayList<Acquirente> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nomeUtente from acquirente");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Acquirente a = new Acquirente(rs.getString(1));
                l.add(a);
            }
            return l;
        }
        catch (SQLException e){
            throw  new RuntimeException(e);
        }
    }

}
