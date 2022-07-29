package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcquistoDAO {

    public static Acquisto doRetriveById(String idCopia, String videogioco, String piattaforma, int idUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select numeroCarta, idUtente, via, cap, numCivico, citta, IdCopia, videogioco, piattaforma  from Acquisto where IdCopia=? and videogioco=? and piattaforma=? and idUtente=?");
            ps.setString(1, idCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.setInt(4,idUtente);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Acquisto a = new Acquisto(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
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
            PreparedStatement ps = con.prepareStatement("insert into Acquisto (numerocarta, idUtente, via, cap, numCivico, citta, IdCopia, videogioco, piattaforma) values (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, a.getNumeroCarta());
            ps.setInt(2, a.getIdUtente());
            ps.setString(3, a.getVia());
            ps.setString(4, a.getCap());
            ps.setString(5, a.getNumCivico());
            ps.setString(6, a.getCitta());
            ps.setString(7, a.getIdCopia());
            ps.setString(8, a.getVideogioco());
            ps.setString(9, a.getPiattaforma());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String idCopia, String videogioco, String piattaforma, int idUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from acquisto where IdCopia=? and videogioco=? and piattaforma=? and idUtente=?");
            ps.setString(1, idCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ps.setInt(4,idUtente);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Acquisto> doRetriveAll(){
        ArrayList<Acquisto> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select numeroCarta, idUtente, via, cap, numCivico, citta, IdCopia, videogioco, piattaforma  from Acquisto");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Acquisto a = new Acquisto(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
                l.add(a);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
