<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "java.util.*" %>
<%@ page import = "auxclases.*" %>
<%@ page import = "bean.*" %>
<%@ page import = "funciones.*" %>
<%@ page import = "util.*" %>
<%@ page import = "org.hibernate.*" %>
<%!

public void columna(String descrip, boolean visible) {
  if (!visible) return; 
  if (descrip != null) { %>
     <td class="td_reporte"><%=descrip%></td>
  <%} else {%>
	 <td class="td_reporte">&nbsp;&nbsp;</td>
  <%}%>
<%}%>


<html>
<head>
<link rel="STYLESHEET" type="text/css" href="reporte.css">
<link rel="STYLESHEET" type="text/css" href="tablas.css">
<script language="javascript" src="varios.js"> </script>
<title>Listado de datos de los agentes</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>

<body>
	
	<%
if (session.getAttribute("usuario")!=null) {
	String ficha = null;
	String apeynom = null;
	String orden = null;

	ficha = request.getParameter("ficha");
	apeynom = request.getParameter("apeynom");
	orden = request.getParameter("orden");
	Session sesion = HibernateUtil.currentSession();

	if (!(ficha == null && apeynom == null)) {
	  boolean ver_ficha = (ficha != null);
	  boolean ver_apeynom = (apeynom != null);
	  boolean ver_funcion = (request.getParameter("funcion") != null);
	  boolean ver_doc = (request.getParameter("documento") != null);
	  boolean ver_sexo = (request.getParameter("sexo") != null);
	  boolean ver_cuil = (request.getParameter("cuil") != null);
	  boolean ver_nac = (request.getParameter("nacionalidad") != null);
	  boolean ver_tel = (request.getParameter("tel") != null);
	  boolean ver_ecivil = (request.getParameter("est_civil") != null);
	  boolean ver_dom = (request.getParameter("domicilio") != null);
	  boolean ver_sueldo = (request.getParameter("sueldo") != null);
	  boolean ver_fechanac = (request.getParameter("fecha_nac") != null);
	  boolean ver_horario = (request.getParameter("horario") != null);
	  boolean ver_nivel = (request.getParameter("nivel") != null);
	  boolean ver_grado = (request.getParameter("grado") != null);

	  ListaPersonal lp = new ListaPersonal();
	  
	  if (orden.equals("apeynom"))
	   orden = "apellido_paterno asc, age.nombres asc";
	  else if (orden.equals("documento"))
	   orden = "tipo_doc.cod_tipo_documento asc, age.numero_doc asc";
      else if (orden.equals("nacimiento"))
       orden = "fecha_nacimiento asc"; 
      else if (orden.equals("nacionalidad"))
       orden = "nacionalidad.id_nacionalidad asc, age.ficha asc";
	  else if (orden.equals("sueldo"))
	   orden = "sueldo_bruto asc";
	  
	  List lista = lp.CrearListaPersonal(orden, request.getParameter("cem"));
	  Iterator it = lista.iterator();
	  String cementerio = request.getParameter("cem");
	  if (cementerio.equals("DG")) cementerio = "Direcci&oacute;n General";
	  else if (cementerio.equals("CH")) cementerio = "Chacarita";
	  	  else if (cementerio.equals("CR")) cementerio = "Crematorio";
		  	  else if (cementerio.equals("FL")) cementerio = "Flores";
			  	  else if (cementerio.equals("RE")) cementerio = "Recoleta";
	%>  
	  
	  <b>Listado de agentes - <%= cementerio %></b>
	  <div id='introduction_box-body' class='box-body'> 
		<table cellpadding="0">	
			<thead>
				<tr>
					<% if (ver_ficha)   { %>	<th class="th_reporte"> Ficha </th> <% } %>
					<% if (ver_apeynom) { %>	<th class="th_reporte"> Apellido y Nombre </th> <% } %>
					<% if (ver_nivel)   { %>	<th class="th_reporte"> Nivel </th> <% } %>
					<% if (ver_grado)   { %> 	<th class="th_reporte"> Grado </th> <% } %>
					<% if (ver_funcion) { %> 	<th class="th_reporte"> Funcion </th> <% } %>
					<% if (ver_doc)     { %> 	<th class="th_reporte"> Documento </th> <% } %>
					<% if (ver_cuil)    { %> 	<th class="th_reporte"> CUIL </th> <% } %>
					<% if (ver_tel)     { %> 	<th class="th_reporte"> Tel&eacute;fono </th> <% } %>
					<% if (ver_dom)     { %> 	<th class="th_reporte"> Domicilio </th> <% } %>
					<% if (ver_fechanac){ %> 	<th class="th_reporte"> Fecha Nacim. </th> <% } %>
					<% if (ver_sexo)    { %> 	<th class="th_reporte"> sexo </th> <% } %>
					<% if (ver_nac)     { %> 	<th class="th_reporte"> Nacionalidad </th> <% } %>
					<% if (ver_ecivil)  { %> 	<th class="th_reporte"> Estado Civil </th> <% } %>
					<% if (ver_sueldo)  { %> 	<th class="th_reporte"> Sueldo Bruto </th> <% } %>
					<% if (ver_horario) { %> 	<th class="th_reporte"> Horario </th> <% } %>					
				</tr>
			</thead>
			<tbody>
	  
	
	<%  
	  while(it.hasNext()) {
		Agente ag = (Agente) it.next();
       if(!ag.isInhabilitado()){
	%>
			  <tr>
			   		<% columna(ag.getFicha(), ver_ficha); %>
					<%
					String apeynom = ag.getApellido_paterno();
					if (apeynom != null && ag.getNombres()!=null ) {
					   apeynom.concat(" ");
					   apeynom.concat(ag.getNombres());
					}
					else if (apeynom == null ) {
					  apeynom = ag.getNombres();
					}
					
					 columna(apeynom, ver_apeynom);
					 columna(ag.getNivel(), ver_nivel); %>
					<% if (ver_grado)   { %> <td class="td_reporte">  <%= ag.getNivel() %> </td> <% } %>
					<% if (ag.getFuncion()!=null) {
					     columna(ag.getFuncion().getDescripcion(), ver_funcion);
					   }
					   else{
						columna(null, ver_funcion);
					}
					
					if (ag.getTipo_doc()!=null) {
	     				 String docum_ = ag.getTipo_doc();
						 if (ag.getNumero_doc()!=null) {
						   docum_.concat(" ");
						   docum_.concat(ag.getNumero_doc());
						 }
						 columna(docum_, ver_doc);
					   }
					   else {
						columna(null, ver_doc);
					}
					
					columna(ag.getCuil(), ver_cuil();
					columna(ag.getTelefono(), ver_tel);
					
					
					%>

							
					<% if (ver_dom) {
					    String domic = "&nbsp;";
						if (ag.getCalle()!=null)
						  domic = ag.getCalle();
						if (ag.getNumero_dom()!=null)
						  domic += (" "+ag.getNumero_dom());
						if (ag.getPiso() != null)
						  domic+=(" "+ag.getPiso());
						if (ag.getDepto()!=null)
						  domic +=(" "+ag.getDepto());
					%>
						<td class="td_reporte" style="text-aling: left">  <%= domic %> </td> <%}%>
					
					<% if (ver_fechanac)
					    if (ag.getFecha_nacimiento() != null) { %>
							<td class="td_reporte" style="text-aling: left">  <%= ag.getFecha_nacimiento() %> </td> <% } else {%>
							<td class="td_reporte" style="text-aling: left"> - </td> <% } %>
							
					<% if (ver_sexo) { %> <td class="td_reporte" style="text-aling: left">  <%= ag.getSexo() %> </td> <% } %>
					
					<% if (ver_nac)
					    if (ag.getNacionalidad() != null) { %>
							<td class="td_reporte" style="text-aling: left">  <%= ag.getNacionalidad().getDescripcion() %> </td> <% } else {%>
							<td class="td_reporte" style="text-aling: left">&nbsp;  </td> <% } %>

					<% if (ver_ecivil)
					    if (ag.getEstado_civil() != null) { %>
							<td class="td_reporte" style="text-aling: left">  <%= ag.getEstado_civil().getDesc_estado_civil() %> </td> <% } else {%>
							<td class="td_reporte" style="text-aling: left">&nbsp;  </td> <% } %>

					<% if (ver_sueldo)
					    if (ag.getSueldo_bruto() != 0.0) { %>
							<td class="td_reporte" style="text-aling: left">
							   <%="$  "+ag.getSueldo_bruto() %> </td> 
					    <% } else {%>
							<td class="td_reporte" style="text-aling: left">&nbsp;</td>
						<% } %>
							
					<% if (ver_horario) { %>
						<td class="td_reporte" style="text-aling: left"> <%= (ag.getHora_desde()+" a "+ag.getHora_hasta())%> </td> <% } %>
			  </tr>
    <%
    }//fin if inhabilitado
	  } // end while
	%>
	 
	
	<% } 
	
	  else {
	 
	%>
	
<%@include file="menu.jsp"	%>
<br />
<div align="center"><br>
	<form id="form1" method="post" target="_blank" onSubmit="return check_ordenar(orden)" class="form">
	  Datos a incluir en el listado 
	  <table width="450" class="tabla">
  		<tr>
		    <td><input type="checkbox" name="ficha" checked onClick="this.checked = true;"> Ficha </td>
		    <td><input type="checkbox" name="documento" onClick="cambiar_estado('cdoc', documento)"> Tipo/Nro documento</td>
		    <td><input type="checkbox" name="sexo"> Sexo </td>
	  </tr>
	  <tr>
    		<td><input type="checkbox" name="apeynom" checked onClick="this.checked = true;"> Apellido y Nombre </td>
		    <td><input type="checkbox" name="cuil" onClick="cambiar_estado('ccuil', cuil)"> CUIL </td>
		    <td><input type="checkbox" name="nacionalidad" onClick="cambiar_estado('cnacion', nacionalidad)"> Nacionalidad </td>
	  </tr>
	  <tr>
		    <td><input type="checkbox" name="nivel"> Nivel </td>
		    <td><input type="checkbox" name="tel"> Tel&eacute;fono </td>
		    <td><input type="checkbox" name="est_civil"> Estado Civil </td>
	  </tr>
	  <tr>
		    <td><input type="checkbox" name="grado"> Grado </td>
		    <td><input type="checkbox" name="domicilio"> Domicilio </td>
		    <td><input type="checkbox" name="sueldo" onClick="cambiar_estado('csueldo', sueldo)"> Sueldo Bruto </td>
	  </tr>
	  <tr>
		    <td><input type="checkbox" name="funcion"> Funcion </td>
		    <td><input type="checkbox" name="fecha_nac" onClick="cambiar_estado('cnacim', fecha_nac)"> Fecha Nacimiento </td>
		    <td><input type="checkbox" name="horario"> Horario de trabajo </td>
	  </tr>	  
	</table>
		<br>

    Ordenar por:
	<table width="450" class="tabla">	
 		 <tr>
		   <td><input id="cficha" type="radio" name="orden" value="ficha" checked></td>
		   <td>Ficha</td>
		   <td><input id="ccuil" type="radio" name="orden" value="cuil" disabled></td>
		   <td>CUIL</td>
		   <td><input id="cnacion" type="radio" name="orden" value="nacionalidad" disabled></td>
		   <td>Nacionalidad</td>		   
   		 </tr>
		 <tr>
		   <td><input id="capeyn" type="radio" name="orden" value="apeynom"></td>
		   <td>Apellido y nombre</td>
		   <td><input id="cnacim" type="radio" name="orden" value="nacimiento" disabled></td>
		   <td>Fecha de Nacimiento</td>
   		   <td><input id="csueldo" type="radio" name="orden" value="sueldo" disabled></td>
		   <td>Sueldo Bruto</td>
		 </tr>
		 <tr>
		   <td><input id="cdoc" type="radio" name="orden" value="documento" disabled></td>
		   <td>Tipo/Nro Documento</td>
		 </tr>
	</table>
	<div align="left">
	<%@include file = "include/combo_cementerio.jsp" %>
    </div>
	<div align="right">
	 <input name="submit" type="submit" value="Generar" />
	 </div>
	</form>
</div>	
	<%
	}
	HibernateUtil.closeSession();
 } else { %>
 	 <h1>No tiene permiso para acceder a esta p&aacute;gina</h1>
 <% }
	%>
</body>
</html>
