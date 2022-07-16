package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GenereDAO {

    public static Genere doRetriveById(String nome){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select nome from Genere where nome=?");
            ps.setString(1, nome);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Genere g = new Genere(rs.getString(1));
                return g;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Genere g){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Genere (nome) values (?)");
            ps.setString(1, g.getNome());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String nome){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Genere where nome=?");
            ps.setString(1, nome);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


}
