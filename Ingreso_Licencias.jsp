<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import ="funciones.*" %>
<%@ page import ="java.util.*" %>
<%@ page import = "util.*" %>

<%@ page import ="java.util.Date" %>
<%@ page import ="bean.*" %>
<%@ page import ="auxclases.*" %>
<%@ page import = "org.hibernate.exception.ConstraintViolationException" %>
<%@ page import = "org.hibernate.exception.GenericJDBCException" %>
<%@ page import = "org.hibernate.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<jsp:useBean id="ina"    scope="session" 
class="funciones.Ser_Inasistencias" />


<script language="javascript" src="varios.js">
  
</script>

<script language="javascript">  
  
  function verif_fechas() {
    var diad = document.f1.dia_d;
	var mesd = document.f1.mes_d;
	var aniod = document.f1.anio_d;

    var diah = document.f1.dia_h;
	var mesh = document.f1.mes_h;
	var anioh = document.f1.anio_h;	
	if(document.f1.dia_d.disabled==true){
	if (verificar_fecha(diad.value, mesd.value, aniod.value) && verificar_fecha(diah.value, mesh.value, anioh.value)) {
	  return true;
	}
	else
	  return false;
	                                    }else return true;
  }

 function activar() {
     document.f1.dia_d.disabled = false;
	 document.f1.mes_d.disabled = false;
	 document.f1.anio_d.disabled = false;
	 document.f1.dia_h.disabled = false;
	 document.f1.mes_h.disabled = false;
	 document.f1.anio_h.disabled = false;
	 document.f1.campo_duracion.value="";
	 document.f1.dia_d.focus();
	  document.f1.campo_duracion.disabled=false;
	  
	   document.f1.dia_d.value = "";
     document.f1.mes_d.value="";
	 document.f1.anio_d.value=""; 
	 
     document.f1.dia_h.value = "";
     document.f1.mes_h.value= "";
	 document.f1.anio_h.value=""; 
   }

   function desactivarhoy() {
     document.f1.dia_d.disabled = true;
	 document.f1.mes_d.disabled = true;
	 document.f1.anio_d.disabled = true;
	 document.f1.dia_h.disabled = true;
	 document.f1.mes_h.disabled = true;
	 document.f1.anio_h.disabled = true;
	 document.f1.campo_duracion.value="1";
     document.f1.campo_duracion.disabled=true;
	 miFechaActual = new Date();
	 document.f1.dia_d.value = miFechaActual.getDate();
     document.f1.mes_d.value= parseInt(miFechaActual.getMonth()) + 1 ;
	 document.f1.anio_d.value=miFechaActual.getFullYear(); 
	 
     document.f1.dia_h.value = miFechaActual.getDate();
     document.f1.mes_h.value= parseInt(miFechaActual.getMonth()) + 1 ;
	 document.f1.anio_h.value=miFechaActual.getFullYear(); 
   }
   
</script>





<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ingreso de licencias por AGENTE</title>
<script language="javascript" src="varios.js"> </script>

<script language="javascript">
  function verif_fechas() {
  
    var diad = document.f1.dia_d;
	var mesd = document.f1.mes_d;
	var aniod = document.f1.anio_d;
	
    var diah = document.f1.dia_h;
	var mesh = document.f1.mes_h;
	var anioh = document.f1.anio_h;
		
	if (verificar_fecha(diad.value, mesd.value, aniod.value) && verificar_fecha(diah.value, mesh.value, anioh.value)) {
	  return true;
	}
	else {
	  alert("ingrese una fecha valida");
	  return false;
	  }
  }
  

</script>



<link href="reporte.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%@include file="menu.jsp"%>

<p>

<%
  
Session sesion = HibernateUtil.currentSession();
Transaction tx = sesion.beginTransaction();
String textoficha=request.getParameter("campo_ficha");
String apellido=request.getParameter("campo_apellido");
String nombre=request.getParameter("campo_nombre");
String botguardar=request.getParameter("BotonGuardar");
String botapellido=request.getParameter("BotonApellidoNombre");

String texto_diaDesde=request.getParameter("dia_d");
String texto_diaHasta=request.getParameter("dia_h");
String texto_mesDesde=request.getParameter("mes_d");

String texto_mesHasta=request.getParameter("mes_h");
String texto_anioDesde=request.getParameter("anio_d");
String texto_anioHasta=request.getParameter("anio_h");
String texto_duracion=request.getParameter("campo_duracion");
String texto_ConSueldo=request.getParameter("ConS");

String texto_motivo=request.getParameter("menuTipoLicencia");
String texto_obsevaciones=request.getParameter("campo_observaciones");
String texto_botFicha=request.getParameter("BotonFicha");
String cadena="no se sabe";
String cementerio=request.getParameter("cem");
String dia=request.getParameter("dia");

%>

</p>
<p>
  <%
if(cementerio!=null){
	Cementerio cemr=new Cementerio();
	cemr.setCem_id(cementerio);
	session.setAttribute("CEMENTARY",cemr);
	}
	
	String id_cemen=((Cementerio)session.getAttribute("CEMENTARY")).getCem_id();
	Cementerio cem=ina.darCementerio(id_cemen);
	String cemen=new String();
	if(cem.getDescripcion()==null){
	cemen="";
	}else {cemen=cem.getDescripcion();}
%>
<form  name="f1" action="Ingreso_Licencias.jsp"  method="get" class="unnamed"=>
  
Ingreso Licencias <%=cemen%>
<p> 
      <input type="text" name="campo_ficha">
      <input type="submit" name="BotonFicha" value="Buscar por ficha" onClick="return verif_ficha(campo_ficha)"/>
</p>
<p>      <input type="text" name="campo_apellido" />    
      <input type="text" name="campo_nombre" />
      <input type="submit" name="BotonApellidoNombre" value="Buscar por Apellido y nombre" onClick="return verif_ape(campo_apellido)" />

      <%

ArrayList listaLicencias=new ArrayList(); 

if(request.getParameter("BotonFicha")!=null){

Integer numficha=new Integer(textoficha);
listaLicencias=ina.crearListaInasistencias(numficha.intValue(),cem);

}

if(request.getParameter("BotonApellidoNombre")!=null )
listaLicencias=ina.crearListaInasistencias(apellido,nombre,cem);




if(!listaLicencias.isEmpty()){
Licencia lic=new Licencia();
lic=(Licencia)listaLicencias.get(0);
%>
<p>Licencias de <%=lic.getAgente().getApellido_paterno()%>
    <%=lic.getAgente().getNombres()%>
</p>
<p class="titulo1">Numero ficha: <%=lic.getAgente().getFicha()%></p>
<p>
  <input name="dia" type="radio" value="hoy"  onclick="desactivarhoy()"/>
Hoy

</p>
<p>
    <input name="dia" type="radio" value="otra" checked="checked" onclick="activar()"/>
    Otra </p>
<table  class="estilotabla">
        <tr>
          <td width="53">Desde: </td>
          <td width="684"><input type="text" name="dia_d" size="2" maxlength="2"  />
            /
            <input type="text" name="mes_d" size="2" maxlength="2"  />
            /
            <input type="text" name="anio_d" size="4" maxlength="4"  />
          </td>
        </tr>
        <tr>
          <td>  Hasta: </td>
          <td><input type="text" name="dia_h" size="2" maxlength="2"  />
            /
            <input type="text" name="mes_h" size="2" maxlength="2"  />
            /
            <input type="text" name="anio_h" size="4" maxlength="4" />
          </td>
        </tr>
</table>
    <p>Con sueldo 
      <input name="ConS" type="checkbox" checked="CHECKED"  width="5cm"/>                             
Motivo 
  
    <%
	
	ina.darListaMotivoLicencia().clear();
	
	%>
  
                <select  class=""name="menuTipoLicencia" onChange="cargarMot()"  >
				        <%
					Iterator it = ina.darListaMotivoLicencia().iterator();
					while (it.hasNext()) {
			  		      MotivoLicencia mot = (MotivoLicencia)it.next();
			  		%> 
				        <option> <%=mot.getDescripcion() %>  </option> 
				        <%
					}
					%>
                </select> 
Duracion   
      <input name="campo_duracion" type="text" size="4" /> dias
</p>
    <p>Observaciones
      <input name="campo_observaciones" type="text" size="75" />
</p>
    <p>
           

  
         <input type="submit" name="BotonGuardar" value="Guardar"  onclick="return verif_todo()"/>  
  
           <input name="Cancelar" type="submit"  value="Cancelar"/>
  
    </p>
    <form  action="index.jsp">

  </form>

<h1  class="titulo1">
  


     <%}//fin if !lista vacia
  else{
  if(texto_botFicha!=null||botapellido!=null){
  %>
  <p class="titulo1">No se encuentra el Agente buscado</p>
  <%}
  }%>
  
  <%if (botguardar!=null){%>

<%

	Licencia lic1=new Licencia();
	
ina.crearListaInasistencias(ina.darAgente().getFicha(),cem);
if(dia.equals("hoy")){
long seg=System.currentTimeMillis();
		Date f_d=new Date(seg);
		Date f_h=new Date(seg);
		lic1.setFecha_desde(f_d);
		lic1.setFecha_hasta(f_h);
}
if(dia.equals("otra")){
        
	Integer diaD=new Integer(texto_diaDesde);
	Integer diaH=new Integer(texto_diaHasta);
	Integer mesD=new Integer(texto_mesDesde);
	Integer mesH=new Integer(texto_mesHasta);
	Integer anioD=new Integer(texto_anioDesde);
	Integer anioH=new Integer(texto_anioHasta);
	
	    Date f_d=new Date(anioD.intValue()-1900, mesD.intValue()-1,diaD.intValue(), 0, 0, 0);
		Date f_h=new Date(anioH.intValue()-1900, mesH.intValue()-1,diaH.intValue(), 0, 0, 0);
		
		/*f_d.setDate(diaD.intValue());
			f_d.setMonth(mesD.intValue());
			f_d.setYear(anioD.intValue());
			f_h.setDate(diaH.intValue());
			f_h.setMonth(mesH.intValue());
			f_h.setYear(anioH.intValue());
		 */
		 
			lic1.setFecha_desde(f_d);
			lic1.setFecha_hasta(f_h);
			
			//lic1.setFecha_desde(ina.fecha_Guardar_Base(lic1.getFecha_desde()));
			//lic1.setFecha_hasta(ina.fecha_Guardar_Base(lic1.getFecha_hasta()));
	}
			
		
			lic1.setFicha(ina.darAgente().getFicha());
		
			Calendario calen=new Calendario();
			
			
		if(request.getParameter("campo_duracion")!=null){
		Integer num=new Integer(request.getParameter("campo_duracion"));
			lic1.setDuracion(num.intValue());
		}else{
		lic1.setDuracion(1);
		}
			if(texto_ConSueldo!=null)
			lic1.setCon_sueldo(true);else lic1.setCon_sueldo(false);

			lic1.setMotivo(ina.darMotivo(texto_motivo));
			
			lic1.setObservaciones(texto_obsevaciones);
			lic1.setAgente(ina.darAgente());
			
			
			%>
			
<% if(ina.Esta_licencia(lic1.getFecha_desde(),lic1.getFecha_hasta(),ina.darAgente().getFicha(),cem)){
Licencia licenciarepetida=ina.getLicenciarepetida();

%>


La licencia no se a podido ingresar dado que coinciden fechas con otra licencia:

		
 
<tbody>    
   <tr> 
     	<td ><%=licenciarepetida.getFecha_desde()%></td>
		<td ><%=licenciarepetida.getFecha_hasta()%></td>
		<td ></td><%=licenciarepetida.getDuracion()%></td>		
		<td ></td><%=licenciarepetida.isCon_sueldo()%></td>		
		<td ><strong><span class="Estilo2"><%=licenciarepetida.getMotivo().getDescripcion()%></td>		
		<td ><font color="#FF0000"><strong><span class="Estilo2"><%=licenciarepetida.getObservaciones()%></td>
   </tr>
</tbody>

<%}else{
			ina.guardarLicencia(lic1);%>
</h1>
<h1  class="titulo1">Datos guardados !!!
	<%			}
	
		 }/*Boton guardar;*/%>


  <% HibernateUtil.closeSession();%>

</h1>
</body>

</html>

