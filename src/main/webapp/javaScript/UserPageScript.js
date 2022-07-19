function showMenu(val){
    var list = ["m", "m1", "m2", "m3", "m4", "m5", "m6"];
    list.forEach(function (element) {
        if(element == val)
            document.getElementById(element).style.visibility = "visible";
        else
            document.getElementById(element).style.visibility = "hidden";
    })
}
