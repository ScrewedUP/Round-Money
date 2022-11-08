let conunterfun = document.getElementById("counter-inc");
let counter = 0;
let prevc = document.getElementById("prev");
function increment(){
    counter++;
    conunterfun.innerText = counter;
}

function save(){
    prevc.innerText += counter + " - ";
    counter = 0;
    conunterfun.textContent = counter;
}
