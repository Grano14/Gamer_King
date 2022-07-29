package model;

public class Selezionare {

    private String videogioco,piattaforma;
    private int idUtente;

    public Selezionare(int idUtente,String videogioco,String piattaforma) {
        this.idUtente = idUtente;
        this.videogioco = videogioco;
        this.piattaforma = piattaforma;
    }

    public int getIdUtente() {
        return idUtente;
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

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }
}
