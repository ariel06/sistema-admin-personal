<br />
  <b>Domicilio</b>
<table id="domicilio" style="background:#CCCCCC">
  <tr>
	<td>Calle</td>
	<td><input type="text" size="15" name="calle" <%if(modificacion && ag.getCalle()!=null) {%> value="<%=ag.getCalle()%>"<%}%>/></td>
	<td>Nro <input type="text" size="5" name="nro" <%if(modificacion && ag.getNumero_dom()!=null) {%> value="<%=ag.getNumero_dom()%>"<%}%> />
	Piso <input type="text" size="5" name="piso" <%if(modificacion && ag.getPiso()!=null) {%> value="<%=ag.getPiso()%>"<%}%>/></td>
	<td>Depto <input type="text" size="5" name="depto" <%if(modificacion && ag.getDepto()!=null) {%> value="<%=ag.getDepto()%>"<%}%>/></td>
  </tr>
  <tr>
	<td>Localidad</td>
	<td><input type="text" size="15" name="localidad" <%if(modificacion && ag.getLocalidad()!=null) {%> value="<%=ag.getLocalidad()%>"<%}%>/> </td>
	<td>Provincia <input type="text" size="15" name="provincia" <%if(modificacion && ag.getProvincia()!=null) {%> value="<%=ag.getProvincia()%>"<%}%>/> </td>
	<td>Pais <input type="text" size="15" name="pais" <%if(modificacion && ag.getPais()!=null) {%> value="<%=ag.getPais()%>"<%}%>/> </td>		
  </tr>
</table>
