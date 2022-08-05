var controllo1,controllo2;

function checkNome(idText){
    var text = document.getElementById(idText).value;
    if(text.length>0)
        controllo1=1;
    else
        controllo1=0;
}

function checkPass(idText){
    var text = document.getElementById(idText).value;
    if(text.length>0)
        controllo2=1;
    else
        controllo2=0;
}

function checkFormLogin(){
    if(controllo1==1 && controllo2==1)
        document.getElementById("formLogin").action = "AccessoUtente";
    else
        document.getElementById("formLogin").action = "";
}