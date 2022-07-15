package model;

public class Videogioco {

    String codice,titolo,descrizione;

    public Videogioco(String codice,String titolo,String descrizione) {
        this.codice = codice;
        this.titolo = titolo;
        this.descrizione = descrizione;
    }

    public String getCodice() {
        return codice;
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

    public void setCodice(String codice) {
        this.codice = codice;
    }
}
