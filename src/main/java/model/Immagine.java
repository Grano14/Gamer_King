package model;

public class Immagine {

    private String path,videogioco;

    public Immagine(String path,String videogioco) {
        this.path = path;
        this.videogioco = videogioco;
    }

    public String getPath() {
        return path;
    }

    public String getVideogioco() {
        return videogioco;
    }

    public void setVideogioco(String videogioco) {
        this.videogioco = videogioco;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
