<%@include file="header.jsp" %>
<%@page import="org.hibernate.ObjectNotFoundException"%>
<%@page import="bean.Agente"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">



<script language="javascript" src="varios.js"> </script>

<script language="javascript">  

function alertError( msg, input ) {
	alert( msg ) ;
	if ( input && input.focus ) input.focus( ) ;
	return false ;
}

  function verif_fichas() {

    var nueva_ficha = document.f1.ficha_nuevo;
     var nueva_ficha1 = document.f1.ficha_nuevo1;
if ( null == nueva_ficha.value || "" == nueva_ficha.value ) {return alertError('Los numeros de ficha no pueden ser nulos.',document.f1.ficha_nuevo); }
if ( null == nueva_ficha1.value || "" == nueva_ficha1.value ) {return alertError('Los numeros de ficha no pueden ser nulos.',document.f1.ficha_nuevo1); }

if(nueva_ficha.value != nueva_ficha1.value) return alertError('Los nuevos numeros de ficha no son iguales.');


document.URL='edicion_ficha.jsp?nueva_ficha='+nueva_ficha.value+'&ficha='+document.f1.ficha.value;

return false;




	/*
	if (verificar_fecha(diad.value, mesd.value, aniod.value) && verificar_fecha(diah.value, mesh.value, anioh.value)) {
	  return true;
	}
	else
	  return false;*/
  }
		
</script>



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

<%

Session sesion = HibernateUtil.currentSession();


if(request.getParameter("nueva_ficha")==null){


 try {
  

     /*  List agentes = sesion.createQuery("from Agente as ag where ag.ficha="+it.intValue()).list();
       sesion.load(ag, new Integer(request.getParameter("ficha")));*/



   List lista_agente = sesion.createQuery("from bean.Agente as ag where ag.ficha ="+request.getParameter("ficha").toString()).list();
   Agente ag=null;

       Iterator ite1 = lista_agente.iterator();
        if(!lista_agente.isEmpty())
        {
            ag = (Agente)ite1.next();

          
      

         }%>
       <%=ag.getApellido_paterno()%> <%=ag.getNombres()%>
     

   



  
     
    <body>

      
        <form name="f1">
      
        <table>
            <tr><td>Numero de ficha actual</td> <td> <input type="text" size="10" name="ficha"  disabled value="<%=ag.getFicha()%>" /> </td></tr>
              <tr><td>Numero de ficha nuevo</td> <td> <input type="text" size="10" name="ficha_nuevo"   /></td></tr>
                <tr><td>Repetir numero de ficha nuevo</td> <td> <input type="text" size="10" name="ficha_nuevo1"   /></td></tr>

        </table>
              <br>
                  <input type="button" name="boton" value="Procesar cambio ficha" onclick="verif_fichas()"  />
</form>

    </body>
<%
  } catch (ObjectNotFoundException e) {%>
           Error en procesar....
           <%}
 }else{%>


nueva ficha<%=request.getParameter("nueva_ficha")%>

ficha<%=request.getParameter("ficha")%>
<%

 List lista_agente = sesion.createQuery("from bean.Agente as ag where ag.ficha ="+request.getParameter("ficha").toString()).list();


   Agente ag=null;

       Iterator ite1 = lista_agente.iterator();
       
            ag = (Agente)ite1.next();
          


         

       /*ag.setNumero_ficha(numero_ficha);*/
      //  ag.setDepto("h");

       Integer ficha = new Integer(request.getParameter("nueva_ficha"));
     
      
     

 ag.setNumero_ficha(ficha.intValue());
 Transaction t = sesion.beginTransaction();
  
  sesion.update(ag);
        sesion.flush();
        t.commit();


       %>
El Numero de ficha fue actualizado con exito.





<%}
%>


<%@include file="footer.jsp" %>