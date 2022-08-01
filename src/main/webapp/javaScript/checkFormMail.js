function checkModificaMail(idText,idButton,idErrore){
    var text = document.getElementById(idText).value;
    var buttonVisibility = document.getElementById(idButton).style.visibility;
    var mail = document.getElementById("mailUsata").value;
    mail = mail.toLowerCase();
    text = text.toLowerCase();

    var emailREGX = /[@]/;

    if(emailREGX.test(text) && text.length > 7 && text!=mail) {
        document.getElementById(idText).style.backgroundColor = "lightgreen";
        document.getElementById("modEmail").action="UpdateEmail";
        document.getElementById(idErrore).style.display = "none";
        buttonVisibility = "visible";
    }
    else{
        document.getElementById("modNome").action="";
        document.getElementById(idText).style.backgroundColor = "lightpink";
        document.getElementById(idErrore).style.display = "block";
        buttonVisibility = "hidden";
        if(text!=mail)
            document.getElementById(idErrore).textContent = "La mail deve contenere una @ e deve essere di almeno 7 caratteri";
        else
            document.getElementById(idErrore).textContent = "Email in uso";
    }
    document.getElementById(idButton).style.visibility = buttonVisibility;
}