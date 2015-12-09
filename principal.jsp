<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import = "auxclases.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de Administracion de Personal</title>
</head>
<body>
<%
  Usuario us = (Usuario) session.getAttribute("usuario");
  if ( us != null ) {
%>

<%@include file = "menu.jsp" %>
<img src="imagenes/logo.png" style="position: relative; left: 40%; top: 15%">
<% } else { %>
	<%@include file = "include/caducado.jsp" %>
<% } %>
</body>
</html>