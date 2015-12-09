<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page import = "persistencia.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "bean.*" %>
<%@ page import = "org.hibernate.*" %>
<%@ page import = "util.*" %>
<%@ page import = "auxclases.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Datos del Agente</title>
</head>

<%! public String avoidNull(String s) {
       if (s==null) return "&nbsp;";
	   else if (s.length()==0)return "&nbsp;";
	     else return s;
    }
%>


<style>

.cuadro 
  		{
		border-top: 2px solid #000000;  border-bottom:2px solid #000000;
		border-left: 2px solid #000000; border-right:2px solid #000000;
		}
.caja
  		{
		border-top: 1px solid #000000;  border-bottom:1px solid #000000;
		border-left: 1px solid #000000; border-right:1px solid #000000;
		}
.linea { border-bottom:1px solid #CCCCCC }
</style>

<script src="varios.js"></script>
<script src="include/agregar_hijos.js"></script>
<script src="agente.js"></script>

<link rel="STYLESHEET" type="text/css" href="reporte.css">

<script>
  function chequear_form1(f) {
    if (isNaN(f.elements[0].value)) {
	  alert("Ingrese el numero de ficha correctamente");
	  return false;
	}
	var num_ficha = parseInt(f.elements[0].value);
	if (isNaN(num_ficha)) {
	  alert("Ingrese el numero de ficha correctamente");
	  return false;
	}
	else
	  return true;
  }
  
  function chequear_form2(f) {
    if(f.elements[0].value==""&&f.elements[1].value=="") {
	  alert("Ingrese el nombre o e apellido");
	  return false;
	}
	else
	  return true;
  }
</script>

<%@include file="header.jsp" %>
<body>
<%
if (session.getAttribute("usuario")!=null) {
%>
<%@include file = "menu.jsp" %>
<%
Session sesion = HibernateUtil.currentSession();
if (request.getParameter("bficha") == null && request.getParameter("ficha")==null && (request.getParameter("nom")==null ||request.getParameter("ape")==null)) {
%>
	<div style="position:relative;left:30%;top:30%; right:30%; width:450px; z-index:0;">
	  <b>Ver datos de los agentes</b>
	  <form action="datos_agente.jsp" method="get" onsubmit="return chequear_form1(this)">
		 <input type="text" size="15" name="bficha" /> 
		 <%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		 <%}%>
		<input type="submit" value="Buscar por ficha" />
	</form>
	<form action="datos_agente.jsp" method="get" onsubmit="return chequear_form2(this)">
		<input type="text" name="ape" size="15"/> 
		<input type="text" name="nom" size="15"  />
		 <%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		 <%}%>
		<input type="submit" value="Buscar por nombre"  />
	</form>
</div>
<%
}
Agente ag = null;
String nombre = request.getParameter("nom");
String apellido = request.getParameter("ape");
if ((nombre!=null && nombre.length()>0) || (apellido!=null && apellido.length()>0)) { //Busca por nombre y/o apellido
  Persistente per = new Persistente();
  String params[] = new String[4];
  params[0]= "apellido_paterno";
  params[1]= apellido;
  params[2]="nombres";
  params[3]=nombre;
  String cement = request.getParameter("cem");
  if (cement!=null)
     per.setFiltro("cementerio.cem_id", cement);
  Iterator agts = per.getElementsByFieldF("Agente", params, "ficha").iterator();
%>

  <br /><br />
  <div style="position:relative 50%">
  <table align="center">
    <thead bgcolor="#CCCCCC">
      <tr>
        <td class="box-header" style="width:50px">Ficha</td>
        <td class="box-header" style="width:200px">Apellido</td>
        <td class="box-header" style="width:200px">Nombres</td>
      </tr>
    </thead>
    <tbody>
<%
  if (!agts.hasNext()) { // Muestro mensaje (No hay resultados)
%>
    <tr><td>No se han encontrado resultados</td></tr>
<%
  }
%>
  
<%	
  while (agts.hasNext()) { //Listo los resultados
    ag = (Agente) agts.next();
%>
      <tr>
        <td><a href="datos_agente.jsp?bficha=<%= ag.getFicha()%><%if(request.getParameter("cem")!=null){%>&cem=<%=request.getParameter("cem")%><%}%>"><%= ag.getFicha()%></a></td>
        <td><%=ag.getApellido_paterno()%></td>
        <td><%=ag.getNombres()%></td>
      </tr>    
<%   
  }
%>
	  <tr>
	    <td></td>
	    <td></td>
	    <td align="right">	<form action="datos_agente.jsp" method="get" style="width:200px; "><input type="button" value="Cancelar" onclick="javascript:cancelar()" />
		 <%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		 <%}%>
	  <input type="submit" value="Volver"/>
	</form></td>				
	  </tr>
    </tbody>
   </table>
   <br />
  </div>
<%
} // if buscar por nombre y/o apellido
else
  if (request.getParameter("bficha")!=null) { // Busco por ficha. Muestro los datos del agente
     
	 boolean modificacion = true;
	 boolean existe_agente = true;
     ag = new Agente();
	 try {
       sesion.load(ag, new Integer(request.getParameter("bficha")));
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
					<form action="datos_agente.jsp" method="get">
					 <%if (request.getParameter("cem")!=null) { %>
		    			<input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		 			 <%}%>
					  <input type="submit" value="Aceptar"/>
					</form>
				</td>
			 </tr>
			</table>
<%  // Muestro mensaje de agente no encontrado
	 } // catch
	 if (existe_agente) {
%>
        <b>Ficha</b>: <%= ag.getFicha() %> <%if(ag.isInhabilitado()){%><font  style="black" color="red"> DESHABILITADO </font> <%}%>
	              <%if(ag.isInhabilitado()){
                       String params1[] = new String[2];
  params1[0]= "det_ficha";
  params1[1]= Integer.toString(ag.getFicha());
 
    Persistente per = new Persistente();
    DetallesInhabilitacion det;%>
        <p>
<font size="2" >
    Detalles Deshabilitacion
</font>
    <%
                        Iterator detalles = per.getElementsByFieldF("DetallesInhabilitacion", params1, "det_fecha_inhabilitado").iterator();
                          while (detalles.hasNext()) { //Listo los resultados
    det = (DetallesInhabilitacion) detalles.next();
                      %>
              
                  	<table width="300" border="1">
                           <%  if(det.getDet_fecha_inhabilitado()!=null){%>
			  <tr>
				<td class="linea"><b>Fecha</b>:</td>
				<td class="linea"><%=det.getDet_fecha_inhabilitado()%></td>
			  </tr>
                 <%}%>
               <tr>
                    <%  if(det.getDet_observaciones()!=null){%>
				<td class="linea"><b>Observaciones</b>:</td>
               

				<td class="linea"><%=det.getDet_observaciones()%></td>
                <%}%>
			  </tr>
			  <tr>

                  </table>




              <%}
                        }//fin if inhabilitado%>
                        <p>
<font size="2">
    Datos Agente
</font>
	<table>
	  <tr>
	    <td class="caja">
			<table width="300">
			  <tr>
				<td class="linea"><b>Apellido paterno</b>:</td>
				<td class="linea"><%=avoidNull(ag.getApellido_paterno())%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Apellido materno</b>:</td>
				<td class="linea"><%=avoidNull(ag.getApellido_materno())%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Nombres</b>:</td>
				<td class="linea"><%=avoidNull(ag.getNombres())%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Sexo</b>:</td>
				<td class="linea"><%if(ag.getSexo()=='M'){%>Masculino<%}else{%>Femenino<%}%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Fecha de nacimiento</b>:</td>
				<td class="linea"><%if(ag.getFecha_nacimiento()!=null){%><%=ag.getFecha_nacimiento()%><%}%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Documento</b>:</td>
				<td class="linea"><%if(ag.getTipo_doc()!=null){%><%=avoidNull(ag.getTipo_doc().getDesc_tipo_documento())+" "+avoidNull(ag.getNumero_doc())%><%}%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>CUIL</b>:</td>
				<td class="linea"><%=avoidNull(ag.getCuil())%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Nacionalidad</b>:</td>
				<td class="linea"><%if(ag.getNacionalidad()!=null){%><%=ag.getNacionalidad().getDescripcion()%><%}%></td>			
			  </tr>
			  <tr>
				<td class="linea"><b>Estado Civil</b>:</td>
				<td class="linea"><%if(ag.getEstado_civil()!=null){%><%=ag.getEstado_civil().getDesc_estado_civil()%><%}%></td>			
			  </tr>
			  <tr>
				<td><b>Tel&eacute;fono</b>:</td>
				<td><%=avoidNull(ag.getTelefono())%></td>			
			  </tr>		  		  
			</table>
		</td>
		<td class="caja" width="300">
			<table>
			  <tr>
				<td class="linea"><b>Nivel</b>:</td>
				<td class="linea"><%=avoidNull(ag.getNivel())%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Grado</b>:</td>
				<td class="linea"><%if(ag.getGrado()!=0){%><%=ag.getGrado()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Funci&oacute;n</b>:</td>
				<td class="linea"><%if(ag.getFuncion()!=null){%><%=ag.getFuncion().getDescripcion()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Fecha ingreso GCBA</b>:</td>
				<td class="linea"><%if(ag.getFecha_ingreso_mun()!=null){%><%=ag.getFecha_ingreso_mun()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Fecha ingreso DGCEM</b>:</td>
				<td class="linea"><%if(ag.getFecha_ingreso_dgcem()!=null){%><%=ag.getFecha_ingreso_dgcem()%><%}else{%>&nbsp;<%}%></td>
			  </tr>


  			  <tr>
				<td class="linea"><b>Sueldo bruto</b>:</td>
				<td class="linea"><%if(ag.getSueldo_bruto()>0){%><%=ag.getSueldo_bruto()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Horario de trabajo</b>:</td>
				<td class="linea"><%if(ag.getHora_desde()!=null && ag.getHora_desde().length()>0 && ag.getHora_hasta()!=null && ag.getHora_hasta().length()>0)
					{%><%=ag.getHora_desde()+" a "+ag.getHora_hasta()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Cementerio</b>:</td>
				<td class="linea"><%if(ag.getCementerio()!=null){%><%=ag.getCementerio().getDescripcion()%><%}%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Guardia</b>: <%if(ag.isGuardia()){%>Si<%}else{%>No<%}%></td>
				<td class="linea"><b>Empleo p&uacute;blico</b>: <%if(ag.isEmpleo_publico()){%>Si<%}else{%>No<%}%></td>
			  </tr>
   			  <tr>
				<td><b>Observaciones</b>:</td>
				<td><%=avoidNull(ag.getObservaciones())%></td>
			  </tr>
			</table>
		</td>
		<td class="caja" valign="top">
			<% if (ag.getConyuge()!=null) { %>
			<table width="300">
			  <%if(ag.getSexo()=='F'){%>
			  <tr>
				<td class="linea"><b>Apellido Casada</b>:</td>
				<td class="linea"><%=avoidNull(ag.getApellido_casada())%></td>
			  </tr>
			  <%}%>
			  <tr>
				<td class="linea"><b>Fecha casado</b>:</td>
				<td class="linea"><%if(ag.getFecha_casado()!=null){%><%=ag.getFecha_casado()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
			  <% Conyuge cg = ag.getConyuge();%>
			  <tr>
				<td class="linea"><b>Apellido del conyuge</b>:</td>
				<td class="linea"><%if(cg.getApellido()!=null){%><%=cg.getApellido()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Nombre del conyuge</b>:</td>
				<td class="linea"><%if(cg.getNombre()!=null){%><%=cg.getNombre()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Nacionalidad</b>:</td>
				<td class="linea"><%if(cg.getNacionalidad()!=null){%><%=cg.getNacionalidad().getDescripcion()%><%}%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Fecha nacimiento</b>:</td>
				<td class="linea"><%if(cg.getFechaNacimiento()!=null){%><%=cg.getFechaNacimiento()%><%}else{%>&nbsp;<%}%></td>
			  </tr>
			  <tr>
				<td class="linea"><b>Trabaja</b>: </td>
				  <%if(cg.isTrabaja()){%>Si<%}else{%>No<%}%></td>
			  </tr>
			  <% if(cg.isTrabaja()) {%>
  			  <tr>
				<td class="linea"><b>Trabaja en</b>:</td>
				<td class="linea"><%if(cg.getDondeTrabaja()!=null){%><%=cg.getDondeTrabaja()%><%}%></td>
			  </tr>
  			  <tr>
				<td class="linea"><b>Trabaja desde</b>:</td>
				<td class="linea"><%if(cg.getTrabajaDesde()!=null){%><%=cg.getTrabajaDesde()%><%}%></td>
			  </tr>
			  <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
			  <%}%>
			</table>
			<%}%>
		</td>
	  </tr>
	</table>
	<br />
	<b>Domicilio</b><br />
	<b>Calle</b>: <%=avoidNull(ag.getCalle())%> <b>Nro</b>: <%=avoidNull(ag.getNumero_dom())%> <b>Piso</b>: <%=avoidNull(ag.getPiso())%> <b>Dpto</b>: <%=avoidNull(ag.getDepto())%><br />
	<b>Localidad</b>: <%=avoidNull(ag.getLocalidad())%><br />
	<b>Provincia</b>: <%=avoidNull(ag.getProvincia())%><br />
	<b>Pais</b>: <%=avoidNull(ag.getPais())%><br />
	<br />
	<b>Hijos</b>:<br />
	<table>	
	  <thead bgcolor="CCCCCC">
		  <tr>
			  <th width="150" align="left" class="caja">Apellido</th>
			  <th width="150" align="left" class="caja">Nombre</th>
			  <th width="130" align="left" class="caja">Fecha Nac</th>
			  <th width="40" align="left" class="caja">sexo</th>
			  <th width="50" align="left" class="caja">Doc</th>
			  <th width="100" align="left" class="caja">Numero</th>
			  <th width="100" align="left" class="caja">Nacionalidad</th>		  
		  </tr>
	  </thead>
		<tbody>
	<% 
	  Set lh = ag.getHijos();
	  Iterator it = lh.iterator();
	  while(it.hasNext()) {
	    Hijo hijo = (Hijo)it.next();
	%>
		<tr>
			<td><%if(hijo.getApellido()!=null){%><%=hijo.getApellido()%><%}%></td>
			<td><%if(hijo.getNombre()!=null){%><%=hijo.getNombre()%><%}%></td>
			<td><%if(hijo.getFechaNacimiento()!=null){%><%=hijo.getFechaNacimiento()%><%}%></td>
			<td><%=hijo.getSexo()%></td>
			<td><%if(hijo.getTipoDoc()!=null){%><%=hijo.getTipoDoc().getDesc_tipo_documento()%><%}%></td>
			<td><%if(hijo.getNumeroDoc()!=null){%><%=hijo.getNumeroDoc()%><%}%></td>
			<td><%if(hijo.getNacionalidad()!=null){%><%=hijo.getNacionalidad().getDescripcion()%><%}%></td>
		</tr>
    <%}%>
	</tbody>
	</table>
	
		<br />
	<b>Hermanos</b>:<br />
	<table>	
	  <thead bgcolor="CCCCCC">
		  <tr>
			  <th width="150" align="left" class="caja">Apellido</th>
			  <th width="150" align="left" class="caja">Nombre</th>
			  <th width="40" align="left" class="caja">sexo</th>
			  <th width="50" align="left" class="caja">Doc</th>
			  <th width="100" align="left" class="caja">Numero</th>
			  <th width="100" align="left" class="caja">Nacionalidad</th>		  
		  </tr>
	  </thead>
		<tbody>
		<% 
		  Set lhe = ag.getHermanos();
		  Iterator ith = lhe.iterator();
		  while(ith.hasNext()) {
			Hermano hermano = (Hermano)ith.next();
		%>
		  <tr>
			<td><%if(hermano.getApellido()!=null){%><%=hermano.getApellido()%><%}%></td>
			<td><%if(hermano.getNombre()!=null){%><%=hermano.getNombre()%><%}%></td>		  
			<td><%=hermano.getSexo()%></td>
			<td><%if(hermano.getTipoDoc()!=null){%><%=hermano.getTipoDoc().getDesc_tipo_documento()%><%}%></td>
			<td><%if(hermano.getNumeroDoc()!=null){%><%=hermano.getNumeroDoc()%><%}%></td>
			<td><%if(hermano.getNacionalidad()!=null){%><%=hermano.getNacionalidad().getDescripcion()%><%}%></td>
		  </tr>
		<%
		}
		%>
		</tbody>
	</table>
	
	  <form action="datos_agente.jsp" method="get">
	     <%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		 <%}%>
		<input type="submit" value="Volver"/>
	  </form>
	
	
	<% } //if existe agente 
  } // if busco por ficha


  HibernateUtil.closeSession();
} else {
%>
	 <%@include file="include/caducado.jsp" %>
<%
}
%>
</body>
<%@include file="footer.jsp" %>
</html>