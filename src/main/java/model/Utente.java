package model;

public class Utente {

    private String nomeUtente, email, pass;
    private boolean adm;

    public Utente(String nomeUtente, String email, String pass,boolean adm){
        this.nomeUtente = nomeUtente;
        this.email = email;
        this.pass = pass;
        this.adm = adm;
    }

    public boolean isAdm() {
        return adm;
    }

    public void setAdm(boolean adm) {
        this.adm = adm;
    }

    public String getEmail() {
        return email;
    }

    public String getNomeUtente() {
        return nomeUtente;
    }

    public String getPass() {
        return pass;
    }

    public void setNomeUtente(String nomeUtente){
        this.nomeUtente=nomeUtente;
    }

    public void setPass(String password){
        this.pass=password;
    }

    public void setEmail(String email){

        this.email=email;
    }
}
