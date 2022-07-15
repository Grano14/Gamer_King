package model;

public class Utente {

    private String nomeUtente, email, pass;

    public Utente(String nomeUtente, String email, String pass){
        this.nomeUtente = nomeUtente;
        this.email = email;
        this.pass = pass;
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
