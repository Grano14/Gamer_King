package model;

public class Appartenere {

    private String videogioco,genere;

    public Appartenere(String videogioco,String genere) {
        this.videogioco = videogioco;
        this.genere = genere;
    }

    public String getVideogioco() {
        return videogioco;
    }

    public String getGenere() {
        return genere;
    }

    public void setGenere(String genere) {
        this.genere = genere;
    }

    public void setVideogioco(String videogioco) {
        this.videogioco = videogioco;
    }
}
