function botonOver(idImg, imgOver, imgOut, accion, idMenu) {
	if(accion == "open") {
		//alert (imgOver);
		if (idMenu!="") {
			document.getElementById(idMenu).style.visibility = "visible";
		}
		document.getElementById(idImg).src = imgOver;
	}
	else if(accion == "close") {
		if (idMenu!="") {
			document.getElementById(idMenu).style.visibility = "hidden";
		}
		document.getElementById(idImg).src = imgOut;
	}
}

function itemOver(element) {
	element.style.background="#D7E4EF";
}

function itemOut(element) {
	element.style.background="#F5F5F5";
}

function prepararMenu() {
	if (!document.getElementsByTagName) return false;
	if (!document.getElementById) return false;
	if (!document.getElementById("menues")) return false;
	var menues = document.getElementById("menues");
	var links = menues.getElementsByTagName("li");
	for (var i=0; i < links.length; i++) {
		links[i].onmouseover = function() {
			return itemOver(this);
		}
		links[i].onmouseout = function() {
			return itemOut(this);
		}
	}
	var menu2 = document.getElementById("menu2");
	menu2.onmouseover = function() {
		return botonOver('btn_listados','imagenes/btn_listados_over.gif','imagenes/btn_listados.gif','open',"menu2");
	}
	menu2.onmouseout = function() {
		return botonOver('btn_listados','imagenes/btn_listados_over.gif','imagenes/btn_listados.gif','close',"menu2");
	}
	var menu3 = document.getElementById("menu3");
	menu3.onmouseover = function() {
		return botonOver('btn_agentes','imagenes/btn_agentes_over.gif','imagenes/btn_agentes.gif','open',"menu3");
	}
	menu3.onmouseout = function() {
		return botonOver('btn_agentes','imagenes/btn_agentes_over.gif','imagenes/btn_agentes.gif','close',"menu3");
	}
	var menu4 = document.getElementById("menu4");
	menu4.onmouseover = function() {
		return botonOver('btn_licencias','imagenes/btn_licencias_over.gif','imagenes/btn_licencias.gif','open',"menu4");
	}
	menu4.onmouseout = function() {
		return botonOver('btn_licencias','imagenes/btn_licencias_over.gif','imagenes/btn_licencias.gif','close',"menu4");
	}
	var menu5 = document.getElementById("menu5");
	menu5.onmouseover = function() {
		return botonOver('btn_contrasenia','imagenes/btn_contrasenia_over.gif','imagenes/btn_contrasenia.gif','open',"menu5");
	}
	menu5.onmouseout = function() {
		return botonOver('btn_contrasenia','imagenes/btn_contrasenia_over.gif','imagenes/btn_contrasenia.gif','close',"menu5");
	}
	var menu6 = document.getElementById("menu6");
	menu6.onmouseover = function() {
		return botonOver('btn_ayuda','imagenes/btn_ayuda_over.gif','imagenes/btn_ayuda.gif','open',"menu6");
	}
	menu6.onmouseout = function() {
		return botonOver('btn_ayuda','imagenes/btn_ayuda_over.gif','imagenes/btn_ayuda.gif','close',"menu6");
	}
	
	//	BOTONES - Comportamientos: sobrevolado cambia img y despliega menu
	// btn_home
	var btn_home = document.getElementById("btn_home");
	btn_home.onmouseover = function() {
		return botonOver('btn_home','imagenes/btn_home_over.gif','imagenes/btn_home2.gif','open','');
	}
	btn_home.onmouseout = function() {
		return botonOver('btn_home','imagenes/btn_home_over.gif','imagenes/btn_home2.gif','close','');
	}
	// btn_internet
	var btn_internet = document.getElementById("btn_listados");
	btn_internet.onmouseover = function() {
		 return botonOver('btn_listados','imagenes/btn_listados_over.gif','imagenes/btn_listados.gif','open','menu2');
	}
	btn_internet.onmouseout = function() {
		return botonOver('btn_listados','imagenes/btn_listados_over.gif','imagenes/btn_listados.gif','close','menu2');
	}
	// btn_email
	var btn_email = document.getElementById("btn_agentes");
	btn_email.onmouseover = function() {
		 return botonOver('btn_agentes','imagenes/btn_agentes_over.gif','imagenes/btn_agentes.gif','open','menu3');
	}
	btn_email.onmouseout = function() {
		return botonOver('btn_agentes','imagenes/btn_agentes_over.gif','imagenes/btn_agentes.gif','close','menu3');
	}
	// btn_turismo
	var btn_turismo = document.getElementById("btn_licencias");
	btn_turismo.onmouseover = function() {
		return botonOver('btn_licencias','imagenes/btn_licencias_over.gif','imagenes/btn_licencias.gif','open','menu4');
	}
	btn_turismo.onmouseout = function() {
		return botonOver('btn_licencias','imagenes/btn_licencias_over.gif','imagenes/btn_licencias.gif','close','menu4');
	}
	// btn_servicios
	var btn_servicios = document.getElementById("btn_contrasenia");
	btn_servicios.onmouseover = function() {
		 return botonOver('btn_contrasenia','imagenes/btn_contrasenia_over.gif','imagenes/btn_contrasenia.gif','open','menu5');
	}
	btn_servicios.onmouseout = function() {
		return botonOver('btn_contrasenia','imagenes/btn_contrasenia_over.gif','imagenes/btn_contrasenia.gif','close','menu5');
	}
	// btn_ayuda
	var btn_ayuda = document.getElementById("btn_ayuda");
	btn_ayuda.onmouseover = function() {
		return botonOver('btn_ayuda','imagenes/btn_ayuda_over.gif','imagenes/btn_ayuda.gif','open','');
	}
	btn_ayuda.onmouseout = function() {
		return botonOver('btn_ayuda','imagenes/btn_ayuda_over.gif','imagenes/btn_ayuda.gif','close','');
	}
}