
        var text_dia = "";
		var text_mes = "";
		var text_anio = "";
		
		  function cancelar() {
	 		var aux = confirm( "Los datos del formulario se perder?n.\n?Est? seguro que desea Cancelar?" );
			if ( aux ) location.href='principal.jsp';   
   		  }
		
		function habilitar(dia, mes, anio) {
          dia.disabled = false;
          mes.disabled = false;
          anio.disabled = false;
          dia.focus();
        }

        function deshabilitar(dia, mes, anio)  {
          dia.disabled = true;
	      dia_l = dia.toString().length;
          mes.disabled = true;
          anio.disabled = true;
        }
function isNumber( str ) {
	// No acepta decimales.
	for ( var i = 0 ; i < str.length ; i++ ) {
		var aux = str.charAt( i ) ;
		if ( aux < '0' || aux > '9' ) return false ;
	}
	return true ;
}
        function corregir(texto) {
		  var num = parseInt(texto.value);
		  var nuevo = "" + num
		  if (num.toString().length == 1)
		    nuevo = "0"+nuevo;
		  texto.value = nuevo;
		}
		
		function cambiar_estado(nombre, p) {
			var elem = document.getElementById(nombre);
			if (p.checked == true)
			  elem.disabled = false;
			else {
			  elem.disabled = true;
			  elem.checked = false;
			}
		}
		
		function check_ordenar(orden) {
		  for(i=0;i<orden.length; i++) {
             if (orden[i].checked == true)
			   return true
		  }
		  alert("Debe elejir un campo para\nordenar el resultado");
		  return false;
		}
		
	function verif_ficha(ficha) {
     var num = parseInt(ficha.value);
     if (isNaN(num)) {
       alert("La ficha debe ser un numero");
  	   ficha.focus();
  	   return false;
     }
	 else
	    ficha.value = num;
     return true;
  }
  function verif_duracion(ficha) {
     var num = parseInt(ficha.value);
     if (isNaN(num)) {
       alert("La duracion no es correcta");
  	   ficha.focus();
  	   return false;
     }
	 else
	    ficha.value = num;
     return true;
  }
 

  function verif_ape(apellido) {
    if (apellido.value != "")
	  return true;
	else {
	  alert("Ingrese el apellido");	  
	  return false;
	 }
  }

 function isDateValid( txtDD, txtMM, txtYYYY ) {
    var MinAnio = 1800 ;
	var MaxAnio = 2100 ;
   
	if ((!(isNumber(txtDD))) || (!( isNumber(txtMM))) || (!( isNumber(txtYYYY)))) return false ;
	if ((txtYYYY < MinAnio) || (txtYYYY > MaxAnio)) return false ;
    if ((txtMM < 1) || (txtMM > 12))  return false;
 
	if(isAnioBisiesto(txtYYYY))
           febrero=29;
       else
           febrero=28;
	if ((txtMM==2) && ((txtDD < 1) || ( txtDD > febrero ))) return false ;
    if (((txtMM==1) || (txtMM==3) || (txtMM==5) || (txtMM==7) || (txtMM==8) || (txtMM==10) || (txtMM==12))
	    && ((txtDD<1) || (txtDD>31))) return false ;
    if (((txtMM==4) || (txtMM==6) || (txtMM==9) || (txtMM==11)) && ((txtDD<1) || (txtDD>30))) return false ;

    return true ;
}

function verif_todo(){
     if (isNaN(document.f1.campo_duracion.value) || document.f1.campo_duracion.value == ""){
      //num="no";
      alert("Ingrese la duracion");
      return false;
                    }
	 else{
	   num="si"; 
		 }
if(document.f1.dia_d.disabled==false){
		if(isDateValid(document.f1.dia_d.value,document.f1.mes_d.value,document.f1.anio_d.value) 
		   &&isDateValid( document.f1.dia_h.value, document.f1.mes_h.value, document.f1.anio_h.value)&&num=="si") return true;
		 else alert("Verifique que los datos del formulario esten completos y sean correctos"); return false;
		                             }else return true; 
}   
					 
function verificar(dia, mes, anio, op) {
			if ( op ) {
 	        	var ch = document.getElementById(op);
			  	if (ch.checked == true) return true;
			}
		    if (isDateValid(dia.value, mes.value, anio.value)) {
				 return true;
			}
			else {
				alert("Ingrese una fecha Valida");
				return false;
			}
   }