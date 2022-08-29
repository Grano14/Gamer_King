package model;

public class Acquisto {

    private String nomeUtente, numeroCarta ,IdCopia,videogioco,piattaforma, via, cap, numCivico, citta, dataAcquisto;

    public Acquisto(String numeroCarta,String nomeUtente, String IdCopia,String videogioco,String piattaforma,String via, String cap, String citta, String numCivico, String dataAcquisto){
        this.numeroCarta=numeroCarta;
        this.nomeUtente=nomeUtente;
        this.IdCopia=IdCopia;
        this.videogioco=videogioco;
        this.piattaforma=piattaforma;
        this.via=via;
        this.cap=cap;
        this.numCivico=numCivico;
        this.citta=citta;
        this.dataAcquisto=dataAcquisto;
    }

    public String getNumeroCarta() {
        return numeroCarta;
    }

    public String getNomeUtente() {
        return nomeUtente;
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

    public String getDataAcquisto() {
        return dataAcquisto;
    }

    public void setDataAcquisto(String dataAcquisto) {
        this.dataAcquisto = dataAcquisto;
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

    public void setPiattaforma(String piattaforma) {
        this.piattaforma = piattaforma;
    }

    public void setVideogioco(String videogioco) {
        this.videogioco = videogioco;
    }

    public void setIdCopia(String idCopia) {
        IdCopia = idCopia;
    }

    public void setNomeUtente(String nomeUtente) {
        this.nomeUtente = nomeUtente;
    }

    public void setNumeroCarta(String numeroCarta) {
        this.numeroCarta = numeroCarta;
    }
}
