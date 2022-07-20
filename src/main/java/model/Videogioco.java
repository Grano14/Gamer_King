package model;

public class Videogioco {

    private String titolo,descrizione;

    public Videogioco(String titolo,String descrizione) {
        this.titolo = titolo;
        this.descrizione = descrizione;
    }

    public String getTitolo() {
        return titolo;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }
}
