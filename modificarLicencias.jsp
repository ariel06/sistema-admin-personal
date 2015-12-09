<%@ page import = "util.*" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="auxclases.*" %>
<%@ page import = "org.hibernate.exception.ConstraintViolationException" %>
<%@ page import = "org.hibernate.exception.GenericJDBCException" %>
<%@ page import = "org.hibernate.*" %>
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


<jsp:useBean id="ina"       scope="session"
class="funciones.Ser_Inasistencias" />

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
	else
	  return false;
  }
		
</script>





<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Modificar licencias</title>
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

<b class="cuerpo">

<%
String textoficha=request.getParameter("campo_ficha");
String apellido=request.getParameter("campo_apellido");
String nombre=request.getParameter("campo_nombre");
String botguardar=request.getParameter("BotonGuardar");

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



%>
</p>

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
	}else {cemen=cem.getDescripcion();
	}
%>
<form  name="f1" action="modificarLicencias.jsp" method="get">
  <p class="titulo1">Modificar Licencias <%=cemen%> </p>
  
                                    
    <p>
        <input name="campo_ficha"/>    
        <input type="submit" name="BotonFicha" value="Buscar por ficha" onClick="return verif_ficha(campo_ficha)"/>
  </p>
    <p>          </p>
        <input type="text" name="campo_apellido" />
        <input type="text" name="campo_nombre" />
        <input type="submit" name="BotonApellidoNombre" value="Buscar por Apellido y nombre" onClick="return verif_ape(campo_apellido)" />
        

        <%

ArrayList listaLicencias=new ArrayList(); 

if(request.getParameter("BotonFicha")!=null){
Integer numficha=new Integer(textoficha);
listaLicencias=ina.crearListaModificarLicencias(numficha.intValue(),cem);
}

if(request.getParameter("BotonApellidoNombre")!=null){
listaLicencias=ina.crearListaModificarInasistencias(apellido,nombre,cem);
}



if(!listaLicencias.isEmpty()){

%>
      </p>
        </p>
    <p><b class="titulo1">Licencias de <%=((Licencia)listaLicencias.get(0)).getAgente().getApellido_paterno()%>
<%=((Licencia)listaLicencias.get(0)).getAgente().getNombres()%> 
         
  
         
        </b></p>
  <b class="titulo1">
  <p align="center">Numero ficha: <%=((Licencia)listaLicencias.get(0)).getFicha()%></p>
  </b>
  <p>&nbsp;</p>
  <table class="estilotabla" >
  <thead>
  <tr>
    <th width="119"  class="estilocelda"><div align="center">Fecha desde
            </td>
   
    <th width="119" class="estilocelda"><div align="center">Fecha Hasta
            </td>
    
    <th width="142" class="estilocelda"><div align="center">Duracion
            </td>
    </div>
    <th width="137" class="estilocelda"><div align="center">Con sueldo
            </td>
    </div>
    <th width="173" class="estilocelda"><div align="center">Motivo
            </td>
    </div>
    <th width="255" class="estilocelda"><div align="center">Observaciones
            </td>
    </div>
    </tr>
  </thead>
  <tbody>
   	<%	
		Iterator ite=listaLicencias.iterator();
			while (ite.hasNext())
			{
				Licencia licencia=(Licencia)ite.next();
				String apellid=licencia.getAgente().getApellido_paterno()+"  "+licencia.getAgente().getNombres();

		%>
			<tr> 
				<td height="45" class="td_reporte"><div align="center" ><a href="guardarLicencia.jsp?fecha_desde_dia=<%=licencia.getFecha_desde().getDate()%>&fecha_desde_mes=<%=licencia.getFecha_desde().getMonth()+1%>&fecha_desde_anio=<%=licencia.getFecha_desde().getYear()+1900%>&fecha_hasta_dia=<%=licencia.getFecha_hasta().getDate()%>&fecha_hasta_mes=<%=licencia.getFecha_hasta().getMonth()+1%>&fecha_hasta_anio=<%=licencia.getFecha_hasta().getYear()+1900%>&sueldo=<%=licencia.isCon_sueldo()%>&duracion=<%=licencia.getDuracion()%>&motivo=<%=licencia.getMotivo().getDescripcion()%>&observaciones=<%=licencia.getObservaciones()%>&ficha=<%=licencia.getFicha()%>&id=<%=licencia.getId()%>&apellido=<%=apellid%>&duracion=<%=licencia.getDuracion()%>"><%=licencia.getFecha_desde()%> </a></div></td>
				<td class="td_reporte"><div align="center"><a href="guardarLicencia.jsp?fecha_desde_dia=<%=licencia.getFecha_desde().getDate()%>&fecha_desde_mes=<%=licencia.getFecha_desde().getMonth()+1%>&fecha_desde_anio=<%=licencia.getFecha_desde().getYear()+1900%>&fecha_hasta_dia=<%=licencia.getFecha_hasta().getDate()%>&fecha_hasta_mes=<%=licencia.getFecha_hasta().getMonth()+1%>&fecha_hasta_anio=<%=licencia.getFecha_hasta().getYear()+1900%>&sueldo=<%=licencia.isCon_sueldo()%>&duracion=<%=licencia.getDuracion()%>&motivo=<%=licencia.getMotivo().getDescripcion()%>&observaciones=<%=licencia.getObservaciones()%>&ficha=<%=licencia.getFicha()%>&id=<%=licencia.getId()%>&apellido=<%=apellid%>&duracion=<%=licencia.getDuracion()%>"><%=licencia.getFecha_hasta()%></a></div></td>
				<td class="td_reporte"><div align="center"><a href="guardarLicencia.jsp?fecha_desde_dia=<%=licencia.getFecha_desde().getDate()%>&fecha_desde_mes=<%=licencia.getFecha_desde().getMonth()+1%>&fecha_desde_anio=<%=licencia.getFecha_desde().getYear()+1900%>&fecha_hasta_dia=<%=licencia.getFecha_hasta().getDate()%>&fecha_hasta_mes=<%=licencia.getFecha_hasta().getMonth()+1%>&fecha_hasta_anio=<%=licencia.getFecha_hasta().getYear()+1900%>&sueldo=<%=licencia.isCon_sueldo()%>&duracion=<%=licencia.getDuracion()%>&motivo=<%=licencia.getMotivo().getDescripcion()%>&observaciones=<%=licencia.getObservaciones()%>&ficha=<%=licencia.getFicha()%>&id=<%=licencia.getId()%>&apellido=<%=apellid%>&duracion=<%=licencia.getDuracion()%>"><%=licencia.getDuracion()%></a></div></td>		
				<td class="td_reporte"><div align="center"><a href="guardarLicencia.jsp?fecha_desde_dia=<%=licencia.getFecha_desde().getDate()%>&fecha_desde_mes=<%=licencia.getFecha_desde().getMonth()+1%>&fecha_desde_anio=<%=licencia.getFecha_desde().getYear()+1900%>&fecha_hasta_dia=<%=licencia.getFecha_hasta().getDate()%>&fecha_hasta_mes=<%=licencia.getFecha_hasta().getMonth()+1%>&fecha_hasta_anio=<%=licencia.getFecha_hasta().getYear()+1900%>&sueldo=<%=licencia.isCon_sueldo()%>&duracion=<%=licencia.getDuracion()%>&motivo=<%=licencia.getMotivo().getDescripcion()%>&observaciones=<%=licencia.getObservaciones()%>&ficha=<%=licencia.getFicha()%>&id=<%=licencia.getId()%>&apellido=<%=apellid%>&duracion=<%=licencia.getDuracion()%>"><%if(licencia.isCon_sueldo()==true){%>Verdadero<%}else{%>Falso<%}%></a></div></td>		
				<td class="td_reporte"><div align="center"><a href="guardarLicencia.jsp?fecha_desde_dia=<%=licencia.getFecha_desde().getDate()%>&fecha_desde_mes=<%=licencia.getFecha_desde().getMonth()+1%>&fecha_desde_anio=<%=licencia.getFecha_desde().getYear()+1900%>&fecha_hasta_dia=<%=licencia.getFecha_hasta().getDate()%>&fecha_hasta_mes=<%=licencia.getFecha_hasta().getMonth()+1%>&fecha_hasta_anio=<%=licencia.getFecha_hasta().getYear()+1900%>&sueldo=<%=licencia.isCon_sueldo()%>&duracion=<%=licencia.getDuracion()%>&motivo=<%=licencia.getMotivo().getDescripcion()%>&observaciones=<%=licencia.getObservaciones()%>&ficha=<%=licencia.getFicha()%>&id=<%=licencia.getId()%>&apellido=<%=apellid%>&duracion=<%=licencia.getDuracion()%>"><%=licencia.getMotivo().getDescripcion()%></a></div></td>		
				<td class="td_reporte"><div align="center"><a href="guardarLicencia.jsp?fecha_desde_dia=<%=licencia.getFecha_desde().getDate()%>&fecha_desde_mes=<%=licencia.getFecha_desde().getMonth()+1%>&fecha_desde_anio=<%=licencia.getFecha_desde().getYear()+1900%>&fecha_hasta_dia=<%=licencia.getFecha_hasta().getDate()%>&fecha_hasta_mes=<%=licencia.getFecha_hasta().getMonth()+1%>&fecha_hasta_anio=<%=licencia.getFecha_hasta().getYear()+1900%>&sueldo=<%=licencia.isCon_sueldo()%>&duracion=<%=licencia.getDuracion()%>&motivo=<%=licencia.getMotivo().getDescripcion()%>&observaciones=<%=licencia.getObservaciones()%>&ficha=<%=licencia.getFicha()%>&id=<%=licencia.getId()%>&apellido=<%=apellid%>&duracion=<%=licencia.getDuracion()%>"><%=licencia.getObservaciones()%></a></div></td>
			</tr>

			  <%}%>
			
			 
  
 </tbody>
</table>				
    <%}//fin if !lista vacia
  else{%>
  <%if(request.getParameter("campo_ficha")!=null){%>
 
  <p>&nbsp;</p>

 <p class="titulo1">  El Agente no tiene licencias a modificar o no pertenece al cementerio </p>
    <%
	}
	}%>
</form>

<% HibernateUtil.closeSession(); %>
<%//=((Cementerio)session.getAttribute("CEMENTARY")).getCem_id()%>

</body>
</html>
