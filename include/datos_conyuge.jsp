<%
Conyuge cg = null;
if (modificacion) {
  cg = ag.getConyuge();
}
%>
<table style="background:#CCCCCC">
 <tr>
	<td>Casado/a</td>
	<td><input name="iscasado" type="checkbox" onclick="javascript:cambiar(this, 32,42)" <%if(modificacion && cg!=null) {%>checked="checked"<%}%>/td>
 </tr>
 <tr>
	<td><p>Apellido Casada </p>
	</td>
	<td><input type="text" name="ape_casada"<%if(modificacion && ag.getApellido_casada()!=null){%> value="<%=ag.getApellido_casada()%>"<%}%>/></td>
 </tr>	

	 <%
	 gc = null;
     if (modificacion && ag.getFecha_casado()!=null) {
	   gc = new GregorianCalendar();
	   gc.setTime(ag.getFecha_casado());
	 }
     %>

 <tr>
	<td><p>Fecha Casamiento </p>
	</td>
	<td><input type="text" name="dia_casamiento" size="2" maxlength="2" <%if(gc!=null){%> value="<%=gc.get(Calendar.DAY_OF_MONTH)%>"<%}%>/>
		<input type="text" name="mes_casamiento" size="2" maxlength="2" <%if(gc!=null){%> value="<%=(gc.get(Calendar.MONTH)+1)%>"<%}%>/>
		<input type="text" name="anio_casamiento" size="4" maxlength="4" <%if(gc!=null){%> value="<%=gc.get(Calendar.YEAR)%>"<%}%>/>
	</td>
 </tr>
 <tr>
	<td><p>Apellido Conyuge </p>
	</td>
	<td><input type="text" name="ape_conyuge" <%if(modificacion && cg !=null){%> value="<%=cg.getApellido()%>"<%}%>/></td>
 </tr>
 <tr>
	<td><p>Nombre Conyuge </p>
	</td>
	<td><input type="text" name="nom_conyuge" <%if(modificacion && cg !=null){%> value="<%=cg.getNombre()%>"<%}%>/></td>
 </tr>
 
 <td>Nacionalidad Conyuge</td>
	<td>
		<select name="menu_nac_conyuge">
		  <option>&nbsp;&nbsp;</option>
		<%
		Iterator it5 = nac.iterator();
		while (it5.hasNext()) {
			Nacionalidad nc = (Nacionalidad) it5.next();
			%> <option <%if(modificacion && cg!=null &&cg.getNacionalidad()!=null &&cg.getNacionalidad().getDescripcion().equals(nc.getDescripcion())) {%> selected="selected"<%}%>> <%=nc.getDescripcion() %>  </option> <%
		}
		%>
		</select>
	</td>
 </tr>
 
 	 <%
	 gc = null;
     if (modificacion && cg!= null && cg.getFechaNacimiento()!=null) {
	   gc = new GregorianCalendar();
	   gc.setTime(cg.getFechaNacimiento());
	 }
     %>
 
 <tr>
	<td><p>Fecha Nacimiento </p> </td>
	<td><input type="text" name="dia_nac_conyuge" size="2" maxlength="2" <%if(gc!=null){%> value="<%=gc.get(Calendar.DAY_OF_MONTH)%>"<%}%>/>
		<input type="text" name="mes_nac_conyuge" size="2" maxlength="2" <%if(gc!=null){%> value="<%=(gc.get(Calendar.MONTH)+1)%>"<%}%>/>
		<input type="text" name="anio_nac_conyuge" size="4" maxlength="4" <%if(gc!=null){%> value="<%=gc.get(Calendar.YEAR)%>"<%}%>/>
	</td>
 </tr>

 <tr>
	<td><p>Trabaja</p>
	</td>
	<td><input type="checkbox" onclick="javascript:cambiar(this, 43,46)" name="trabaja" <%if(modificacion && cg !=null && cg.isTrabaja()){%> checked="checked"<%}%> /></td>
 </tr>			  
 <tr>
	<td><p>Trabaja en</p>
	</td>
	<td><input type="text" name="trabaja_en" <%if(modificacion && cg!=null && cg.getDondeTrabaja()!=null){%> value="<%=cg.getDondeTrabaja()%>"<%}%> /></td>
 </tr>
 	 <%
	 gc = null;
     if (modificacion && cg!= null && cg.getTrabajaDesde()!=null) {
	   gc = new GregorianCalendar();
	   gc.setTime(cg.getTrabajaDesde());
	 }
     %>

 <tr>
	<td><p>Trabaja desde </p>
   </td>
	<td><input type="text" name="dia_desde" size="2" maxlength="2" <%if(gc!=null){%> value="<%=gc.get(Calendar.DAY_OF_MONTH)%>"<%}%>/>
		<input type="text" name="mes_desde" size="2" maxlength="2" <%if(gc!=null){%> value="<%=(gc.get(Calendar.MONTH)+1)%>"<%}%>/>
		<input type="text" name="anio_desde" size="4" maxlength="4" <%if(gc!=null){%> value="<%=gc.get(Calendar.YEAR)%>"<%}%>/>
	</td>
 </tr>
</table>
<%if(modificacion && cg==null){%><script> deshabilitar(32,45) </script><%}%>