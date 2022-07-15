package model;

public class Admin {

    public boolean getAdm(){
        return adm;
    }

    public String getnomeUtente(){
        return nomeUtente;
    }

    public void setNomeUtente(String nomeUtente){
        this.nomeUtente=nomeUtente;
    }

    public void setAdm(boolean adm){
        this.adm=adm;
    }

    private boolean adm;
    private String nomeUtente;
}
