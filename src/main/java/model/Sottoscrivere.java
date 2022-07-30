package model;

public class Sottoscrivere {

    private String numero,via,cap,numCivico,citta,nomeUtente;

    public Sottoscrivere(String numero, String nomeUtente, String via, String cap, String numCivico, String citta) {
        this.nomeUtente = nomeUtente;
        this.numero = numero;
        this.via = via;
        this.cap = cap;
        this.numCivico = numCivico;
        this.citta = citta;
    }

    public String getNomeUtente() {
        return nomeUtente;
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

    public void setNomeUtente(String nomeUtente) {
        this.nomeUtente = nomeUtente;
    }
}
