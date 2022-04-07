/*funzione per rendere visibile la traduzione cliccando sul pulsante "Mostra traduzione"*/
function gestoreMostraTraduzione(){
	try{
       if (this.id == "mostraTrad2") {
		    nodoMostraTrad2.setAttribute("class", "no");
		    nodoTraduzione2.setAttribute("class", "yes");
		    nodoNascondiTrad2.setAttribute("class", "yes");
        }
        else {
            nodoMostraTrad3.setAttribute("class", "no");
		    nodoTraduzione3.setAttribute("class", "yes");
		    nodoNascondiTrad3.setAttribute("class", "yes");
        }
	}
    catch(e){
	}
}

/*funzione per nascondere la traduzione cliccando sul pulsante "Nascondi traduzione"*/
function gestoreNascondiTraduzione(){
	try{
        if (this.id == "nascondiTrad2") {
		nodoMostraTrad2.setAttribute("class", "yes");
		nodoTraduzione2.setAttribute("class", "no");
		nodoNascondiTrad2.setAttribute("class", "no");
        }
        else {
            nodoMostraTrad3.setAttribute("class", "yes");
		    nodoTraduzione3.setAttribute("class", "no");
		    nodoNascondiTrad3.setAttribute("class", "no");
        }
	}
    catch(e){
	}
}


var nodoMostraTrad2;
var nodoNascondiTrad2;
var nodoTraduzione2;

var nodoMostraTrad3;
var nodoNascondiTrad3;
var nodoTraduzione3;


function gestoreLoad(){
	try{
        nodoTraduzione2 = document.getElementById("trad2");
		nodoMostraTrad2 = document.getElementById("mostraTrad2");
		nodoMostraTrad2.onclick = gestoreMostraTraduzione;
		nodoNascondiTrad2 = document.getElementById("nascondiTrad2");
		nodoNascondiTrad2.onclick = gestoreNascondiTraduzione;

        nodoTraduzione3 = document.getElementById("trad3");
		nodoMostraTrad3 = document.getElementById("mostraTrad3");
		nodoMostraTrad3.onclick = gestoreMostraTraduzione;
		nodoNascondiTrad3 = document.getElementById("nascondiTrad3");
		nodoNascondiTrad3.onclick = gestoreNascondiTraduzione;

    } catch(e){
		alert("gestoreLoad "+e);
	}
}

window.onload = gestoreLoad;