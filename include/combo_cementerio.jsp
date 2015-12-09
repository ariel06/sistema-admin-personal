 <select name="cem" style="width:140px">
 <% String cementerio = request.getParameter("cem");
     boolean restriccion = (cementerio!=null);
	 if(!restriccion) {%>
	   <option value="TD">Todo</option>
	 <%	   
	 }
	 if (!restriccion || cementerio.equals("DG")) { %>
		<option value="DG">Direcci&oacute;n General</option>
	 <% }
	if (!restriccion || cementerio.equals("CH")) { %>
		<option value="CH">Chacarita</option>
	<% }
	if (!restriccion || cementerio.equals("CR")) { %>
		<option value="CR">Crematorio</option>
	<% }
	if (!restriccion || cementerio.equals("FL")) { %>
		<option value="FL">Flores</option>
	<% }
	if (!restriccion || cementerio.equals("RE")) { %>
		<option value="RE">Recoleta</option>
	<% }
%>
