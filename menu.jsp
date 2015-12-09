<%@ page import = "bean.Usuario" %>
<%@ page import = "view.*" %>
<LINK href="css/barra_2006.css" type=text/css rel=stylesheet>
<SCRIPT src="imagenes/barra5.js" type=text/javascript></SCRIPT>

<table style="background-color: #DFDFDF; padding-bottom:0.8cm; padding-top:0.2cm; text-align:right; width:100%; height:40px">
  <tr>
  	<td><b>Sistema de Personal de Cementerios</b></td>
  </tr>
</table>
<%
Usuario user = (Usuario) session.getAttribute("usuario");
if (user != null) {
 Menu menu = new Menu();
%>
<%=menu.mostrarMenu(user)%>
<% } 
	else {
%>
	<%@include file = "include/caducado.jsp" %>
<%
	}
%>
<br/>