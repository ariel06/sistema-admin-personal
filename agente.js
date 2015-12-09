// JavaScript Document
	
   
   function isDateValid( txtDD, txtMM, txtYYYY ) {
      var MinAnio = 1800 ;
	  var MaxAnio = 2100 ;
  	  if (((isNaN(txtDD))) || (( isNaN(txtMM))) || (( isNaN(txtYYYY))))
	    return false ;
	  if ((txtYYYY < MinAnio) || (txtYYYY > MaxAnio)) 
	    return false ;
      if ((txtMM < 1) || (txtMM > 12))
	    return false;
	  //if(isAnioBisiesto(txtYYYY))
           febrero=29;
      //else
          // febrero=28;
	  if ((txtMM==2) && ((txtDD < 1) || ( txtDD > febrero )))
	    return false;
      if (((txtMM==1) || (txtMM==3) || (txtMM==5) || (txtMM==7) || (txtMM==8) || (txtMM==10) || (txtMM==12)) 
		 && ((txtDD<1) || (txtDD>31))) 
	    return false;
      if (((txtMM==4) || (txtMM==6) || (txtMM==9) || (txtMM==11)) && ((txtDD<1) || (txtDD>30)))
	    return false;
      return true;
   }
	
   function verif_formulario(formag) {
		if (isNaN(formag.elements[0].value)) {
		  alert("Debe especificar un numero de ficha");
		  return false;
		}
		if (formag.elements[1].value.toString().length == 0) {
		  alert("Debe ingresar el apellido");
		  return false;		
		}
		if (formag.elements[3].value.toString().length == 0) {
		  alert("Debe ingresar el nombre");
		  return false;		
		}
		if(formag.elements[4].checked==false && formag.elements[5].checked==false) {
		  alert("Debe seleccionar el sexo");
		  return false;
		}
		if(formag.elements[6].value.toString().length>0 || 
		   formag.elements[7].value.toString().length>0 ||
		   formag.elements[8].value.toString().length>0)
		  if(isDateValid(formag.elements[6].value, formag.elements[7].value, formag.elements[8].value)==false) {
		    alert("Debe ingresar la fecha de\nnacimiento correctamente");
		    return false;
		  }
		if (formag.elements[16].value.toString().length>0)
		  if (isNaN(formag.elements[16].value)) {
			alert("El grado es un numero");
			return false;
		  }
		if (formag.elements[18].value.toString().length>0 || 
			formag.elements[19].value.toString().length>0 || 
			formag.elements[20].value.toString().length>0 )
		   if(isDateValid(formag.elements[18].value, formag.elements[19].value, formag.elements[20].value)==false) {
			   alert("Ingrese correctamente la\nfecha de ingreso a GCBA");
			   return false;
		   }
		   
		if (formag.elements[21].value.toString().length>0 || 
			formag.elements[22].value.toString().length>0 || 
			formag.elements[23].value.toString().length>0 )
		   if(isDateValid(formag.elements[21].value, formag.elements[22].value, formag.elements[23].value)==false) {
			   alert("Ingrese correctamente la\nfecha de ingreso a DGCEM");
			   return false;
		   }

		//chequeo a fecha de casamiento
		if ((formag.elements[33].value.toString().length>0 || 
			formag.elements[34].value.toString().length>0 || 
			formag.elements[35].value.toString().length>0) && formag.elements[31].checked==true)
		   if(isDateValid(formag.elements[33].value, formag.elements[34].value, formag.elements[35].value)==false) {
			   alert("Ingrese correctamente la\nfecha de casamiento");
			   return false;
		   }
        //Chequeo la fecha de nacimiento del conyuge
		if ((formag.elements[39].value.toString().length>0 || 
			formag.elements[40].value.toString().length>0 || 
			formag.elements[41].value.toString().length>0) && formag.elements[31].checked==true)
		   if(isDateValid(formag.elements[39].value, formag.elements[40].value, formag.elements[41].value)==false) {
			   alert("Ingrese correctamente la fecha\nde nacimiento del conyuge");
			   return false;
		   }
		//chequeo la fecha "Trabaja desde" del conyuge
		if ((formag.elements[44].value.toString().length>0 || 
			formag.elements[45].value.toString().length>0 || 
			formag.elements[46].value.toString().length>0) 
			&& formag.elements[42].checked==true && formag.elements[31].checked==true)
		   if(isDateValid(formag.elements[44].value, formag.elements[45].value, formag.elements[46].value)==false) {
			   alert("Ingrese correctamente la fecha\n \"Trabaja desde\" del conyuge");
			   return false;
		   }
	}