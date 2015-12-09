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
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Datos del Agente</title>
</head>

<%!
public String avoidNull(String s) {
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





function chequearhab(ficha,inhabilitado) {



var inh=inhabilitado;

var url="inhabilitar.jsp?guardar=true&had=true&ficha="+ficha;

if(inh=='false'){

    alert('El agente no se encuentra desabilitado.');

}else{

document.location=url;

}
  }


function chequear(ficha,inhabilitado) {



var inh=inhabilitado;

if(inh=='false'){

                var dia=document.getElementById("dia_mot_inh").value;
        var mes=document.getElementById("mes_mot_inh").value;
                     var anio=document.getElementById("anio_mot_inh").value;

                     var mot=document.getElementById("mot_inh").value;
                     var obs=document.getElementById("obs_inh").value;
                     
                   var fecha=anio+'-'+mes+'-'+dia;



var url="inhabilitar.jsp?guardar=true&ficha="+ficha+"&motivo_inh="+mot+"&obs="+obs+"&fecha="+fecha;

              
if(document.getElementById("mot_inh").value!="" && document.getElementById("mot_inh").value!=" " && document.getElementById("mot_inh").value!="  " ){

if (!isDateValid( dia, mes,anio )){
		alert( "Verifique que la fecha de Inhabilitacion ingresada sea válida.") ;

		}else{
                       document.location=url;
             }
}else{

     alert("Ingrese un motivo de inhabilitacion");

}
}else{

    alert('El agente ya se encuentra desabilitado.');

}
  }

</script>

<%@include file="header.jsp" %>

<body>
<%
if (session.getAttribute("usuario")!=null) {
%>
<%@include file = "menu.jsp" %>
<%
if(request.getParameter("guardar")==null){
if(request.getParameter("had")==null){%>
  <b>Deshabilitar agente</b> <p></p>
<%}else{%>
   <b>Habilitar agente</b> <p></p>
<%}
}else{
if(request.getParameter("had")==null){%>
  <b>Deshabilitar agente</b> <p></p>
<%}else{%>
   <b>Habilitar agente</b> <p></p>
<%}
}

Session sesion = HibernateUtil.currentSession();

if(request.getParameter("guardar")!=null){

if(request.getParameter("had")==null){

Agente ag = null;
   ag = new Agente();
	 try {
       sesion.load(ag, new Integer(request.getParameter("ficha")));
       ag.setInhabilitado(true);
       Transaction t = sesion.beginTransaction();

       DetallesInhabilitacion det=new DetallesInhabilitacion();

       long seg=System.currentTimeMillis();
	   Date fechaActual=new Date(seg);

       det.setDet_fecha_sistema(fechaActual.getYear()+1900+"-"+(fechaActual.getMonth()+1)+"-"+fechaActual.getDate());
       det.setDet_ficha(Integer.toString(ag.getFicha()));
       det.setDet_agente_apellido(ag.getApellido_paterno());
       det.setDet_agente_nombre(ag.getNombres());
       if(request.getParameter("motivo_inh")!=null){
          det.setDet_motivo(request.getParameter("motivo_inh").toString());
       }
        if(request.getParameter("obs")!=null){
          det.setDet_observaciones(request.getParameter("obs").toString());
       }

        if(request.getParameter("fecha")!=null){
          det.setDet_fecha_inhabilitado(request.getParameter("fecha").toString());
       }
  
        det.setDet_usuario( user.getApellido()+" "+user.getNombre());
        det.setDet_operacion("desabilitar");

    


 sesion.save(det);
		

sesion.update(det);
sesion.update(ag);
		sesion.flush();
		t.commit();
       %>
 <font color="red" size="2">  Acaba de deshabilitar al agente </font> <font color="blue" size="2"> <%=ag.getApellido_paterno()%> <%=ag.getNombres()%> </font>  <font color="red" size="2"> con ficha </font> <font color="blue" size="1"><%=ag.getFicha()%> </font>
<p></p>
 Desde la fecha actual en adelante no se le podra otorgar licencias y/o modificar sus datos personales.

	   <% }
	  catch (ObjectNotFoundException e) {%>

	 A ocurrido un problema interno del sistema comuniquese con el administrador....

<%}

}else{

    Agente ag = null;
   ag = new Agente();
	 try {
       sesion.load(ag, new Integer(request.getParameter("ficha")));
       ag.setInhabilitado(false);




        DetallesInhabilitacion det=new DetallesInhabilitacion();

       long seg=System.currentTimeMillis();
	   Date fechaActual=new Date(seg);

       det.setDet_fecha_sistema(fechaActual.getYear()+1900+"-"+(fechaActual.getMonth()+1)+"-"+fechaActual.getDate());
       det.setDet_ficha(Integer.toString(ag.getFicha()));
       det.setDet_agente_apellido(ag.getApellido_paterno());
       det.setDet_agente_nombre(ag.getNombres());


        det.setDet_usuario( user.getApellido()+" "+user.getNombre());
        det.setDet_operacion("habilitar");


       sesion.save(det);
       Transaction t = sesion.beginTransaction();
       sesion.update(ag);
	   sesion.flush();
	   t.commit();
       %>
      <font color="blue">
      El Agente ha sido habilitado.
       </font>

<%} catch (ObjectNotFoundException e) {%>

	 A ocurrido un problema interno del sistema comuniquese con el administrador....

<%}

}

}// fin guardar

else{

if (request.getParameter("bficha") == null && request.getParameter("ficha")==null && (request.getParameter("nom")==null ||request.getParameter("ape")==null)) {
%>
	<div style="position:relative;left:30%;top:30%; right:30%; width:450px; z-index:0;">
	
	  <form  action="inhabilitar.jsp" method="get" onsubmit="return chequear_form1(this)">
		 <input type="text" size="15" name="bficha" />
         <%if(request.getParameter("had")!=null){%><input type="hidden"  name="had" value="true" /><%}%>
         <%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		 <%}%>
		<input type="submit" value="Buscar por ficha" />
	</form>
	<form action="inhabilitar.jsp" method="get" onsubmit="return chequear_form2(this)">
		<input type="text" name="ape" size="15"/>
		<input type="text" name="nom" size="15"  />
         <%if(request.getParameter("had")!=null){%><input type="hidden"  name="had" value="true" /><%}%>
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
        <td><a href="inhabilitar.jsp?bficha=<%= ag.getFicha()%><%if(request.getParameter("cem")!=null){%>&cem=<%=request.getParameter("cem")%><%}%><%if(request.getParameter("had")!=null){%>&had=true<%}%>"><%= ag.getFicha()%></a></td>
        <td><%=ag.getApellido_paterno()%></td>
        <td><%=ag.getNombres()%></td>
      </tr>
<%
  }
%>
	  <tr>
	    <td></td>
	    <td></td>
	    <td align="right">	<form action="inhabilitar.jsp" method="get" style="width:200px; "><input type="button" value="Cancelar" onclick="javascript:cancelar()" />
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
					<form action="inhabilitar.jsp" method="get">
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


		<b>Ficha</b>: <%= ag.getFicha() %>

	<table>
	  <tr>
	    <td class="caja">
			<table width="310">
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

<p></p>
 <%if(request.getParameter("had")==null){%>
    

			<table width="310">
			  <tr>
				<td class="linea"><b>Motivo Deshabilitacion</b>:</td>
				<td class="linea"><input id="mot_inh" type="text" /></td>
			  </tr>
			  <tr>
				<td class="linea"><b></b></td>
			
                 <tr>
	<td><p>Fecha Deshabilitacion</p>
	</td>

	<td><input type="text" size="2" maxlength="2" id="dia_mot_inh"  />
		<input type="text" size="2" maxlength="2" id="mes_mot_inh"  />
		<input type="text" size="4" maxlength="4" id="anio_mot_inh"   /></td>
 </tr>
			  </tr>
            <tr>
				<td class="linea"><b>Observaciones</b>:</td>
				<td class="linea"><input id="obs_inh" type="text" /></td>
			  </tr>
			  <tr>

			</table>

           </table>

  <form  method="get">
	          <input type="button" value="Guardar cambios" onclick="chequear('<%=ag.getFicha()%>','<%=ag.isInhabilitado()%>')"/>
		<input type="submit" value="Volver"/>
	  </form>

            <%}else{%>
            
        <div>
            
  <form  method="get">
       <%if(request.getParameter("had")!=null){%><input type="hidden"  name="had" value="true" /><%}%>
         <font color="red" size="0.5">
                                El agente sera habilitado nuevamente para ingresarle licencias.
                                </font>
                                <p></p>
	          <input type="button" value="Guardar cambios" onclick="chequearhab('<%=ag.getFicha()%>','<%=ag.isInhabilitado()%>')"/>
		<input type="submit" value="Volver"/>
	  </form>
            
            
            
            </div>  
            
            <%}%>
	     <%if (request.getParameter("cem")!=null) { %>
		    <input name="cem" type="hidden" value="<%=request.getParameter("cem")%>" />
		 <%}%>
 


         

		
	


	<% } //if existe agente
  } // if busco por ficha

}
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