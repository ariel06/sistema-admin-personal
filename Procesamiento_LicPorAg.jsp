<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import ="funciones.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="bean.*" %>
<%@ page import ="util.*" %>


<%@ page import ="auxclases.*" %>
<%@ page import = "org.hibernate.exception.ConstraintViolationException" %>
<%@ page import = "org.hibernate.exception.GenericJDBCException" %>
<%@ page import = "org.hibernate.*" %>

<html>
<head>
<title>Licencia por agente</title>
 <link rel="STYLESHEET" type="text/css" href="reporte.css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<style type="text/css">
<!--
.Estilo2 {font-size: 18px}
-->
</style>
</head>

<body>

<p>
  <% 

ArrayList listaLicencias=new ArrayList();
String cementerio=request.getParameter("cem");
String textoficha=request.getParameter("campo_ficha");
String apellido=request.getParameter("campo_apellido");
String nombre=request.getParameter("campo_nombre");
%>



  <%
   
	
Ser_Inasistencias ina=new Ser_Inasistencias();
if(cementerio!=null){
	Cementerio cemr=new Cementerio();
	cemr.setCem_id(cementerio);
	session.setAttribute("CEMENTARY",cemr);
	}
	
String id_cemen=((Cementerio)session.getAttribute("CEMENTARY")).getCem_id();
Cementerio cem=ina.darCementerio(id_cemen);

if(request.getParameter("BotonFicha")!=null && request.getParameter("licencias").equals("todas")){
Integer numficha=new Integer(textoficha);
listaLicencias=ina.crearListaInasistencias(numficha.intValue(),cem);}
if(request.getParameter("BotonFicha")!=null && request.getParameter("licencias").equals("intervalo")){
Date f_desde=ina.fecha(request.getParameter("dia_d"),request.getParameter("mes_d"),request.getParameter("anio_d"));
Date f_hasta=ina.fecha(request.getParameter("dia_h"),request.getParameter("mes_h"),request.getParameter("anio_h"));

Integer numficha=new Integer(textoficha);
listaLicencias=ina.crearListaInasistencias(numficha.intValue(),f_desde,f_hasta,cem);
}
 
if(request.getParameter("BotonApelidoNombre")!=null && request.getParameter("licencias").equals("todas"))
listaLicencias=ina.crearListaInasistencias(apellido,nombre,cem);

if(request.getParameter("BotonApelidoNombre")!=null && request.getParameter("licencias").equals("intervalo")){

Date f_desde=ina.fecha(request.getParameter("dia_d"),request.getParameter("mes_d"),request.getParameter("anio_d"));
Date f_hasta=ina.fecha(request.getParameter("dia_h"),request.getParameter("mes_h"),request.getParameter("anio_h"));
listaLicencias=ina.crearListaInasistencias(apellido,nombre,f_desde,f_hasta,cem);

} 

%>
  <%
if(!listaLicencias.isEmpty()){
Licencia lic=(Licencia)listaLicencias.get(0);
%>  
<p class="unnamed1">
Licencias de <%=lic.getAgente().getApellido_paterno()%> <%=lic.getAgente().getNombres()%> 
</p>
<p  class="titulo1">Numero ficha: <%=lic.getAgente().getFicha()%>
</p>
<table class="estilotabla">
  <thead>
  <tr>
    <th width="144"  class="estilocelda">Fecha desde</td>
    <th width="154"  class="estilocelda">Fecha Hasta</td>
    <th width="84" class="estilocelda">Duracion</td>
    <th width="126" class="estilocelda">Con sueldo</td>
    <th width="209" class="estilocelda">Moti<span class="Estilo2"></span>vo</td>
    <th width="228" class="estilocelda">Observaciones</td>
  </tr>
  </thead>
  <tbody>
    
   	<%	
		Iterator ite=listaLicencias.iterator();
			while (ite.hasNext())
			{
				Licencia licencia=(Licencia)ite.next();
				
		%>
			<tr> 
				<td  class="td_reporte"><%=licencia.getFecha_desde()%></td>
				<td class="td_reporte"><%=licencia.getFecha_hasta()%></td>
				<td class="td_reporte"><%=licencia.getDuracion()%></td>		
				<td class="td_reporte"><%if(licencia.isCon_sueldo()==true){%>Verdadero<%}else{%>Falso<%}%></td>		
				<td class="td_reporte"><%=licencia.getMotivo().getDescripcion()%></td>		
				<td class="td_reporte"><%=licencia.getObservaciones()%></td>
			</tr>
			  <%}%>
  
 </tbody>
</table>

  <%

textoficha=null;
apellido=null;
nombre=null;
%>
  <%}else{%>

<p class="unnamed1">No se encuentra el agente o no tiene licencias en el intervalo indicado</p>

		<%}%>
		<% HibernateUtil.closeSession(); %>
		  <script> window.print() </script>
</p>
</body>
</html>