package model;

public class Acquisto {

    private String nomeUtente, numeroCarta ,via,cap,numCivico,citta,IdCopia,videogioco,piattaforma;

    public Acquisto(String numeroCarta,String nomeUtente,String via,String cap,String numCivico,String citta,
                    String IdCopia,String videogioco,String piattaforma){
        this.numeroCarta=numeroCarta;
        this.nomeUtente=nomeUtente;
        this.via=via;
        this.cap=cap;
        this.numCivico=numCivico;
        this.citta=citta;
        this.IdCopia=IdCopia;
        this.videogioco=videogioco;
        this.piattaforma=piattaforma;
    }

    public String getNumeroCarta() {
        return numeroCarta;
    }

    public String getNomeUtente() {
        return nomeUtente;
    }

    public String getVia() {
        return via;
    }

    public String getCap() {
        return cap;
    }

    public String getNumCivico() {
        return numCivico;
    }

    public String getCitta() {
        return citta;
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

    public void setCitta(String citta) {
        this.citta = citta;
    }

    public void setNumCivico(String numCivico) {
        this.numCivico = numCivico;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }

    public void setVia(String via) {
        this.via = via;
    }

    public void setNomeUtente(String nomeUtente) {
        this.nomeUtente = nomeUtente;
    }

    public void setNumeroCarta(String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }
}
