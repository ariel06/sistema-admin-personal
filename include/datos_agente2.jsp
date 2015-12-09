<table style="background:#CCCCCC">
  <tr>
	<td>Apelido paterno</td>
	<td><input type="text" size="15" name="apellidop" <%if(modificacion){%> value="<%=ag.getApellido_paterno()%>>"<%}%>/></td>
  </tr>
  
  <tr>
	<td>Apelido Materno</td>
	<td><input type="text" size="15" name="apellidom" <%if(modificacion){%> value="<%=ag.getApellido_materno()%>>"<%}%>/></td>
  </tr>
  
  <tr>
	<td>Nombres</td>
	<td><input type="text" size="15" name="nombre" <%if(modificacion){%> value="<%=ag.getNombres()%>>"<%}%>/></td>
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

  <tr>
	<td>Fecha de Nacimiento</td>
	<td><input type="text" size="2" maxlength="2" name="fnac_dia"/> 
		<input type="text" size="2" maxlength="2" name="fnac_mes" />
		<input type="text" size="4" maxlength="4" name="fnac_anio"/></td>		
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
		%> <option> <%=td.getDesc_tipo_documento() %>  </option> <%
		}
		%>
		</select> <input type="text" size="9" maxlength="8" name="num_doc" />				</td>
  </tr>

 <tr>
	<td>CUIL</td>
	<td><input type="text" size="15" name="cuil" <%if(modificacion){%> value="<%=ag.getCuil()%>"<%}%> /></td>
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
			%> <option> <%=nc.getDescripcion() %>  </option> <%
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
			%> <option> <%= esc.getDesc_estado_civil() %>  </option> <%
		}
		%>
		</select>				</td>
 </tr>

 <tr>
	<td>Tel&eacute;fono</td>
	<td><input type="text" size="15" name="tel" <%if(modificacion){%> value="<%=ag.getTelefono()%>"<%}%> /></td>
 </tr>
</table>