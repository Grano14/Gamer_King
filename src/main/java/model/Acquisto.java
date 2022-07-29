package model;

public class Acquisto {

    private String numeroCarta ,via,cap,numCivico,citta,IdCopia,videogioco,piattaforma;
    private int idUtente;

    public Acquisto(String numeroCarta,int idUtente,String via,String cap,String numCivico,String citta,
                    String IdCopia,String videogioco,String piattaforma){
        this.numeroCarta=numeroCarta;
        this.idUtente=idUtente;
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

    public int getIdUtente() {
        return idUtente;
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

    public void setIdUtente(int idUtente) {
        this.idUtente = idUtente;
    }

    public void setNumeroCarta(String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }
}
