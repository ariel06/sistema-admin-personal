  var hcount = 0;
  var hcampo1 = "ape_he";
  var hcampo2 = "nom_he";
  var hcampo3 = "sexo_he";
  var hcampo4 = "doc_he";
  var hcampo5 = "num_he";
  var hcampo6 = "nac_he";
  
  function hnodo_nac() {
	nac_list = document.createElement("select");
	nac_list.setAttribute("name", hcampo6+hcount);
	for(i=0; i<op_nac.length;i++) {
	  option = document.createElement("option");
	  texto = document.createTextNode(op_nac[i]);
	  option.appendChild(texto);
	  nac_list.appendChild(option);
	}
	return nac_list;
  }
  
  function hnodo_doc() {
	doc_list = document.createElement("select");
	doc_list.setAttribute("name", "doc_he"+hcount);
	for(i=0; i<op_doc.length;i++) {
	  option = document.createElement("option");
	  texto = document.createTextNode(op_doc[i]);
	  option.appendChild(texto);
	  doc_list.appendChild(option);
	}
	return doc_list;
  }

  function hborrar(id) {
    tbody = document.getElementById("tbody_he");
    //nodo = document.getElementsByTagName(id);
    tbody.removeChild(id);
	//tbody.removeChild(nodo);
    hcount--;
    
    //modifico los id para que vayan de 1 hasta hcount
   if (hcount>0) {
     array_tr = tbody.getElementsByTagName("tr");
     for(i=0; i<hcount;i++) {
      elem_tr = array_tr[i];
	  elem_tr.setAttribute("id", "hnodo_tr"+(i+1));

      tx = elem_tr.getElementsByTagName("input");
      tx[0].setAttribute("name", hcampo1+(i+1));
      tx[1].setAttribute("name", hcampo2+(i+1));
      tx[2].setAttribute("name", hcampo5+(i+1));
	  
	  tx = elem_tr.getElementsByTagName("select");
      tx[0].setAttribute("name", hcampo3+(i+1));
      tx[1].setAttribute("name", hcampo4+(i+1));
      tx[2].setAttribute("name", hcampo6+(i+1));
	  
      j = i+1;
      elem_tr.getElementsByTagName("a").item(0).setAttribute("href","javascript:hborrar("+"hnodo_tr"+j+")");
     }
    }
  }

  function hnuevo_nodo() {
    hcount ++;    
	td1 = document.createElement("td");
	td2 = document.createElement("td");
	td3 = document.createElement("td");	
	td4 = document.createElement("td");
	td5 = document.createElement("td");
	td6 = document.createElement("td");	
	td_borrar = document.createElement("td");	
	tr = document.createElement("tr");	
	
	ape_hijo = document.createElement("input");
	ape_hijo.setAttribute("type", "text");
	ape_hijo.setAttribute("size", "20");
	ape_hijo.setAttribute("name", hcampo1+hcount);
	td1.appendChild(ape_hijo);
	
	nom_hijo = document.createElement("input");
	nom_hijo.setAttribute("type", "text");
	nom_hijo.setAttribute("size", "20");
	nom_hijo.setAttribute("name", hcampo2+hcount);
	td2.appendChild(nom_hijo);
	
    sel = document.createElement("select");
	sel.setAttribute("name", hcampo3+hcount);
	td3.appendChild(sel);
	
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

	td4.appendChild(hnodo_doc());

    nro = document.createElement("input");
	nro.setAttribute("type", "text");
	nro.setAttribute("size", "10");
	nro.setAttribute("name", hcampo5+hcount);
	td5.appendChild(nro);	
	
	td6.appendChild(hnodo_nac());
	
	aref = document.createElement("a");
	aref.setAttribute("href", "javascript:hborrar("+"hnodo_tr"+hcount+")");
	imagen = document.createElement("img");
	imagen.setAttribute("border", "0");
	imagen.setAttribute("src", "papelera.jpg");
	aref.appendChild(imagen);
	td_borrar.appendChild(aref);

	tr.setAttribute("id", "hnodo_tr"+hcount);
	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);
	tr.appendChild(td4);
	tr.appendChild(td5);
	tr.appendChild(td6);
	tr.appendChild(td_borrar);
    
	return tr;
  }
  
  
  
  function hagregar() {
	tabla = document.getElementById("tbody_he");
    new_nodo =  hnuevo_nodo();
    tabla.appendChild(new_nodo);
  }