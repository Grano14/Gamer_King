package model;

public class Recensione {

    private String nomeUtente,videogioco,piattaforma,pubblicazione,contenuto;
    private int nstelle;

    public Recensione(String nomeUtente,String videogioco,String piattaforma,String pubblicazione,String contenuto,
                      int nstelle){
        this.nomeUtente=nomeUtente;
        this.videogioco=videogioco;
        this.piattaforma=piattaforma;
        this.pubblicazione=pubblicazione;
        this.contenuto=contenuto;
        this.nstelle=nstelle;
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

    public String getPubblicazione() {
        return pubblicazione;
    }

    public String getContenuto() {
        return contenuto;
    }

    public int getNstelle() {
        return nstelle;
    }

    public void setNstelle(int nstelle) {
        this.nstelle = nstelle;
    }

    public void setContenuto(String contenuto) {
        this.contenuto = contenuto;
    }

    public void setPubblicazione(String pubblicazione) {
        this.pubblicazione = pubblicazione;
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
