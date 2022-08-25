package model;

import java.util.Objects;

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Copia copia = (Copia) o;
        return Objects.equals(IdCopia, copia.IdCopia) && Objects.equals(videogioco, copia.videogioco) && Objects.equals(piattaforma, copia.piattaforma);
    }

    @Override
    public int hashCode() {
        return Objects.hash(IdCopia, videogioco, piattaforma);
    }
}
