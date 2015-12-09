<style>
 .caja {text-align:center }
</style>
<b>Hijos</b> <br />
<table>	
  <thead bgcolor="#CCCCCC">
	  <tr>
		  <th width="150" align="left" class="caja">Apellido</th>
		  <th width="150" align="left" class="caja">Nombre</th>
		  <th width="130" align="left" class="caja">Fecha Nac</th>
		  <th width="40" align="left" class="caja">sexo</th>
		  <th width="50" align="left" class="caja">Doc</th>
		  <th width="100" align="left" class="caja">Numero</th>
		  <th width="100" align="left" class="caja">Nacionalidad</th>		  
		  <th class="caja">Borrar</th>
	  </tr>
	</thead>
	<tbody id="tbody_hijos">
	<%
	if (modificacion && ag.getHijos()!=null) {
	  Iterator j = ag.getHijos().iterator();
	  int cant_hijos = 0;
	  while (j.hasNext()) {
	    cant_hijos++;
		Hijo h = (Hijo) j.next();
	  %>
	  <tr id="nodo_tr<%=cant_hijos%>">
		  <td width="150" align="left" class="caja"><input type="text" size="20" name="ape_hijo<%=cant_hijos%>" <%if (h.getApellido()!=null){%> value="<%= h.getApellido()%>"<%}%> /></td>
		  <td width="150" align="left" class="caja"><input type="text" size="20" name="nom_hijo<%=cant_hijos%>" <%if (h.getNombre()!=null){%> value="<%= h.getNombre()%>" /><%}%></td>

      <% gc = null;
         if (modificacion && h.getFechaNacimiento()!=null) {
	       gc = new GregorianCalendar();
	       gc.setTime(h.getFechaNacimiento());
	     }
  
      %>
		  <td width="135" align="left" class="caja"><%if(gc!=null){%><input type="text" size="2" name="dia_hijo<%=cant_hijos%>" value="<%=gc.get(Calendar.DAY_OF_MONTH)%>" />
		  <input type="text" size="2" name="mes_hijo<%=cant_hijos%>" value="<%=(gc.get(Calendar.MONTH)+1)%>" />
		  <input type="text" size="4" name="anio_hijo<%=cant_hijos%>" value="<%=gc.get(Calendar.YEAR)%>" /><%} else {%>
		  <input type="text" size="2" name="dia_hijo<%=cant_hijos%>" />
		  <input type="text" size="2" name="mes_hijo<%=cant_hijos%>" />
		  <input type="text" size="4" name="anio_hijo<%=cant_hijos%>" /> <%}%>
          </td>
		  <td width="40" align="left" class="caja">
		  <select name="sexo_hijo<%=cant_hijos%>">
		    <option>&nbsp;&nbsp;</option>
			<option <% if (h.getSexo()=='M') {%> selected="selected" <%}%>>M</option>
			<option <% if (h.getSexo()=='F') {%> selected="selected" <%}%>>F</option>		  
		  </select>
		  <td width="50" align="left" class="caja">
		  <select name="doc_hijo<%=cant_hijos%>">
		  <option>&nbsp;&nbsp;</option>
		<%
		Iterator t = doc.iterator();
		while (t.hasNext()) {
		   TipoDocumento td = (TipoDocumento) t.next();
		%> <option <%if(modificacion && h.getTipoDoc()!=null && 
		               h.getTipoDoc().getDesc_tipo_documento().equals(td.getDesc_tipo_documento())) {%> 
		    selected="selected"<%}%>> <%=td.getDesc_tipo_documento() %>  </option> <%
		}
		%>
		</select>
</td>
		  <td width="100" align="left" class="caja" style="text-align:left">
		    <input type="text" size="10" name="nro_hdoc<%=cant_hijos%>" value="<%=h.getNumeroDoc()%>" />
		  </td>
		  <td width="100" align="left" class="caja">
		  <select name="nac_hijo<%=cant_hijos%>" id="nacionalidad">
		  <option>&nbsp;&nbsp;</option>
		<%
		Iterator t2 = nac.iterator();
		while (t2.hasNext()) {
			Nacionalidad nc = (Nacionalidad) t2.next();
			%> <option <%if(modificacion && h.getNacionalidad()!=null && h.getNacionalidad().getDescripcion().equals(nc.getDescripcion())) {%> selected="selected"<%}%>> <%=nc.getDescripcion() %>  </option> <%
		}
		%>
		</select>
        </td>
		<td><a href="javascript:borrar(nodo_tr<%=cant_hijos%>)"><img src="papelera.jpg" border="0"/></a></td>
	  </tr>	  
	  <%
	  }
	  %> <script> count=<%=cant_hijos%>;</script>
	<%   
	}
	%>
	</tbody>
	</table>
	<input type="button" onclick="javascript:agregar()" value="Agregar" />
