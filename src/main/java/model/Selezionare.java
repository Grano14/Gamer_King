package model;

public class Selezionare {

    private String nomeUtente,videogioco,piattaforma;

    public Selezionare(String nomeUtente,String videogioco,String piattaforma) {
        this.nomeUtente = nomeUtente;
        this.videogioco = videogioco;
        this.piattaforma = piattaforma;
    }

    public String getNomeUtente() {
        return nomeUtente;
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

    public void setNomeUtente(String nomeUtente) {
        this.nomeUtente = nomeUtente;
    }
}
