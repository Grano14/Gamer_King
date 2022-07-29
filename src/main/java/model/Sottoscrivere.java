package model;

public class Sottoscrivere {

    private String numero,via,cap,numCivico,citta;
    private int idUtente;

    public Sottoscrivere(String numero,int idUtente, String via, String cap, String numCivico, String citta) {
        this.idUtente = idUtente;
        this.numero = numero;
        this.via = via;
        this.cap = cap;
        this.numCivico = numCivico;
        this.citta = citta;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public String getNumero() {
        return numero;
    }

    public String getCap() {
        return cap;
    }

    public String getVia() {
        return via;
    }

    public String getNumCivico() {
        return numCivico;
    }

    public String getCitta() {
        return citta;
    }

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public void setNumCivico(String numCivico) {
        this.numCivico = numCivico;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }
}
