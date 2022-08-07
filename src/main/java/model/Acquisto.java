package model;

public class Acquisto {

    private String nomeUtente, numeroCarta ,IdCopia,videogioco,piattaforma;

    public Acquisto(String numeroCarta,String nomeUtente, String IdCopia,String videogioco,String piattaforma){
        this.numeroCarta=numeroCarta;
        this.nomeUtente=nomeUtente;
        this.IdCopia=IdCopia;
        this.videogioco=videogioco;
        this.piattaforma=piattaforma;
    }

    public String getNumeroCarta() {
        return numeroCarta;
    }

    public String getNomeUtente() {
        return nomeUtente;
    }

    public String getIdCopia() {
        return IdCopia;
    }

    public String getVideogioco() {
        return videogioco;
    }

    public String getPiattaforma() {
        return piattaforma;
    }

    public void setPiattaforma(String piattaforma) {
        this.piattaforma = piattaforma;
    }

    public void setVideogioco(String videogioco) {
        this.videogioco = videogioco;
    }

    public void setIdCopia(String idCopia) {
        IdCopia = idCopia;
    }

    public void setNomeUtente(String nomeUtente) {
        this.nomeUtente = nomeUtente;
    }

    public void setNumeroCarta(String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }
}
