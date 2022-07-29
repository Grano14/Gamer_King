package model;

public class Utente {

    private String nomeUtente, email, pass;
    private int id;
    private boolean adm;

    public Utente(String nomeUtente, String email, String pass, boolean adm){
        this.nomeUtente = nomeUtente;
        this.email = email;
        this.pass = pass;
        this.adm = adm;
    }

    public Utente(int id, String nomeUtente, String email, String pass, boolean adm){
        this.id = id;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
