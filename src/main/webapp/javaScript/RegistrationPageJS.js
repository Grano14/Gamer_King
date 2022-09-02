//variabili di controllo per il controllo del form
var controllo1, controllo2, controllo3, controllo4;
//questa funzione controlla la validità dell'userName
function validateID(){
    //prendo il valore dell'userName  inserito
    var nomeUtente = document.getElementById("userName").value;
    var numeroREGX = /[0-9]/;
    var letteraMaiuscREGX = /[A-Z]/;
    //controllo se c'è almeno un numero, almeno un carattere maiuscolo e il nome supera i 5 caratteri
    if(numeroREGX.test(nomeUtente) && letteraMaiuscREGX.test(nomeUtente) && nomeUtente.length > 5) {
        //se il controllo ha effetto rende verde l'area e rende invisibile il messaggio di errore del nome
        document.getElementById("userName").style.backgroundColor = "lightgreen";
        document.getElementById("erroreNome").style.display = "none";
        controllo1=1;
    }
    else{
        //se il conrollo non è rispettato rende l'area rosso chiaro e rende visibile il messagiio di errore
        document.getElementById("userName").style.backgroundColor = "lightpink";
        document.getElementById("erroreNome").style.display = "block";
        controllo1=0;
    }
    //chiamo la funzione di controllo del bottone
    checkButton();
}

//la funzione di controllo del bottone si assicura che i dati siano adeguati per essere inviati alla servlet
function checkButton(){
    if(controllo1 == 1 && controllo2 == 1 && controllo3 == 1 && controllo4 == 1) {
        //se i controlli sono stati effettuati correttamente rende visibile il bottone e imposta l'action del from
        document.getElementById("bottoneReg").style.visibility = "visible";
        document.getElementById("formLogin").action = "RegistraUtente";
    }
    else
    {
        //altrimenti rende invisibile il bottone e invalida il form
        document.getElementById("bottoneReg").style.visibility = "hidden";
        document.getElementById("formLogin").action = "";
    }
}

//questa funzione controlla se la mail è stata inserita correttamente
function validateMail(){
    var emailREGX = /[@]/;
    var puntoREGX = /[.]/;
    var mail = document.getElementById("email").value;
    //controlla se la mai ha almeno una @, un . ed è lunga almeno 8 caratteri
    if(emailREGX.test(mail) && puntoREGX.test(mail) && mail.length > 7){
        //se il controllo ha effetto rende verde l'area e rende invisibile il messaggio di errore
        document.getElementById("email").style.backgroundColor = "lightgreen";
        document.getElementById("erroreMail").style.display = "none";
        controllo2=1;
    }
    else{
        //se il conrollo non è rispettato rende l'area rosso chiaro e rende visibile il messagiio di errore
        document.getElementById("email").style.backgroundColor = "lightpink";
        document.getElementById("erroreMail").style.display = "block";
        controllo2=0;
    }
    checkButton();
}
//questa funione controlla se la password è corretta
function validatePass(){
    var pass = document.getElementById("pass").value;
    var lettereMinREGX = /[a-z]/;
    var lettereMaiuscREGX = /[A-Z]/;
    var numeroREGX = /[0-9]/;
    if(lettereMaiuscREGX.test(pass) && lettereMinREGX.test(pass) && numeroREGX.test(pass) && pass.length > 6){
        document.getElementById("pass").style.backgroundColor = "lightgreen";
        document.getElementById("errorePass").style.display = "none";
        controllo3=1;
    }
    else{
        document.getElementById("pass").style.backgroundColor = "lightpink";
        document.getElementById("errorePass").style.display = "block";
        controllo3=0;
    }
    checkButton();
}
//questa funzione controlla se la conferma password è uguale alla password inserita
function validateConfPass(){
    var pass = document.getElementById("pass").value;
    var confPass = document.getElementById("confPass").value;
    if(confPass==pass && confPass.length>0){
        document.getElementById("confPass").style.backgroundColor = "lightgreen";
        document.getElementById("erroreConfPass").style.display = "none";
        controllo4=1;
    }
    else{
        document.getElementById("confPass").style.backgroundColor = "lightpink";
        document.getElementById("erroreConfPass").style.display = "block";
        controllo4=0;
    }
    checkButton();
}