package model;

public class Carrello {

    private String nomeUtente;
    private float prezzoTotale;

    public Carrello(String nomeUtente,float prezzoTotale) {
        this.nomeUtente = nomeUtente;
        this.prezzoTotale=prezzoTotale;
    }

    public String getNomeUtente() {
        return nomeUtente;
    }

    public float getPrezzoTotale() {
        return prezzoTotale;
    }

    public void setPrezzoTotale(float prezzoTotale) {
        this.prezzoTotale = prezzoTotale;
    }

    public void setNomeUtente(String nomeUtente) {
        this.nomeUtente = nomeUtente;
    }
}
