
function secondBarEffect(){
    if(window.pageYOffset != 0){
        document.getElementById("fasiAcq").style.top = "50px";
    }
    else{
        document.getElementById("fasiAcq").style.top="60px";
    }
}