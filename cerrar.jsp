<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@page import ="util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Cerrar Aplicación</title>
</head>
<%
	HibernateUtil.getSessionFactory().close();
%>
<body>
	Session Factory carrada
</body>
</html>
