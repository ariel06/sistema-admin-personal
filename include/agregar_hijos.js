  var count = 0;
  var base = 0;
  var campo1 = "ape_hijo";
  var campo2 = "nom_hijo";
  var campo3 = "dia_hijo";
  var campo4 = "mes_hijo";
  var campo5 = "anio_hijo";
  
 
  function vtabla_hijos() {
	for(i=0; i<cant_hijos; i++) {
	  	
		
		
	}
  }
  
  
  function habilitar(ini, fin) {
	f = document.getElementById("form1");
    for(i=ini;i<=fin;i++)
	   f.elements[i].disabled=false;
  }
  
  function deshabilitar(ini, fin) {
    f = document.getElementById("form1");
	for(i=ini;i<=46;i++) {
	   f.elements[i].disabled=true;
	   f.elements[i].checked=false;
	}
  }
  
  function cambiar(c, ini, fin) {
	if (c.checked == true)
	  habilitar(ini, fin);
	else
	  deshabilitar(ini, fin);
  }
  
  function nodo_nac() {
	nac_list = document.createElement("select");
	nac_list.setAttribute("name", "nac_hijo"+count);
	for(i=0; i<op_nac.length;i++) {
	  option = document.createElement("option");
	  texto = document.createTextNode(op_nac[i]);
	  option.appendChild(texto);
	  nac_list.appendChild(option);
	}
	return nac_list;
  }
  
  function nodo_doc() {
	doc_list = document.createElement("select");
	doc_list.setAttribute("name", "doc_hijo"+count);
	for(i=0; i<op_doc.length;i++) {
	  option = document.createElement("option");
	  texto = document.createTextNode(op_doc[i]);
	  option.appendChild(texto);
	  doc_list.appendChild(option);		
	}
	return doc_list;
  }

  function borrar(id) {
    tbody = document.getElementById("tbody_hijos");
    nodo = document.getElementsByTagName(id);
    tbody.removeChild(id);
    count--;
    
    //modifico los id para que vayan de 1 hasta count
   if (count>0) {
     array_tr = tbody.getElementsByTagName("tr");
     for(i=0; i<count;i++) {
      elem_tr = array_tr[i];
	  elem_tr.setAttribute("id", "nodo_tr"+(i+1));

      tx = elem_tr.getElementsByTagName("input");
      tx[0].setAttribute("name", campo1+(i+1));
      tx[1].setAttribute("name", campo2+(i+1));
      tx[2].setAttribute("name", campo3+(i+1));
      tx[3].setAttribute("name", campo4+(i+1));	  
      tx[4].setAttribute("name", campo5+(i+1));
	  tx[5].setAttribute("name", "nro_hdoc"+(i+1));
	  
	  tx = elem_tr.getElementsByTagName("select");
      tx[0].setAttribute("name", "sexo_hijo"+(i+1));
      tx[1].setAttribute("name", "doc_hijo"+(i+1));
      tx[2].setAttribute("name", "nac_hijo"+(i+1));
	  
      j = i+1;
      elem_tr.getElementsByTagName("a").item(0).setAttribute("href","javascript:borrar("+"nodo_tr"+j+")");
     }
    }
  }

  function nuevo_nodo() {
    count ++;    
	td1 = document.createElement("td");
	td2 = document.createElement("td");
	td3 = document.createElement("td");	
	td4 = document.createElement("td");
	td5 = document.createElement("td");
	td6 = document.createElement("td");	
	td7 = document.createElement("td");	
	td_borrar = document.createElement("td");	
	tr = document.createElement("tr");	
	
	ape_hijo = document.createElement("input");
	ape_hijo.setAttribute("type", "text");
	ape_hijo.setAttribute("size", "20");
	ape_hijo.setAttribute("name", campo1+count);
	td1.appendChild(ape_hijo);
	
	nom_hijo = document.createElement("input");
	nom_hijo.setAttribute("type", "text");
	nom_hijo.setAttribute("size", "20");
	nom_hijo.setAttribute("name", campo2+count);
	td2.appendChild(nom_hijo);
	
	dia_hijo = document.createElement("input");
	dia_hijo.setAttribute("type", "text");
	dia_hijo.setAttribute("size", "2");
	dia_hijo.setAttribute("maxlength", "2");
	dia_hijo.setAttribute("name", campo3+count);
	td3.appendChild(dia_hijo);	

    mes_hijo = document.createElement("input");
	mes_hijo.setAttribute("type", "text");
	mes_hijo.setAttribute("size", "2");
	mes_hijo.setAttribute("maxlength", "2");
	mes_hijo.setAttribute("name", campo4+count);
	td3.appendChild(mes_hijo);
	
    anio_hijo = document.createElement("input");
	anio_hijo.setAttribute("type", "text");
	anio_hijo.setAttribute("size", "4");
	anio_hijo.setAttribute("maxlength", "4");
	anio_hijo.setAttribute("name", campo5+count);
	td3.appendChild(anio_hijo);
	

    sel = document.createElement("select");
	sel.setAttribute("name", "sexo_hijo"+count);
	td4.appendChild(sel);
	
	op1 = document.createElement("option");
	val1 = document.createTextNode(" ");
	op1.appendChild(val1);
	sel.appendChild(op1);
	
	op2 = document.createElement("option");
	val2 = document.createTextNode("M");
	op2.appendChild(val2);
	sel.appendChild(op2);
	
	op3 = document.createElement("option");
	val3 = document.createTextNode("F");
	op3.appendChild(val3);
	sel.appendChild(op3);

	td5.appendChild(nodo_doc());

    nro = document.createElement("input");
	nro.setAttribute("type", "text");
	nro.setAttribute("size", "10");
	nro.setAttribute("name", "nro_hdoc"+count);
	td6.appendChild(nro);	
	
	td7.appendChild(nodo_nac());
	
	aref = document.createElement("a");
	aref.setAttribute("href", "javascript:borrar("+"nodo_tr"+count+")");
	imagen = document.createElement("img");
	imagen.setAttribute("border", "0");
	imagen.setAttribute("src", "papelera.jpg");
	aref.appendChild(imagen);
	td_borrar.appendChild(aref);

	tr.setAttribute("id", "nodo_tr"+count);
	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);
	tr.appendChild(td4);
	tr.appendChild(td5);
	tr.appendChild(td6);
	tr.appendChild(td7);	
	tr.appendChild(td_borrar);		
    
	return tr;
  }
  
  
  
  function agregar() {
	tabla = document.getElementById("tbody_hijos");
    new_nodo =  nuevo_nodo();
    tabla.appendChild(new_nodo);
  }