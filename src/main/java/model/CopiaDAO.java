package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CopiaDAO {

    public static Copia doRetriveById(String IdCopia, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select IdCopia, videogioco, piattaforma from Copia where IdCopia=? and videogioco=? and piattaforma=?");
            ps.setString(1, IdCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Copia c = new Copia(rs.getString(1), rs.getString(2), rs.getString(3));
                return c;
            }
            return null;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doSave(Copia c){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("insert into Copia (IdCopia, videogioco, piattaforma) values (?,?,?)");
            ps.setString(1, c.getIdCopia());
            ps.setString(2, c.getVideogioco());
            ps.setString(3, c.getPiattaforma());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String IdCopia){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from Copia where IdCopia=?");
            ps.setString(1, IdCopia);
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Copia> doRetriveAll(){
        ArrayList<Copia> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select IdCopia, videogioco, piattaforma from Copia");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Copia c = new Copia(rs.getString(1), rs.getString(2), rs.getString(3));
                l.add(c);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Copia> doRetriveAllByVideogiocoPiattaforma(String gioco, String piattaforma){
        ArrayList<Copia> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select IdCopia, videogioco, piattaforma from Copia where videogioco=? and piattaforma=?");
            ps.setString(1, gioco);
            ps.setString(2, piattaforma);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Copia c = new Copia(rs.getString(1), rs.getString(2), rs.getString(3));
                l.add(c);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Copia> doRetriveNotSellByVideogame(String gioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            ArrayList<Copia> listCopieVendute = new ArrayList<>();
            ArrayList<Copia> listCopie = CopiaDAO.doRetriveAllByVideogiocoPiattaforma(gioco, piattaforma);
            PreparedStatement ps = con.prepareStatement("select c.IdCopia, c.videogioco, c.piattaforma from copia c, acquisto a where c.IdCopia=a.IdCopia and c.videogioco=a.videogioco and c.piattaforma=a.piattaforma and c.videogioco=? and c.piattaforma=?");
            ps.setString(1, gioco);
            ps.setString(2, piattaforma);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Copia c = new Copia(rs.getString(1), rs.getString(2), rs.getString(3));
                listCopieVendute.add(c);
            }
            int i;
            for(i=0; i<listCopieVendute.size(); i++){
                listCopie.remove(listCopieVendute.get(i));
            }
            return listCopie;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
