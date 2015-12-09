<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Agregar agente</title>

<%@ page import = "bean.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "util.*" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "auxclases.*" %>
<%@ page import = "persistencia.*" %>
<%@ page import = "org.hibernate.*" %>

<script src="varios.js"></script>
<script src="agente.js"></script>
<script src="include/agregar_hijos.js"></script>
<script src="include/agregar_hermanos.js"></script>
<style>

  .cuadro 
  		{
		border-top: 2px solid #000000;  border-bottom:2px solid #000000;
		border-left: 2px solid #000000; border-right:2px solid #000000;
		}
</style>

</head>
<%@include file="header.jsp" %>
<body>
<%
if (session.getAttribute("usuario")!=null) {
%>   
   <%@include file="menu.jsp" %>
<%
	boolean modificacion = false;
	Session sesion = HibernateUtil.currentSession();
	Agente ag = null;
	if (request.getParameter("ficha")!=null) {
	   ag = new Agente();
	   Persistente per = new Persistente();
	   boolean guardado = per.save(request, ag, false);
	   if (!guardado) {
%>
			<div style="padding-top:2cm"></div>
			<table align="center" style="background:#CCCCCC" class="cuadro">
			  <tr>
				<td>Ya existe un agente con el numero de ficha especificada</td>
			 </tr>
			 <tr>
				<td style="border-top:2px solid #000000; padding-top:0.5cm" align="center">
					<form action="agregar_agente.jsp" method="get">
						<%if (request.getParameter("cem")!=null) { %>
		    				<input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
						<%}%>
					  <input type="submit" value="Volver"/>
					</form>
				</td>
			 </tr>
			</table>
			
<%
	  }
	  else {
%>
	    <div style="padding-top:2cm"></div>
		<table align="center" style="background:#CCCCCC" class="cuadro">
  			<tr>
			    <td>Los Datos se guardaron correctamente</td>
 			 </tr>
			 <tr>
			    <td style="border-top:2px solid #000000; padding-top:0.5cm" align="center">
					<form action="agregar_agente.jsp" method="get">
				  		<%if (request.getParameter("cem")!=null) { %>
		    				<input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
						<%}%>
					  <input type="submit" value="Volver"/>
					</form>
				</td>
			 </tr>
		</table>
<%
	} // if guardado

	} 
	else { // ficha == null
		List doc = sesion.createQuery("from TipoDocumento as td order by td.cod_tipo_documento").list();
		List nac = sesion.createQuery("from Nacionalidad as nc order by nc.descripcion").list();
		List ec = sesion.createQuery("from EstadoCivil ec order by ec.desc_estado_civil").list();
		List fn = sesion.createQuery("from Funcion fn order by fn.descripcion").list();
		List cem = sesion.createQuery("from Cementerio cm order by cm.descripcion").list();
%>
	
	<script>
	var op_nac = new Array("  ",<%Iterator opciones = nac.iterator();while(opciones.hasNext()){Nacionalidad n = (Nacionalidad) 	opciones.next();%><%="\""+n.getDescripcion()+"\""%><% if (opciones.hasNext()) %><%= "," %><%}%><%=");"%>
				
	var op_doc = new Array(" ",<%Iterator documentos = doc.iterator();while(documentos.hasNext()){TipoDocumento d = (TipoDocumento) documentos.next();%><%="\""+d.getDesc_tipo_documento()+"\""%><% if (documentos.hasNext()) %><%= "," %><%}%><%=");"%>
	</script>

	<b>Agregar agente:</b>
	<form id="form1" action="agregar_agente.jsp" method="post" onsubmit="return verif_formulario(this)">
		<div style="border-bottom:1px solid #000; border-top:1px solid #000; width:965px;
	            border-left:1px solid #000; border-right:1px solid #000; padding-left:0.3cm; padding-top:0.3cm;
				padding-bottom:0.3cm" >
	Ficha <input type="text" name="ficha" size="15" maxlength="15"/>
	<div>
	  <br />
	  <b>Datos Personales</b>

	<table>
  	   <tr>
    	<td valign="top"> <!-- Primer columna -->
			<%@include file="include\datos_agente.jsp" %>
		</td>
    	
		<td valign="top">
			<%@include file="include\datos_dgcem.jsp" %>
		</td>
		
		<td valign="top">
			<%@include file="include\datos_conyuge.jsp" %>
			<script> deshabilitar(32,46) </script>
		</td>
		
  	   </tr>
	</table>
    </div>
	
	<%@include file="include\datos_domicilio.jsp" %>

    <br />
	<%@include file="include\hijos.jsp" %>
    <br /><br />
	<%@include file="include\hermanos.jsp" %>
	</div>
	<div align="right">
		<%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		<%}%>
	<input type="button" value="Cancelar" onclick="javascript:cancelar()" ><input type="submit" value="Aceptar"  /></div>
</form>

	
<%
  }
  HibernateUtil.closeSession();
}
else { 
%>
	<%@include file="include/caducado.jsp" %>
<%
}
%>
</body>
<%@include file="footer.jsp" %>
</html>