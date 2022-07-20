package model;

public class Immagine {

    private String path,videogioco;
    private boolean principale;

    public Immagine(String path,String videogioco,boolean principale) {
        this.path = path;
        this.videogioco = videogioco;
        this.principale = principale;
    }

    public String getPath() {
        return path;
    }

    public String getVideogioco() {
        return videogioco;
    }

    public boolean isPrincipale() {
        return principale;
    }

    public void setPrincipale(boolean principale) {
        this.principale = principale;
    }

    public void setVideogioco(String videogioco) {
        this.videogioco = videogioco;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
