<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page import="view.*" %>
<%@ page import="util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Tabla licencias</title>
</head>
<body>

<%
Paginacion tabla = new Paginacion();

tabla.setQue_pagina("test.jsp");
String pag = request.getParameter("pagina");
try {
	int num = Integer.parseInt(pag);
	tabla.setPagina(num);
}
catch (Exception e) {tabla.setPagina(1);}

tabla.setClase("Licencia");
tabla.setClave("ficha");
tabla.setStrWhere("where ficha = 197780");
tabla.setStrOrderBy("order by fecha_desde desc");
tabla.setRegistros(3);

String[] array_nombres_campos = new String[6];
array_nombres_campos[0] = "fecha_desde";
array_nombres_campos[1] = "fecha_hasta";
array_nombres_campos[2] = "duracion";
array_nombres_campos[3] = "con_sueldo";
array_nombres_campos[4] = "motivo.descripcion";
array_nombres_campos[5] = "observaciones";
tabla.setNombresCampos(array_nombres_campos);

String[] array_titulos_campos= new String[6];
array_titulos_campos[0] = "Desde";
array_titulos_campos[1] = "Hasta";
array_titulos_campos[2] = "Duracion";
array_titulos_campos[3] = "Con Sueldo";
array_titulos_campos[4] = "Motivo";
array_titulos_campos[5] = "Observaciones";
tabla.setTitulosCampos(array_titulos_campos);

String nombre_parametros[] =  new String[2];
nombre_parametros[0] = "ficha";
nombre_parametros[1] = "id";
tabla.setNombresParametros(nombre_parametros);

String campos_parametros[] =  new String[2];
campos_parametros[0] = "ficha";
campos_parametros[1] = "id";
tabla.setCamposParametros(campos_parametros);

tabla.setEnlace("test.jsp");

tabla.setStrAnchoTabla("90%");

tabla.setStrTitulo_Rejilla("Licencias e inasistencias");

%>

<%=tabla.Mostrar_Registros()%>

<% HibernateUtil.closeSession(); %>
</body>
</html>