<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import ="funciones.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "util.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="bean.*" %>
<%@ page import ="auxclases.*" %>
<%@ page import ="view.*" %>
<%@ page import = "org.hibernate.exception.ConstraintViolationException" %>
<%@ page import = "org.hibernate.exception.GenericJDBCException" %>
<%@ page import = "org.hibernate.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Licencias por Agente</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<SCRIPT LANGUAGE="JavaScript">
<!--
function dentro(origen,Color) {
if (!origen.contains(event.fromElement)) {
// origen.style.cursor = 'hand';
origen.bgColor = Color;}}
function salir(origen,Color2) {
if (!origen.contains(event.toElement)) {
origen.style.cursor = 'default';
origen.bgColor = Color2;}}
function hacer_click(origen) {
if(event.srcElement.tagName=='TR'){
origen.children.tags('A')[0].click();}}
// -->
</SCRIPT>
</head>

<body>
<%@include file="header.jsp"%>

<%
String cementerio = request.getParameter("cem");
String nombre = request.getParameter("nom");
String apellido = request.getParameter("ape");
if (apellido == null && nombre == null) {
%>  

Error parametros

<%
} 
else {
	if (nombre == null) nombre ="";
	if (apellido == null) apellido ="";
	
	Session sesion = HibernateUtil.currentSession();
    String titulo = "Resultado de la busqueda";
	  
	Paginacion tabla = new Paginacion();

	tabla.setStrTitulo_Rejilla(titulo);
	  
	tabla.setQue_pagina("resultado_agentes.jsp");
    String pag = request.getParameter("pagina");
    try {
	  int num = Integer.parseInt(pag);
	  tabla.setPagina(num);
  	}
	catch (Exception e) {tabla.setPagina(1);}

 	tabla.setClase("Agente as ag");
	tabla.setClave("ag.ficha");
	tabla.setStrWhere("where upper(ag.apellido_paterno) like upper('%"+apellido+"%')"+" and upper(ag.nombres) like upper('%"+nombre+"%')");
	if (cementerio!=null)
		tabla.setStrWhere(tabla.getStrWhere()+" and ag.cementerio.cem_id = '"+cementerio+"'");
	tabla.setStrOrderBy("order by ag.ficha desc");
	tabla.setOtros_parametros("ape="+apellido+"&nom="+nombre);
	if (cementerio!=null)
		tabla.setOtros_parametros(tabla.getOtros_parametros()+"&cem="+cementerio);
	tabla.setRegistros(17);
	
	    String[] array_nombres_campos = new String[3];
	    array_nombres_campos[0] = "ficha";
	    array_nombres_campos[1] = "apellido_paterno";
	    array_nombres_campos[2] = "nombres";
	    tabla.setNombresCampos(array_nombres_campos);
	
	    String[] array_titulos_campos= new String[3];
	    array_titulos_campos[0] = "Ficha";
	    array_titulos_campos[1] = "Nombre";
	    array_titulos_campos[2] = "Apellido";
	    tabla.setTitulosCampos(array_titulos_campos);
	
	    tabla.setEnlace("licencias_agente.jsp");
	    String param[] = new String[1];
	    param[0] = "ficha";
	    tabla.setCamposParametros(param);
	    
	    String nom[] = new String[1];
	    nom[0] = "ficha";
	    tabla.setNombresParametros(nom);
	
	    tabla.setStrAnchoTabla("100%");
  
%>
   <%= tabla.Mostrar_Registros() %>
<% }
%>
<%@include file="footer.jsp"%>
</body>
</html>