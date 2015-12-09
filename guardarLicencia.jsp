
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import = "util.*" %>

<%@ page import ="java.util.Date"%>
<%@ page import ="auxclases.*"%>
<%@ page import = "org.hibernate.exception.ConstraintViolationException"%>
<%@ page import = "org.hibernate.exception.GenericJDBCException"%>
<%@ page import = "org.hibernate.*"%>

<%@ page import ="java.util.*"%>
<%@ page import = "util.*"%>

<%@ page import ="java.util.Date"%>
<%@ page import ="auxclases.*"%>

<%@ page import = "org.hibernate.exception.ConstraintViolationException"%>
<%@ page import = "org.hibernate.exception.GenericJDBCException"%>
<%@ page import = "org.hibernate.*"%>


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



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>modificar Licencia</title>

<jsp:useBean id="ina"     scope="session" 
class="funciones.Ser_Inasistencias" />

<script language="javascript" src="varios.js"> </script>


<style type="text/css">
<!--
.Estilo2 {color: #FF0000}
.Estilo3 {color: #000000}
.Estilo4 {color: #808080}
.Estilo5 {
	color: #0000FF;
	font-weight: bold;
	font-style: italic;
}
.Estilo6 {color: #0000FF}
-->
</style>
<link href="reporte.css" rel="stylesheet" type="text/css">
</head>
<%

//Obtengo la sesion

Session se = HibernateUtil.currentSession();

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

String texto_ficha=request.getParameter("ficha");
String texto_apellido=request.getParameter("apellido");
String texto_nombre=request.getParameter("nombre");


%>


<body >
<p class="unnamed">
  <%@include file="menu.jsp"%>
  <%

if(request.getParameter("BotonModificar")==null&&request.getParameter("BotonEliminar")==null&&request.getParameter("Cancelar")==null){%>
  
</p>
<form  name="f1" action="guardarLicencia.jsp"  onSubmit="return verif_todo()"  class="unnamed">

          <p class="titulo1">Licencia de  <%=texto_apellido%> </p>
		  <p class="titulo1">Numero Ficha:  <%=texto_ficha%></p>
          
          
      
          Desde:
            <input type="text" name="dia_d" size="2" maxlength="2"  value="<%=request.getParameter("fecha_desde_dia")%>" />
          /
          <input type="text" name="mes_d" size="2" maxlength="2"  value="<%=request.getParameter("fecha_desde_mes")%>"/>
          /
          <input type="text" name="anio_d" size="4" maxlength="4"  value="<%=request.getParameter("fecha_desde_anio")%>"/>
          
                                                            Hasta:
                              <input type="text" name="dia_h" size="2" maxlength="2"   value="<%=request.getParameter("fecha_hasta_dia")%>"/>
          /
          <input type="text" name="mes_h" size="2" maxlength="2"  value="<%=request.getParameter("fecha_hasta_mes")%>" />
          /
          <input type="text" name="anio_h" size="4" maxlength="4"  value="<%=request.getParameter("fecha_hasta_anio")%>"/> 
          Con sueldo
                    <input name="ConS" type="checkbox" <% if(request.getParameter("sueldo")!=null&&request.getParameter("sueldo").equals("true")){%> checked="checked"<%}%> />
                     Motivo 

                     <% ArrayList listaMotivo=ina.darListaMotivoLicencia(); %>

                     <select name="menuTipoLicencia" onChange="cargarMot()">
		                <%
					Iterator it = listaMotivo.iterator();
					while (it.hasNext()) {
			  		      MotivoLicencia mot = (MotivoLicencia)it.next();
			  		%>
			            <%
					if(mot.getDescripcion().equals(request.getParameter("motivo"))){%> 
		                <option selected="selected" > <%=mot.getDescripcion()%> </option> 
			            <%}else {%> 
			            <option> <%=mot.getDescripcion() %> </option> 
		                <%
					  }//else
					}//while
					%>
				      
  </select>
            </p>
  </p>
  Duracion   
      <input name="campo_duracion" type="text" size="4" value="<%=request.getParameter("duracion")%>"/>
          <p>        Observaciones 
             <input name="campo_observaciones" type="text" size="90"  value="<%=request.getParameter("observaciones")%>"/>
             <input name="textficha" type="hidden" value="<%=request.getParameter("ficha")%>">
             <input name="textoID" type="hidden" value="<%=request.getParameter("id")%>">
  </p>
          <p  c>
             <input type="submit" name="BotonModificar" value="Modificar"   size="10"/>
             <input type="submit" name="BotonEliminar"  value="Eliminar"> 
             <input name="Cancelar" type="submit"  value="Cancelar"/>
  </p>
</form>
  



  
      <p>
          <%}else if(request.getParameter("BotonModificar")!=null&&request.getParameter("BotonEliminar")==null&&request.getParameter("Cancelar")==null){%>  
          <b  class="unnamed">    
      Resultados:
        <%

 Integer numficha=new Integer(request.getParameter("textficha"));
 
	String id_cemen=((Cementerio)session.getAttribute("CEMENTARY")).getCem_id();
	Cementerio cem=ina.darCementerio(id_cemen);
	
 ina.crearListaModificarLicencias(numficha.intValue(),cem);

	Licencia lic1=new Licencia();
	
	Integer diaD=new Integer(texto_diaDesde);
	Integer diaH=new Integer(texto_diaHasta);
	Integer mesD=new Integer(texto_mesDesde);
	Integer mesH=new Integer(texto_mesHasta);
	Integer anioD=new Integer(texto_anioDesde);
	Integer anioH=new Integer(texto_anioHasta);
	
	Date f_d=new Date(anioD.intValue()-1900, mesD.intValue()-1,diaD.intValue(), 0, 0, 0);
	Date f_h=new Date(anioH.intValue()-1900, mesH.intValue()-1,diaH.intValue(), 0, 0, 0);
			
			lic1.setFecha_desde(f_d);
			lic1.setFecha_hasta(f_h);
			
			//lic1.setFecha_desde(ina.fecha_Guardar_Base(lic1.getFecha_desde()));
			//lic1.setFecha_hasta(ina.fecha_Guardar_Base(lic1.getFecha_hasta()));
			
			lic1.setFicha(numficha.intValue());
		
			Calendario calen=new Calendario();
		
		    if(request.getParameter("campo_duracion")!=null){
		    Integer num=new Integer(request.getParameter("campo_duracion"));
			lic1.setDuracion(num.intValue());
		    }else{
		    lic1.setDuracion(1);
		    }
			
			lic1.setCon_sueldo(true);
		
			lic1.setMotivo(ina.darMotivo(texto_motivo));
			
			lic1.setObservaciones(texto_obsevaciones);
			lic1.setAgente(ina.darAgente());
			
			Integer numID=new Integer(request.getParameter("textoID"));%>
			    

        <%if(ina.Esta_licencia_a_modificar(lic1.getFecha_desde(),lic1.getFecha_hasta(),numID.intValue(),cem)){
Licencia licenciarepetida=ina.getLicenciarepetida();
%>
		  
  </b></p>
      <p><b  class="unnamed">La licencia no se a podido modificar dado que coinciden fechas con otra licencia:
           

    
    </b></p>
      <b  class="unnamed">
 <tbody>    
   <tr> 
		<td class="Estilo2"><%=licenciarepetida.getFecha_desde()%></td>
		<td class="Estilo2"><%=licenciarepetida.getFecha_hasta()%></td>
		<td class="Estilo2"><%=licenciarepetida.getDuracion()%></td>		
		<td class="Estilo2"><%=licenciarepetida.isCon_sueldo()%></td>		
		<td class="Estilo2"><%=licenciarepetida.getMotivo().getDescripcion()%></td>		
		<td class="Estilo2"><%=licenciarepetida.getObservaciones()%></td>
  </tr>
 </tbody>
    </b>
      <p><b  class="unnamed">    </table>
  
  <%
 }else{//se puede modificar

		Transaction t = se.beginTransaction();
		String id=request.getParameter("textoID");
		lic1 =(Licencia) se.get(Licencia.class, new Integer(id));
		
		Integer diaD1=new Integer(texto_diaDesde);
		Integer diaH1=new Integer(texto_diaHasta);
		Integer mesD1=new Integer(texto_mesDesde);
		Integer mesH1=new Integer(texto_mesHasta);
		Integer anioD1=new Integer(texto_anioDesde);
		Integer anioH1=new Integer(texto_anioHasta);
		
		Date fd=new Date(anioD.intValue()-1900, mesD.intValue()-1,diaD.intValue(), 0, 0, 0);
		Date fh=new Date(anioH.intValue()-1900, mesH.intValue()-1,diaH.intValue(), 0, 0, 0);
	
			lic1.setFecha_desde(fd);
			lic1.setFecha_hasta(fh);
			//lic1.setFecha_desde(ina.fecha_Guardar_Base(lic1.getFecha_desde()));
			//lic1.setFecha_hasta(ina.fecha_Guardar_Base(lic1.getFecha_hasta()));
			lic1.setFicha(numficha.intValue());
			Calendario calen1=new Calendario();
			Integer num=new Integer(request.getParameter("campo_duracion"));
			lic1.setDuracion(num.intValue());
		    if(texto_ConSueldo!=null)
			lic1.setCon_sueldo(true);else lic1.setCon_sueldo(false);
			lic1.setMotivo(ina.darMotivo(texto_motivo));
			lic1.setObservaciones(texto_obsevaciones);
			
		se.update(lic1);
		se.flush();
		t.commit();
		%>
</b></p>
      <p><b  class="unnamed">      La Licencia ha sido modificada !!!
      <%}%>
            <%}%>
          

      
        <%if(request.getParameter("BotonEliminar")!=null){
		Transaction t1 = se.beginTransaction();
		String id=request.getParameter("textoID");
	    se.createQuery("Delete Licencia where id="+id).executeUpdate();
		t1.commit();
	%>
</b></p>
      <p><b  class="unnamed">La Licencia ha sido eliminada!!!
        <%}
		
				%>
    
      </b>
          <%HibernateUtil.closeSession();%>
      
            </p>
</body>
</html>
