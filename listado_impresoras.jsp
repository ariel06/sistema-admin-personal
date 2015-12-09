
<%@ page import = "java.util.*" %>
<%@ page import = "clases.*" %>

<%@ page import = "funciones.*" %>
<%@ page import = "util.*" %>
<%@ page import = "org.hibernate.*" %>
<html>
<head>
<link rel="STYLESHEET" type="text/css" href="reporte.css">
<link rel="STYLESHEET" type="text/css" href="tablas.css">
<script language="javascript" src="varios.js"> </script>
<title>Listado de Impresoras</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

</head>
<%@include file="header.jsp" %>
<body>
	
	<%
if (session.getAttribute("usuario")!=null) {
	
	Session sesion = HibernateUtil.currentSession();

//request.getParameter("funcion") != null);
	 %>
	 
<%@include file="menu.jsp"%>
<br />

	<form id="form1" method="post" target="_blank" onSubmit="return check_ordenar(orden)" class="form">


        </form>
</body>
<%@include file="footer.jsp" %>
</html>
