<%
   }
   catch (Exception e) {
   %>
      <p><h1>Se ha producido un error al cargar la p&aacute;gina</h1></p> <%= e.getMessage() %>
   <%
      e.printStackTrace();
   }
   finally {
     HibernateUtil.closeSession();
   }
%>