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
<title>Modificar Agentes</title>
</head>
<style>

.cuadro 
  		{
		border-top: 2px solid #000000;  border-bottom:2px solid #000000;
		border-left: 2px solid #000000; border-right:2px solid #000000;
		}
</style>

<script src="varios.js"></script>
<script src="include/agregar_hijos.js"></script>
<script src="include/agregar_hermanos.js"></script>
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
  
    function modif_ficha(num_ficha) {

  open("edicion_ficha.jsp?ficha="+num_ficha,"ventana1","width=1020,height=700,scrollbars=SI");


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
<div style="position:relative;left:30%;top:30%; right:30%; width:450px; z-index:0">
	  <b>Modificar datos de los agentes</b>	
	<form action="modificar_agente.jsp" method="get" onsubmit="return chequear_form1(this)">
            <input type="text" size="15" name="bficha" />
		<%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		<%}%>
		<input type="submit" value="Buscar por ficha" />
	</form>
	<form action="modificar_agente.jsp" method="get" onsubmit="return chequear_form2(this)">
		<input type="text" name="ape" size="15"/> 
		<input type="text" name="nom" size="15"  /> 
		<%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		<%}%><input type="submit" value="Buscar por nombre"  />
	</form>
</div>
<%
}
Agente ag = null;
String nombre = request.getParameter("nom");
String apellido = request.getParameter("ape");
if ((nombre!=null && nombre.length()>0) || (apellido!=null && apellido.length()>0)) { //Busca por nombre y/o apellido
  Persistente per = new Persistente();
  int catp = 0;
  String cement = request.getParameter("cem");
  if (cement!=null)
    per.setFiltro("cementerio.cem_id", cement);
  
  String params[] = new String[4];
  params[0]= "apellido_paterno";
  params[1]= apellido;
  params[2]="nombres";
  params[3]=nombre;


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
    if(!ag.isInhabilitado()){
%>
      <tr>
        <td><a href="modificar_agente.jsp?bficha=<%=ag.getFicha()%><%if(request.getParameter("cem")!=null){%>&cem=<%=request.getParameter("cem")%><%}%>"><%=ag.getFicha()%></a></td>
        <td><%=ag.getApellido_paterno()%></td>
        <td><%=ag.getNombres()%></td>
         <td><%=ag.isInhabilitado()%></td>
      </tr>    
<%
     }
  }
%>
	  <tr>
	    <td></td>
	    <td></td>
	    <td align="right">	<form action="modificar_agente.jsp" method="get" style="width:200px; "><input type="button" value="Cancelar" onclick="javascript:cancelar()" /> 		<%if (request.getParameter("cem")!=null) { %>
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
     
	 //Consultas para los combobox
     List nac = sesion.createQuery("from Nacionalidad as nc order by nc.descripcion").list();
	 List ec = sesion.createQuery("from EstadoCivil ec order by ec.desc_estado_civil").list();
	 List fn = sesion.createQuery("from Funcion fn order by fn.descripcion").list();
     List doc = sesion.createQuery("from TipoDocumento dn order by dn.desc_tipo_documento").list();
	 List cem = sesion.createQuery("from Cementerio cem order by cem.descripcion").list();
	 
	 
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
       
       if (ag.isInhabilitado()) {
	       ObjectNotFoundException ex1 = new ObjectNotFoundException(request.getParameter("bficha"), "Agente");
           throw ex1;
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
%>
	
	 <script>
	     var op_nac=new Array("  ",<%Iterator opciones=nac.iterator();while(opciones.hasNext()){Nacionalidad n=(Nacionalidad) 	            opciones.next();%><%="\""+n.getDescripcion()+"\""%><% if (opciones.hasNext()) %><%= "," %><%}%><%=");"%>
				
	     var op_doc=new Array(" ",<%Iterator documentos=doc.iterator();while(documentos.hasNext()){TipoDocumento d=(TipoDocumento) documentos.next();%><%="\""+d.getDesc_tipo_documento()+"\""%><% if (documentos.hasNext()) %><%= "," %><%}%><%=");"%>
	</script>

<%
	 if (existe_agente) {
%>

	  <b>Modificar agente:</b>
	  <form id="form1" action="modificar_agente.jsp" method="post" onsubmit="return verif_formulario(this)">
		<div style="border-bottom:1px solid #000; border-top:1px solid #000; width:965px;
	            border-left:1px solid #000; border-right:1px solid #000; padding-left:0.3cm; padding-top:0.3cm;
				padding-bottom:0.3cm" >
                    <table>
                        <tr><td>
	        <b>Ficha</b>: <%=request.getParameter("bficha")%>
                  <input name="ficha" type="hidden" value="<%=request.getParameter("bficha")%>" />  <input type="button" name="mod_ficha" value="Modificar numero de ficha" onClick="javascript:modif_ficha('<%=request.getParameter("bficha")%>')" />
           </td>     </tr>
                </table>
			   <table>
			   <tr>
				 <td valign="top"> <!-- Primer columna -->
				   <%@include file="include\datos_agente.jsp" %>
				 </td>
				 <td valign="top"> <!-- Primer columna -->
				   <%@include file="include\datos_dgcem.jsp" %>
				 </td>
				 <td valign="top"> <!-- Primer columna -->
				   <%@include file="include\datos_conyuge.jsp" %>
				 </td>		 
			   </tr>
			   </table>
	           <%@include file="include\datos_domicilio.jsp" %>
	           <br />
	           <%@include file="include\hijos.jsp" %>
			   <br /><br />
			   <%@include file="include\hermanos.jsp" %>
	   </div>
	   <div align="right"><input type="button" value="Cancelar" onclick="javascript:cancelar()" />
	   		<%if (request.getParameter("cem")!=null) { %>
		    	<input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
			<%}%>
	   <input type="submit" value="Guardar" name="guardar" /></div>
	  </form>


	<% } //if existe agente 
  } // if busco por ficha
  else
    if (request.getParameter("guardar")!=null) {
       Persistente p = new Persistente();
/*	   Transaction t1 = sesion.beginTransaction();
	   String consulta = "delete Hijo where ficha="+request.getParameter("ficha");
	   sesion.createQuery(consulta).executeUpdate();
	   sesion.createQuery("delete Hermano where ficha="+request.getParameter("ficha")).executeUpdate();
	   sesion.flush();
	   t1.commit();*/
	   boolean guardado = p.save(request, ag, true);
	   if (guardado) {
%>	
   	       <div style="padding-top:2cm"></div>
		   <table align="center" style="background:#CCCCCC" class="cuadro">
			  <tr>
				<td>Los datos se actualizaron correctamente</td>
			 </tr>
			 <tr>
				<td style="border-top:2px solid #000000; padding-top:0.5cm" align="center">
					<form action="modificar_agente.jsp" method="get">
					  		<%if (request.getParameter("cem")!=null) { %>
		    					<input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
							<%}%>
					  <input type="submit" value="Aceptar"/>
					</form>
				</td>
			 </tr>
</table>
<%
	   }
    }
  HibernateUtil.closeSession();
}
else {
%>
	 <%@include file="include/caducado.jsp"%>
<%
}
%>
</body>
<%@include file="footer.jsp" %>
</html>