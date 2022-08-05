var controllo1,controllo2;

function checkNome(idText,idErrore){
    var text = document.getElementById(idText).value;
    if(text.length>0)
    {
        controllo1=1;
        document.getElementById("erroreNome").style.visibility = "hidden";
    }
    else{
        controllo1=0;
        document.getElementById("erroreNome").style.visibility = "visible";
    }
}

function checkPass(idText,idErrore){
    var text = document.getElementById(idText).value;
    if(text.length>0)
    {
        controllo2=1;
        document.getElementById("errorePass").style.visibility = "hidden";
    }
    else{
        controllo2=0;
        document.getElementById("errorePass").style.visibility = "visible";
    }
}

function checkFormLogin(){
    if(controllo1==1 && controllo2==1)
        document.getElementById("formLogin").action = "AccessoUtente";
    else
        document.getElementById("formLogin").action = "";
}