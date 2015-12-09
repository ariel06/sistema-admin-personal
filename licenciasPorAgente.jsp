<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import ="auxclases.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Licencias por Agente</title>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<script language="javascript" src="varios.js"></script>
<script language="javascript">

  <% if (request.getParameter("cem")!=null) {%>
    var	parametro="&cem=<%=request.getParameter("cem")%>";
  <% } else { %>
	var	parametro = "";
  <% } %>
  
  function licencias() {
    url = "licencias_agente.jsp?ficha="+document.forms[0].elements[0].value;
  
    window.open( url+parametro, "Licencias", "height=750 menubar=false width=750", false);
  }
  
  function agentes() {
    /*nombres = */
    url = "resultado_agentes.jsp?ape="+document.forms[1].elements[0].value+"&nom="+document.forms[1].elements[1].value;
      
    window.open( url+parametro, "Licencias", "height=750 menubar=false width=750", false);
  }

  function esNumero(num) {
    if (isNaN(num)) {
	  alert("Ingrese el numero de ficha correctamente");
	  return false;
	}
	var num_ficha = parseInt(num);
	if (isNaN(num_ficha)) {
	  alert("Ingrese el numero de ficha correctamente");
	  return false;
	}
	else
	  return true;
  }
  
  function chequear_form2(form2) {
    if (document.forms[0].elements[0].value == "" && forms[0].elements[0].value == "")
      return false;
	return true;
  }

</script>


<body>
<%  if (session.getAttribute("usuario") != null) {%>
<%@include file="menu.jsp"%>

	<div style="position:relative; left:30%;top:10%; right:30%; width:450px; z-index:0;">
	  <b>Licencias de los agentes</b>
	  <form action="javascript:licencias()" onsubmit="return esNumero(this.ficha.value)">
		 <input type="text" size="15" name="ficha" />
		 <input type="submit" value="Buscar por ficha" />
	  </form>
	  
	  <form action="javascript:agentes()" > <!-- onsubmit="return chequear_form2(this)"-->
		<input type="text" name="ape" size="15"/>
		<input type="text" name="nom" size="15"/>
		<input type="submit" value="Buscar por nombre"/>
	  </form>
	</div>
	<% } %>
</body>
</html>