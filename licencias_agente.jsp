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
String ficha = request.getParameter("ficha");
boolean existe_agente = true;
if (ficha == null) {
%>  

Error parametros

<%
} 
else {
	Session sesion = HibernateUtil.currentSession();
    Agente ag = new Agente();
	 try {
      sesion.load(ag, new Integer(request.getParameter("ficha")));
	  if ((ag.getCementerio()==null && request.getParameter("cem")!=null) ||
		      (request.getParameter("cem")!=null && !ag.getCementerio().getCem_id().equals(request.getParameter("cem")))) {
		     ObjectNotFoundException ex = new ObjectNotFoundException(request.getParameter("bficha"), "Agente");
			 throw ex;
	   }
	 }
	 catch (ObjectNotFoundException e) {
	  existe_agente = false;
%>
	    <div style="padding-top:2cm"> 
		</div>
			 <table align="center" style="background:#CCCCCC" class="cuadro">
			  <tr>
				<td>No existe ning&uacute;n agente con el numero de ficha especifidaca</td>
			 </tr>
			 <tr>
				<td style="border-top:2px solid #000000; padding-top:0.5cm" align="center">
					<form action="modificar_agente.jsp" method="get">
					  <input type="button" value="Aceptar" onClick="javascript:window.close()"/>
					</form>
				</td>
			 </tr>
			</table>
<%  // Muestro mensaje de agente no encontrado
	 } // catch
	
	 if (existe_agente)  {
  	   String titulo = "Licencias e inasistencias de "+
	  			ag.getApellido_paterno()+" "+ag.getNombres()+" ("+ag.getFicha()+")";
	  
	    Paginacion tabla = new Paginacion();

	    tabla.setStrTitulo_Rejilla(titulo);
	  
	    tabla.setQue_pagina("licencias_agente.jsp");
	    String pag = request.getParameter("pagina");
  	    try {
		  int num = Integer.parseInt(pag);
		  tabla.setPagina(num);
  	    }
	    catch (Exception e) {tabla.setPagina(1);}

 	    tabla.setClase("Licencia");
	    tabla.setClave("ficha");
	    tabla.setStrWhere("where ficha ="+ficha);
	    tabla.setStrOrderBy("order by fecha_desde desc");
	    tabla.setOtros_parametros("ficha="+ficha);
	    tabla.setRegistros(10);
	
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
	
	    //tabla.setEnlace("licenciasPorAgente2.jsp");
	
	    tabla.setStrAnchoTabla("100%");
  
%>	
   <%= tabla.Mostrar_Registros() %>
<% }
}
%>
<%@include file="footer.jsp"%>
</body>
</html>