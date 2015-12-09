<table style="background:#CCCCCC">
  <tr>
	<td><p>Nivel</p>
	</td>
	<td><input type="text" size="4" maxlength="1" name="nivel" <%if(modificacion && ag.getNivel()!=null){%> value="<%=ag.getNivel()%>"<%}%> /></td>
  </tr>
  
  <tr>
	<td><p>Grado</p>
	</td>
	<td><input type="text" size="4" maxlength="1" name="grado" <%if(modificacion && ag.getGrado()>0){%> value="<%=ag.getGrado()%>"<%}%>/></td>
  </tr>
  
 <tr>
	<td>Funci&oacute;n</td>
	<td>
		<select name="menu_funcion" style="width:190px;">
		  <option>&nbsp;&nbsp;</option>
		<%
		
		Iterator it4 = fn.iterator();
		while (it4.hasNext()) {
			Funcion fun = (Funcion) it4.next();
			%> <option <%if(modificacion && ag.getFuncion()!=null && ag.getFuncion().getDescripcion().equals(fun.getDescripcion())) {%> selected="selected"<%}%>> <%= fun.getDescripcion() %>  </option> <%
		}
		%>
		</select>
	</td>
 </tr>
     <%
	 gc = null;
     if (modificacion && ag.getFecha_ingreso_mun()!=null) {
	   gc = new GregorianCalendar();
	   gc.setTime(ag.getFecha_ingreso_mun());
	 }
     %>

 <tr>
	<td><p>Fecha ingreso a GCBA</p>
	</td>
	<td><input type="text" size="2" maxlength="2" name="dia_ing_gcba" <%if(gc!=null){%> value="<%=gc.get(Calendar.DAY_OF_MONTH)%>"<%}%>/>
		<input type="text" size="2" maxlength="2" name="mes_ing_gcba" <%if(gc!=null){%> value="<%=(gc.get(Calendar.MONTH)+1)%>"<%}%> />
		<input type="text" size="4" maxlength="4" name="anio_ing_gcba" <%if(gc!=null){%> value="<%=gc.get(Calendar.YEAR)%>"<%}%> /></td>
  </tr>
     
	 <%
	 gc = null;
     if (modificacion && ag.getFecha_ingreso_dgcem()!=null) {
	   gc = new GregorianCalendar();
	   gc.setTime(ag.getFecha_ingreso_dgcem());
	 }
     %>

 <tr>
	<td><p>Fecha ingreso a DGCEM</p>
	</td>
	<td><input type="text" size="2" maxlength="2" name="dia_ing_dgcem" <%if(gc!=null){%> value="<%=gc.get(Calendar.DAY_OF_MONTH)%>"<%}%> />
		<input type="text" size="2" maxlength="2" name="mes_ing_dgcem" <%if(gc!=null){%> value="<%=(gc.get(Calendar.MONTH)+1)%>"<%}%> />
		<input type="text" size="4" maxlength="4" name="anio_ing_dgcem" <%if(gc!=null){%> value="<%=gc.get(Calendar.YEAR)%>"<%}%> /></td>
 </tr>

 <tr>
	<td><p>Sueldo bruto</p>
	</td>
	<td><input type="text" size="8" name="sueldo" <%if(modificacion&&ag.getSueldo_bruto()>0){%> value="<%=ag.getSueldo_bruto()%>"<%}%>  /></td>
 </tr>			 
 
 <tr>
	<td><p>Horario de trabajo</p></td>
	<td>Desde: <input type="text" size="5" maxlength="5" name="hora_desde" <%if(modificacion&&ag.getHora_desde()!=null){%> value="<%=ag.getHora_desde()%>"<%}%> /> 
	(hh:mm) </td>
 </tr>			 			 
 
 <tr>
	<td></td>
	<td>Hasta: &nbsp;<input type="text" size="5" maxlength="5" name="hora_hasta" <%if(modificacion&&ag.getHora_hasta()!=null){%> value="<%=ag.getHora_hasta()%>"<%}%> /> 
	(hh:mm) </td>
 </tr>			 			 			 

 <tr>
    <td>Cementerio </td>
	<% String pcem = request.getParameter("cem");
	   boolean restriccion = (pcem!=null);
	   if (pcem == null) pcem = "";

	%>
	<td><select name="menu_cem">
		  <% boolean enc_cem = false;
		     Iterator ic = cem.iterator();
		     while(ic.hasNext()) {
			   Cementerio cm = (Cementerio) ic.next();
			   if (!restriccion || cm.getCem_id().equals(pcem)) {
		  %>
			   <option value="<%=cm.getCem_id()%>" <%if(modificacion && ag.getCementerio()!=null && ag.getCementerio().getDescripcion().equals(cm.getDescripcion())) {%> selected="selected"<%enc_cem=true;}%>><%=cm.getDescripcion()%></option>
		  <%
		       }
			 }
		     if (!enc_cem) { %>
				<option selected="selected">&nbsp;&nbsp;</option>
		     <% }
		  %>
		</select>
 </tr>
 <tr>
	<td>Guardia &nbsp;&nbsp;
    <input type="checkbox" name="guardia" <%if(modificacion && ag.isGuardia()){%> checked="checked" <%}%>/></td>
	<td>Empleo publico &nbsp;&nbsp;&nbsp;
    <input type="checkbox" name="epublico" <%if(modificacion && ag.isEmpleo_publico()){%> checked="checked" <%}%>/></td>
   
 </tr>
 
 
 <tr>
	<td><p>Observaciones</p>
	</td>
	<td><input type="text" name="obser" <%if(modificacion && ag.getObservaciones()!=null){%> value="<%=ag.getObservaciones()%>" <%}%>/></td>
 </tr>
</table>