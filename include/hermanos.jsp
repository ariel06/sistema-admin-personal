<style>
 .caja {text-align:center }
</style>
<b>Hermanos</b> <br />
<table>	
  <thead bgcolor="#CCCCCC">
	  <tr>
		  <th width="150" align="left" class="caja">Apellido</th>
		  <th width="150" align="left" class="caja">Nombre</th>
		  <th width="40" align="left" class="caja">sexo</th>
		  <th width="50" align="left" class="caja">Doc</th>
		  <th width="100" align="left" class="caja">Numero</th>
		  <th width="100" align="left" class="caja">Nacionalidad</th>		  
		  <th class="caja">Borrar</th>
	  </tr>
	</thead>
	<tbody id="tbody_he">
	<%
	 if (modificacion) {
		int cant_hermanos = 0;
		Iterator k = ag.getHermanos().iterator();
		while (k.hasNext()) {
		cant_hermanos++;
		  Hermano hno = (Hermano) k.next();
	%>
		<tr id="hnodo_tr<%=cant_hermanos%>">
			<td><input type="text" name="ape_he<%=cant_hermanos%>" value="<%=hno.getApellido()%>"/></td>
			<td><input type="text" name="nom_he<%=cant_hermanos%>" value="<%=hno.getNombre()%>"/></td>
			<td><select name="sexo_he<%=cant_hermanos%>">
				<option>&nbsp;&nbsp;</option>
				<option<%if(hno.getSexo()=='M'){%> selected="selected"<%}%>>M</option>
				<option<%if(hno.getSexo()=='F'){%> selected="selected"<%}%>>F</option>
				</select>
			</td>
			
			<td>
				<select name="doc_he<%=cant_hermanos%>">
				   <option>&nbsp;&nbsp;</option>
				   <% Iterator id = doc.iterator();
				      while (id.hasNext()) {
					     TipoDocumento td1 = (TipoDocumento) id.next();
				   %>
				        <option <%if (hno.getTipoDoc()!=null && hno.getTipoDoc().getDesc_tipo_documento().equals(td1.getDesc_tipo_documento())){%> selected="selected"<%}%>><%=td1.getDesc_tipo_documento()%></option>
					<% 
					 }
				   %>
				</select>
			</td>
			
			<td>
			  <input type="text" name="num_he<%=cant_hermanos%>" size="10" value="<%=hno.getNumeroDoc()%>"/>
			</td>
			
			<td>
				<select name="nac_he<%=cant_hermanos%>">
				   <option>&nbsp;&nbsp;</option>
				   <% Iterator l = nac.iterator();
				      while (l.hasNext()) {
				         Nacionalidad nn = (Nacionalidad) l.next();
				   %>   
				   		 <option <% if (hno.getNacionalidad()!=null && hno.getNacionalidad().getDescripcion().equals(nn.getDescripcion())){%> selected="selected" <%}%>><%=nn.getDescripcion()%></option>
				   <%
				   }
				   %>
				</select>
			</td>
			<td>
			    <a href="javascript:hborrar(hnodo_tr<%=cant_hermanos%>)"><img src="papelera.jpg" border="0"/></a>
			</td>
			
	<%
		} 
	%>
	   <script> var hcount=<%=cant_hermanos%></script>
	<%
	  }
	%>
	</tbody>
  </table>
  <input type="button" onclick="javascript:hagregar()" value="Agregar" />