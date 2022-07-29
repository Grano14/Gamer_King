package model;

public class Carrello {

    private int idUtente;
    private float prezzoTotale;

    public Carrello(int idUtente,float prezzoTotale) {
        this.idUtente = idUtente;
        this.prezzoTotale=prezzoTotale;
    }

    public int getIdUtente() {
        return idUtente;
    }

    public float getPrezzoTotale() {
        return prezzoTotale;
    }

    public void setPrezzoTotale(float prezzoTotale) {
        this.prezzoTotale = prezzoTotale;
    }

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }
}
