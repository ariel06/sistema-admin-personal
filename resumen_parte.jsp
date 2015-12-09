<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "java.util.*" %>
<%@ page import = "auxclases.*" %>
<%@ page import = "bean.*" %>
<%@ page import = "util.*" %>
<%@ page import = "funciones.*" %>
<%@ page import = "org.hibernate.*" %>
<%@ page import = "persistencia.*" %>    

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Resumen de Parte Diario</title>

    <link rel="STYLESHEET" type="text/css" href="reporte.css">
	<link rel="STYLESHEET" type="text/css" href="css/tablas.css">
	<script language="javascript" src="varios.js"> </script>
</head>
<style>
  .separador {
		border-bottom:1px solid #333333
  }
 
</style>

<%@include file="header.jsp" %>
<body>
	<% 
    if (session.getAttribute("usuario")!=null) {
	   String dia = null;
	   String mes = null;
	   String anio = null;
	   Session sesion = HibernateUtil.currentSession();
	   String opcion = request.getParameter("fecha");

	   if (opcion != null) { //Genero el parte diario
		 if (opcion.equals("hoy")) {
	        Date d = new Date();
		    GregorianCalendar gc = new GregorianCalendar();
  		    gc.setTime(d);
		    dia =  new Integer(gc.get(Calendar.DAY_OF_MONTH)).toString();
		    mes = new Integer(gc.get(Calendar.MONTH)+1).toString();
		    anio = new Integer(gc.get(Calendar.YEAR)).toString();
		    if (gc.get(Calendar.DAY_OF_MONTH) <10)
			  dia = "0"+dia;
			if (gc.get(Calendar.MONTH) < 10)
		      mes = "0" + mes;
	     }
		 else {
		   dia = request.getParameter("dia");
		   if (dia.length() == 1)
		     dia = "0" + dia;
   	   	   mes = request.getParameter("mes");
		   if (mes.length() == 1)
		     mes = "0"+mes;
       	   anio = request.getParameter("anio");		 
		 }
		 Persistente p = new Persistente();
		 Cementerio c = (Cementerio) p.getObjectByField("Cementerio", "cem_id", request.getParameter("cem"));
 		 boolean guardia = (request.getParameter("guardia")!=null);
		 boolean empleo_publico = (request.getParameter("epublico")!=null);
	   
	%>
	   <div class="titulo">
	     Resumen de Parte diario - <%=dia%>/<%=mes%>/<%=anio%> - Direcci&oacute;n General de Cementerios - <% if (c!=null) {%> <%= c.getDescripcion() %> <%}else{%>Dgcem - <%} if(empleo_publico){%>Empleo p&uacute;blico<%}%>
	   </div>
	   <div id='introduction_box-body' class='box-body'>
	<% 
		 ParteDiario pd = new ParteDiario();
		 String cem_param = request.getParameter("cem");
		 if (cem_param.equals("TD")) cem_param = null;
		 List lpd = pd.ResumenParteDiario(anio+"-"+mes+"-"+dia, guardia, empleo_publico, cem_param);
		 if (lpd.size() == 0) { %>
		   <div>
		     <br />
		     <b>No se han encontrado licencias o inasistencias para el d&iacute;a <%=dia+"-"+mes+"-"+anio%></b>
		   </div>
		   <%
		 } 
		 Iterator it = lpd.iterator();
		 int cod_categoria = -1;
		 while(it.hasNext()) {
		   Object res[] = (Object[]) it.next();
		   MotivoLicencia mot = (MotivoLicencia) res[0];
		   Integer cant = (Integer) res[1];
		 %>

			<div id='introduction_box-header' class='box-header'>
          	  <span id='introduction_box-header-title' class='box-header-title'>
			  	<%=mot.getDescripcion()%>
          	  </span>
      		</div>
	
		   <div id='introduction_box-body' class='box-body'> 
			<table>
				  <tr>
					  <td>Cantidad: </td>
					  <td class="th_reporte"><%=cant.intValue()%></td>
				  </tr>
			</table>
	<%
	     } // fin del while
	%>
	  </div>
	  <script> window.print() </script>
	<%
	   } // fin generar resumen parte diario
	   else { //Muestro el formulario
	
	%>
	    <%@include file="menu.jsp" %>
		<div align="center" style="position: relative; top:10%">
	     <form id="form1" action="resumen_parte.jsp" target="_blank" method="get" onSubmit="return verificar(dia,mes,anio,'ch1')">
			 <b>Resumen de Parte Diario:</b>	
			  <table class="tabla">
				<tr>
				  <td align="left">Fecha:</td>
				  <td>&nbsp;</td>
				</tr>
				<tr>
				  <td align="left">Hoy</td>
                  <td> 
				    <input id="ch1" type="radio" name="fecha" value="hoy" checked="checked" onClick="deshabilitar(dia,mes,anio)"/>					                  </td>
				</tr>
				<tr>
				   <td align="left">Otra</td>
				   <td><input type="radio" name="fecha" value="otra" onClick="habilitar(dia, mes, anio)"/></td>
				   <td><input type="text" name="dia" size="2" maxlength="2" disabled="disabled"/>
					   <input type="text" name="mes" size="2" maxlength="2" disabled="disabled"/>
					   <input type="text" name="anio" size="4" maxlength="4" disabled="disabled"/>
				   </td>
				</tr>
				
				<tr>
				  <td align="left">Guardia
				  <input type="checkbox" name="guardia" /></td>
				  <td></td>
				  <td align="left">Empleo p&uacute;blico
				  <input type="checkbox" name="epublico"/></td>					
				</tr>
				<tr>
				  <td> <select name="cem" style="width:140px">
				        <% String cementerio = request.getParameter("cem");
						   boolean restriccion = (cementerio!=null);
						if ( !restriccion ) { %>
							<option value="TD">Todo</option>						
						<% }
						if (!restriccion || cementerio.equals("DG")) { %>
						<option value="DG">Direcci&oacute;n General</option>
						<% }
						if (!restriccion || cementerio.equals("CH")) { %>
						<option value="CH">Chacarita</option>
						<% }
						if (!restriccion || cementerio.equals("CR")) { %>
						<option value="CR">Crematorio</option>
						<% }
						if (!restriccion || cementerio.equals("FL")) { %>
						<option value="FL">Flores</option>
						<% }
						if (!restriccion || cementerio.equals("RE")) { %>
						<option value="RE">Recoleta</option>
						<% }
						%>
					   </select>
					 </td>
				  </td>
				</tr>
				<tr> 
				   <td></td>
				   <td></td>				   
				   <td align="right"><input type="submit" value="Generar"/></td>
			    </tr>
			  </table>
		 </form>	
</div>
	<%
	} // fin mostrar formulario
	HibernateUtil.closeSession();
   } else { %>
     
	 <%@include file="include/caducado.jsp" %>
	    
    <% }
	%>
</body>
<%@include file="footer.jsp" %>
</html>