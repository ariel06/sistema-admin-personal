<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%@ page import = "bean.*" %>
<%@ page import = "funciones.*" %>
<%@ page import = "util.*" %>
<%@ page import = "auxclases.*" %>

<title>Reconocimiento de usuario</title>
<style type="text/css">
<!--
.Estilo4 {color: #000000}
.Estilo5 {font-weight: bold}
-->
</style>
</head>
<body>
<%

   boolean fallo = false;
   session.setAttribute("usuario", null);
   String nombre = request.getParameter("usuario");
   String pass = request.getParameter("clave");
   if (nombre!=null && pass!=null) {
      Usuario user = Logueo.esta_usuario(nombre, pass);
	  if (user!=null) {
	     session.setAttribute("usuario", user);
		 user.getPerfil().getFunciones();
		 %>
		 <script>window.location="principal.jsp"</script>
		 <%
	  }
	  else {
	    fallo=true;
		System.gc();
	  }
	  HibernateUtil.closeSession();
   }

%>


<form name="principal" action="index.jsp" method="post" onSubmit="return validate( this )">
  <p>
    <input type="hidden" name="state" value="login">
</p>
  <p>&nbsp;</p>
  <p>&nbsp;  </p>
  <table class="tabla_borde0_center" align="center">
    <tr> 
      <td nowrap bordercolor="#000000" bgcolor="#CCCCCC" align="center"><p>&nbsp;</p>
        <p><strong>Sistema de Personal
              de Cementerios</strong>
        </p>
        <p class="Estilo4"><br>
        </p></td>
    </tr>
    <tr> 
      <td><table class="tabla_borde0_center">
          <tr>
            <td bgcolor="#CCCCCC"> <table class="tabla_borde0_center Estilo5">
                <tr> 
                  <td class="field_name" align="right">Usuario</td>
                  <td class="field_value"> <input type="text" name="usuario" size="30" maxlength="20"> 
                  </td>
                </tr>
                <tr> 
                  <td class="field_name" align="right">Clave</td>
                  <td class="field_value"> <input type="password" name="clave" size="30" maxlength="20"> 
                  </td>
                </tr>
                <tr align="center"> 
                  <td colspan="2" class="field_name"> <input name="submit" type="submit" value="Aceptar"> 
                    <input name="reset" type="reset" value="Cancelar"> </td>
                </tr>
              </table></td>
          </tr>
		<%
		   if (fallo) {
		%>  
		  <tr>
		    <td style="color:#FF0000">Nombre de usuario o contrase&ntilde;a incorrecta</td>
		  </tr>
		<%
		  }
		%>
		  
        </table></td>
    </tr>
  </table>
  <br>

</form>

</body>
</html>
