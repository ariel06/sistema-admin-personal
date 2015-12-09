<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page import = "bean.*" %>
<%@ page import = "org.hibernate.*" %>
<%@ page import = "util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Documento sin t&iacute;tulo</title>
<script>
function verif_pass(f) {
 if (f.elements[0].value=="" || f.elements[1].value=="" || f.elements[2].value=="") {
   alert("Debe completar todos los campos");
   return false;
 }
 else
  if (f.elements[1].value != f.elements[2].value) {
    alert("\"Contraseña nueva\" no coincide con \"Repetir contraseña\"");
    return false;
  }
  return true;
}
</script>
<style>

.cuadro 
  		{
		border-top: 2px solid #000000;  border-bottom:2px solid #000000;
		border-left: 2px solid #000000; border-right:2px solid #000000;
		}
</style>
</head>
<body>
<%
if (session.getAttribute("usuario")!=null) {
%>
  <%@include file = "menu.jsp" %>
<%
   String actual = request.getParameter("actual");
   String nueva = request.getParameter("nueva");
   if (actual != null && nueva != null) {
     Usuario us = (Usuario) session.getAttribute("usuario");
	 if (!us.getClave().equals(actual)) {
	 %>
	    <div style="padding-top:2cm"></div>
		<table align="center" style="background:#CCCCCC" class="cuadro">
			  <tr>
				<td>La clave ingresada es incorrecta</td>
			 </tr>
			 <tr>
				<td style="border-top:2px solid #000000; padding-top:0.5cm" align="center">
					<form action="principal.jsp" method="post">
					  <input type="submit" value="Aceptar"/>
					</form>
				</td>
			 </tr>
		</table>
	 <%
	 }
	 else {
	   user.setClave(nueva);
	   Session s2 = HibernateUtil.currentSession();
	   Transaction tx2 = s2.beginTransaction();
	   s2.update(us);
       tx2.commit();
       HibernateUtil.closeSession();
	   %>
	 		    <div style="padding-top:2cm"></div>
		<table align="center" style="background:#CCCCCC" class="cuadro">
			  <tr>
				<td>La clave se modific&oacute; con exito</td>
			 </tr>
			 <tr>
				<td style="border-top:2px solid #000000; padding-top:0.5cm" align="center">
					<form action="principal.jsp" method="post">
					  <input type="submit" value="Aceptar"/>
					</form>
				</td>
			 </tr>
		</table>  
	   <%
	 }
   }
   else {




%>
		<div style="position:relative;left:30%;top:30%; right:30%; width:450px; z-index:0">
		<form action="cambiar_pass.jsp" method="post" onsubmit="return verif_pass(this)">
		<table>
		  <tr>
			<td>Contrase&ntilde;a actual</td>
			<td><input type="password" name="actual" size="20" /></td>
		  </tr>
		  <tr>
			<td>Contrase&ntilde;a  nueva</td>
			<td><input type="password" name="nueva" size="20" /></td>
		  </tr>
		  <tr>
			<td>Retetir contrase&ntilde;a</td>
			<td><input type="password" name="repite" size="20" /></td>
		  </tr>
       </table>
	   <input type="submit" value="Aceptar" /><input type="button" value="Cancelar" onclick="window.location='menu.jsp'" />
	 </form>
	 </div>

<%
  }
} else {
%>
<h1>No tiene permiso para acceder a esta p&aacute;gina</h1>
<%
}
%>

</body>
</html>
