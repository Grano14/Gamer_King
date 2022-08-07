package model;

public class Carta {

    private String nome,cognome,numero,verifica,scadenza;

    public Carta(String nome,String cognome,String numero,String verifica,String scadenza) {
        this.nome = nome;
        this.cognome = cognome;
        this.numero = numero;
        this.verifica = verifica;
        this.scadenza = scadenza;
    }

    public String getNome() {
        return nome;
    }

    public String getNumero() {
        return numero;
    }

    public String getCognome() {
        return cognome;
    }

    public String getVerifica() {
        return verifica;
    }

    public String getScadenza() {
        return scadenza;
    }

    public void setScadenza(String scadenza) {
        this.scadenza = scadenza;
    }

    public void setVerifica(String verifica) {
        this.verifica = verifica;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
