package model;
import java.util.GregorianCalendar;

public class Carta {

    String nome,cognome,numero,via,cap,numCivico,citta,verifica;
    GregorianCalendar scadenza;

    public Carta(String nome,String cognome,String numero,String via,String cap,String numCivico,String citta,String verifica,GregorianCalendar scadenza) {
        this.nome = nome;
        this.cognome = cognome;
        this.numero = numero;
        this.via = via;
        this.cap = cap;
        this.numCivico = numCivico;
        this.citta = citta;
        this.verifica = verifica;
        this.scadenza = scadenza;
    }

    public String getNome() {
        return nome;
    }

    public String getNumero() {
        return numero;
    }

    public String getCap() {
        return cap;
    }

    public String getCognome() {
        return cognome;
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

    public String getVerifica() {
        return verifica;
    }

    public GregorianCalendar getScadenza() {
        return scadenza;
    }

    public void setScadenza(GregorianCalendar scadenza) {
        this.scadenza = scadenza;
    }

    public void setVerifica(String verifica) {
        this.verifica = verifica;
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

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
