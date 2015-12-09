<table style="background:#CCCCCC">
  <tr>
	<td>Apelido paterno</td>
	<td><input type="text" size="15" name="apellidop" <%if(modificacion && ag.getApellido_paterno()!=null){%> value="<%=ag.getApellido_paterno()%>"<%}%>/></td>
  </tr>
  
  <tr>
	<td>Apelido Materno</td>
	<td><input type="text" size="15" name="apellidom" <%if(modificacion && ag.getApellido_materno()!=null){%> value="<%=ag.getApellido_materno()%>"<%}%>/></td>
  </tr>
  
  <tr>
	<td>Nombres</td>
	<td><input type="text" size="15" name="nombre" <%if(modificacion && ag.getNombres()!=null){%> value="<%=ag.getNombres()%>"<%}%>/></td>
  </tr>
  
  <tr>
	<td>Sexo</td>
	<td><input type="radio" name="sexo" value="F"<%if(modificacion && ag.getSexo()=='F'){%> checked="checked"<%}%>/> 
	Femenino </td>
  </tr>

  <tr>
	<td> </td>
	<td><input type="radio" name="sexo" value="M" <%if(modificacion && ag.getSexo()=='M'){%> checked="checked"<%}%>/> 
	Masculino </td>
  </tr>	  

  <% GregorianCalendar gc = null;
     if (modificacion && ag.getFecha_nacimiento()!=null) {
	   gc = new GregorianCalendar();
	   gc.setTime(ag.getFecha_nacimiento());
	 }
  
  %>
  <tr>
	<td>Fecha de Nacimiento</td>
	<td><input type="text" size="2" maxlength="2" name="fnac_dia" <%if(gc!=null){%> value="<%=gc.get(Calendar.DAY_OF_MONTH)%>"<%}%>/> 
		<input type="text" size="2" maxlength="2" name="fnac_mes" <%if(gc!=null){%> value="<%=(gc.get(Calendar.MONTH)+1)%>"<%}%>/>
		<input type="text" size="4" maxlength="4" name="fnac_anio" <%if(gc!=null){%> value="<%=gc.get(Calendar.YEAR)%>"<%}%>/></td>		
  </tr>

  <tr>
	<td>Documento</td>
	<td>
		<select name="menu_tipodoc">
		  <option>&nbsp;&nbsp;</option>
		<%
		Iterator it = doc.iterator();
		while (it.hasNext()) {
		   TipoDocumento td = (TipoDocumento) it.next();
		%> <option <%if(modificacion && ag.getTipo_doc()!=null && 
		               ag.getTipo_doc().getDesc_tipo_documento().equals(td.getDesc_tipo_documento())) {%> 
		    selected="selected"<%}%>> <%=td.getDesc_tipo_documento() %>  </option> <%
		}
		%>
		</select> <input type="text" size="9" maxlength="8" name="num_doc" <%if(modificacion && ag.getNumero_doc()!=null){%> value="<%=ag.getNumero_doc()%>"<%}%>>				</td>
  </tr>

 <tr>
	<td>CUIL</td>
	<td><input type="text" size="15" name="cuil" <%if(modificacion && ag.getCuil()!=null){%> value="<%=ag.getCuil()%>"<%}%> /></td>
 </tr>

 <tr>
	<td>Nacionalidad</td>
	<td>
		<select name="menu_nac" id="nacionalidad">
		  <option>&nbsp;&nbsp;</option>
		<%
		Iterator it2 = nac.iterator();
		while (it2.hasNext()) {
			Nacionalidad nc = (Nacionalidad) it2.next();
			%> <option <%if(modificacion && ag.getNacionalidad()!=null && ag.getNacionalidad().getDescripcion().equals(nc.getDescripcion())) {%> selected="selected"<%}%>> <%=nc.getDescripcion() %>  </option> <%
		}
		%>
		</select>				</td>
 </tr>

 <tr>
	<td>Estado Civil</td>
	<td>
		<select name="menu_estcivil">
		  <option>&nbsp;&nbsp;</option>
		<%
		Iterator it3 = ec.iterator();
		while (it3.hasNext()) {
			EstadoCivil esc = (EstadoCivil) it3.next();
			%> <option <%if(modificacion && ag.getEstado_civil()!=null && ag.getEstado_civil().getDesc_estado_civil().equals(esc.getDesc_estado_civil())) { %> selected="selected"<%}%>> <%= esc.getDesc_estado_civil() %>  </option> <%
		}
		%>
		</select>				</td>
 </tr>

 <tr>
	<td>Tel&eacute;fono</td>
	<td><input type="text" size="15" name="tel" <%if(modificacion && ag.getTelefono()!=null){%> value="<%=ag.getTelefono()%>"<%}%> /></td>
 </tr>
</table>