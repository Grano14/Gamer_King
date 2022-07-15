package model;

public class Copia {

    private String IdCopia, videogioco, piattaforma;

    public Copia(String idCopia,String videogioco,String piattaforma) {
        this.IdCopia = idCopia;
        this.videogioco = videogioco;
        this.piattaforma = piattaforma;
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
}
