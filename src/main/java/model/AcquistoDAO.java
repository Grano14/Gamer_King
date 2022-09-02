package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcquistoDAO {

    public static Acquisto doRetriveById(String idCopia, String videogioco, String piattaforma){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select numero, nomeUtente, IdCopia, videogioco, piattaforma, via, cap, citta, numCivico, dataAcquisto from Acquisto where IdCopia=? and videogioco=? and piattaforma=? ");
            ps.setString(1, idCopia);
            ps.setString(2, videogioco);
            ps.setString(3, piattaforma);

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Acquisto a = new Acquisto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
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
            PreparedStatement ps = con.prepareStatement("insert into Acquisto (numero, nomeUtente, IdCopia, videogioco, piattaforma, via, cap, citta, numCivico, dataAcquisto) values (?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, a.getNumeroCarta());
            ps.setString(2, a.getNomeUtente());
            ps.setString(3, a.getIdCopia());
            ps.setString(4, a.getVideogioco());
            ps.setString(5, a.getPiattaforma());
            ps.setString(6, a.getVia());
            ps.setString(7, a.getCap());
            ps.setString(8, a.getCitta());
            ps.setString(9, a.getNumCivico());
            ps.setString(10, a.getDataAcquisto());
            ps.execute();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static void doRemoveById(String idCopia, String videogioco, String piattaforma, String nomeUtente){
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("delete from acquisto where IdCopia=? and videogioco=? and " +
                    "piattaforma=? and nomeUtente=?");
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
            PreparedStatement ps = con.prepareStatement("select numero, nomeUtente, IdCopia, videogioco, piattaforma, via, cap, citta, numCivico, dataAcquisto  from Acquisto");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Acquisto a = new Acquisto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
                l.add(a);
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public static ArrayList<Prodotto> doRetriveAllByUtente(String nome){
        ArrayList<Prodotto> l = new ArrayList<>();
        try(Connection con = ConPool.getConnection()){
            PreparedStatement ps = con.prepareStatement("select distinct videogioco, piattaforma from Acquisto where nomeUtente=?");
            ps.setString(1, nome);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String gioco = rs.getString(1);
                String piattaforma = rs.getString(2);
                l.add(ProdottoDAO.doRetriveById(gioco, piattaforma));
            }
            return l;
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

}
