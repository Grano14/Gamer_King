package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcquistoDAO {

    public static Acquisto doRetriveById(String idCopia, String videogioco, String piattaforma, String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select numeroCarta, nomeUtente, IdCopia, videogioco, piattaforma  from Acquisto where IdCopia=? and videogioco=? and piattaforma=? and nomeUtente=?");
            ps.setString(1, idCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.setString(4,nomeUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Acquisto a = new Acquisto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return a;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Acquisto a){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Acquisto (numerocarta, nomeUtente, IdCopia, videogioco, piattaforma) values (?,?,?,?,?)");
            ps.setString(1, a.getNumeroCarta());
            ps.setString(2, a.getNomeUtente());
            ps.setString(3, a.getIdCopia());
            ps.setString(4, a.getVideogioco());
            ps.setString(5, a.getPiattaforma());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String idCopia, String videogioco, String piattaforma, String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from acquisto where IdCopia=? and videogioco=? and piattaforma=? and nomeUtente=?");
            ps.setString(1, idCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.setString(4,nomeUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Acquisto> doRetriveAll(){
        ArrayList<Acquisto> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select numeroCarta, nomeUtente, IdCopia, videogioco, piattaforma  from Acquisto");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Acquisto a = new Acquisto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                l.add(a);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
