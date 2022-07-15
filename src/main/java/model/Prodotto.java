package model;

public class Prodotto {

    private String piattaforma,dataUscita,videogioco;
    private boolean visibilita,disponibilita;

    public Prodotto(String piattaforma,String dataUscita,String videogioco,boolean visibilita,boolean disponibilita) {
        this.piattaforma = piattaforma;
        this.dataUscita = dataUscita;
        this.videogioco = videogioco;
        this.visibilita = visibilita;
        this.disponibilita = disponibilita;
    }

    public String getPiattaforma() {
        return piattaforma;
    }

    public String getDataUscita() {
        return dataUscita;
    }

    public String getVideogioco() {
        return videogioco;
    }

    public boolean isVisibilita() {
        return visibilita;
    }

    public boolean isDisponibilita() {
        return disponibilita;
    }

    public void setDisponibilita(boolean disponibilita) {
        this.disponibilita = disponibilita;
    }

    public void setVisibilita(boolean visibilita) {
        this.visibilita = visibilita;
    }

    public void setVideogioco(String videogioco) {
        this.videogioco = videogioco;
    }

    public void setDataUscita(String dataUscita) {
        this.dataUscita = dataUscita;
    }

    public void setPiattaforma(String piattaforma) {
        this.piattaforma = piattaforma;
    }
}
