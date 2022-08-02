package model;

public class Prodotto {

    private String piattaforma,dataUscita,videogioco;

    private Double prezzo;

    private Integer nCopie;
    private boolean visibilita,disponibilita;

    public Prodotto(String piattaforma,String dataUscita,String videogioco,boolean visibilita,boolean disponibilita, Double prezzo, Integer nCopie) {
        this.piattaforma = piattaforma;
        this.dataUscita = dataUscita;
        this.videogioco = videogioco;
        this.visibilita = visibilita;
        this.disponibilita = disponibilita;
        this.prezzo = prezzo;
        this.nCopie = nCopie;
    }

    public String getPiattaforma() {
        return piattaforma;
    }

    public String getDataUscita() {
        return dataUscita;
    }

    public String getVideogioco() {
        return videogioco;
    }

    public boolean isVisibilita() {
        return visibilita;
    }

    public boolean isDisponibilita() {
        return disponibilita;
    }

    public Double getPrezzo() {
        return prezzo;
    }

    public Integer getnCopie() {
        return nCopie;
    }

    public void setDisponibilita(boolean disponibilita) {
        this.disponibilita = disponibilita;
    }

    public void setVisibilita(boolean visibilita) {
        this.visibilita = visibilita;
    }

    public void setVideogioco(String videogioco) {
        this.videogioco = videogioco;
    }

    public void setDataUscita(String dataUscita) {
        this.dataUscita = dataUscita;
    }

    public void setPiattaforma(String piattaforma) {
        this.piattaforma = piattaforma;
    }

    public boolean equals(Object o){
        Prodotto p = (Prodotto)o;
        Boolean flag = true;
        if(!this.piattaforma.equals(p.getPiattaforma())){
            flag = false;
        }
        if(!this.dataUscita.equals(p.getDataUscita())){
            flag = false;
        }
        if(!this.videogioco.equals(p.getVideogioco())){
            flag = false;
        }
        if(Double.compare(this.prezzo, p.getPrezzo()) != 0){
            flag = false;
        }
        if(!(this.nCopie == p.getnCopie())){
            flag = false;
        }
        if(!(this.visibilita == p.isVisibilita())){

        }
        if(!(this.disponibilita == p.isDisponibilita())){
            flag = false;
        }
        return flag;
    }

}
