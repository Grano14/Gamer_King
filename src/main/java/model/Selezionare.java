package model;

public class Selezionare {

    private String nomeUtente, videogioco,piattaforma;

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

    public boolean equals(Object o){
        Selezionare s = (Selezionare) o;
        if(this.nomeUtente.equals(s.getNomeUtente()) && this.piattaforma.equals(s.getPiattaforma()) && this.videogioco.equals(s.getVideogioco())){
            return true;
        }else{
            return false;
        }
    }

}
