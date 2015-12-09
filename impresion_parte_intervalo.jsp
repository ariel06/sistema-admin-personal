<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ page import = "auxclases.*" %>
<%@ page import = "bean.*" %>
<%@ page import = "util.*" %>
<%@ page import = "funciones.*" %>
<%@ page import = "org.hibernate.*" %>
<%@ page import = "persistencia.*" %> 


<jsp:useBean id="ina"    scope="session" 
class="funciones.Ser_Inasistencias" />

<script>
function impresion() {
document.all.item("noprint").style.visibility='hidden'; 
window.print();
document.all.item("noprint").style.visibility='visible';
}

</script> 

  

<% 
int cant_agentes=0;
List fichas = new ArrayList();


String mes=request.getParameter("mes");
String anio=request.getParameter("anio");


String dia_h=request.getParameter("dia_h");

String anio_d=anio;
String mes_d=mes;
String dia_d="01";

String anio_h=anio;
String mes_h=mes;

 Ser_Inasistencias ser=new Ser_Inasistencias();
     ArrayList  lista_dias= null;
     Iterator ite;

String primer_sab=request.getParameter("primer_sabado");

String guardia=request.getParameter("guardia");
if(guardia==null) guardia="false";

String empleo_publico=request.getParameter("epublico");
if(empleo_publico==null) empleo_publico="false";

String area_fechas=request.getParameter("area_fechas");

String tipo_lic=request.getParameter("tipo_lic");
int acumulador_dias=0;

%>


<%

ArrayList  lista_dias_feriados_fines= new ArrayList();


int primer_sa=Integer.parseInt(primer_sab);
lista_dias_feriados_fines.add(primer_sa);
lista_dias_feriados_fines.add(primer_sa+1);
int dia_final=Integer.parseInt(dia_h);


boolean seguir=true;
while(seguir){

primer_sa=primer_sa+7;
if(primer_sa<=dia_final){
if(primer_sa<=dia_final)
lista_dias_feriados_fines.add(primer_sa);
if((primer_sa+1)<=dia_final) 
lista_dias_feriados_fines.add(primer_sa+1);
}else seguir=false;




}


seguir=true;
primer_sa=0;
String day=null;%>

<%

Scanner s = new Scanner(area_fechas).useDelimiter("\n");

String fecha=null;
int diaO=0;
int diaD=0;
int mesO=0;
int mesD=0;
int anioO=0;
int anioD=0;



int i=0;
while(s.hasNext()){


fecha=s.next();%>
<style type="text/css">
<!--
.Estilo1 {font-size: 14px}
.Estilo2 {color: #0000FF;
font-size: 18px;
}
.Estilo3 {
	font-size: 14px;
	color: #0000FF;
	font-family: "Courier New", Courier, mono;
}
-->
</style>

fecha= <%=fecha%>
fechalong= <%=fecha.length()%>
<%
/*es solo un dia*/
if(fecha.indexOf("->")<0){

lista_dias_feriados_fines.add(Integer.parseInt(fecha.substring(8, 10)));
    %>
dia= <%=fecha.substring(8, 10)%>
mes= <%=fecha.substring(5, 7)%>
anio= <%=fecha.substring(0, 4)%>


<%}else{

    diaO= Integer.parseInt(fecha.substring(8, 10));

    diaD=Integer.parseInt(fecha.substring(22, 24));


      mesO= Integer.parseInt(fecha.substring(5, 7));

    mesD=Integer.parseInt(fecha.substring(19, 21));


          anioO= Integer.parseInt(fecha.substring(0, 4));

    anioD=Integer.parseInt(fecha.substring(14, 18));


   Date fechaOrigen= ser.fechaint(diaO, mesO-1, anioO);

    Date fechaDestino= ser.fechaint(diaD, mesD-1, anioD);


    lista_dias= ser.lista_dias(fechaOrigen, fechaDestino, ser.fechaint(Integer.parseInt(dia_d), Integer.parseInt(mes_d)-1, Integer.parseInt(anio_d)), ser.fechaint(Integer.parseInt(dia_h),Integer.parseInt(mes_h)-1, Integer.parseInt(anio_h)));


     ite=lista_dias.iterator();

%>
     Lista nueva=
     <%
while(ite.hasNext()){


 lista_dias_feriados_fines.add(ite.next());
}

      
 //lista_dias_feriados_fines.add(ite.next());
            

    %>

diaO=<%=diaO%>
 diaD=<%=diaD%>
 mesO=<%=mesO%>
 mesD=<%=mesD%>
 anioO=<%=anioO%>
 anioD=<%=anioD%>


<%}%>
<p></p>
<%}%>

<font  color="#FF0000">
Feriados y fines de semana del mes:
<p></p>
<%
 ite=lista_dias_feriados_fines.iterator();

while(ite.hasNext()){
    %>
<%=ite.next()%>

<%}%>
</font>
 <%if (session.getAttribute("usuario")!=null) {

	Session sesion = HibernateUtil.currentSession();

		 Persistente p = new Persistente();
		 Cementerio c = (Cementerio) p.getObjectByField("Cementerio", "cem_id", request.getParameter("cem"));
 		 boolean guard;
		 if(guardia.equals("on")){
			 guard=true;
		 }
		 else{ guard=false;}

		 boolean empleo_public;
		 if(empleo_publico.equals("true")){
			 empleo_public=true;}
		 else{
				 empleo_public=false;
		 }
		Date ss =new Date();
		 ss.getDate();
		 ss.getMonth();
		 ss.getYear();

		 String tipo_licencia= (request.getParameter("menuTipoLicencia"));

	%>
<style type="text/css">

.Estilo1 {font-weight: bold }
.Estilo2 {font-weight: bold ;font-color:#0000FF}

</style>
 <div align="center"> </div>
 <form name="formulario">
	   <div class="titulo Estilo1">
	     <p>Direccion General de Cementerios- <input  class="Estilo1" type="button" name="noprint" value="Imprimir Listado" onClick="impresion()"/></p>
	     <p>Parte por Periodo -Desde- <%=dia_d%>/<%=mes_d%>/<%=anio_d%> -Hasta-<%=dia_h%>/<%=mes_h%>/<%=anio_h%>
	      <% if(guard){%>
	      Guardia (licencias 3 4 5 6)
	      <%}else{%>
		  &nbsp;
	       <%=request.getParameter("tipo_lic")%>
	      <%}%>
	      <% if (c!=null) {%>
           <%= c.getDescripcion() %>           <%}%>
           -
           <% if(empleo_public){%>
           Empleo publico
           <%}%>
           &nbsp;
	     </p>
       </div>
   <div class='box-body Estilo2' id='introduction_box-body'>
		<table>
			<tbody>
	<%
		 ParteDiario pd = new ParteDiario();
		 String cem_param = request.getParameter("cem");

		 if (cem_param.equals("TD")) cem_param = null;%>


<%
boolean guardia_log;
boolean ep_log;


if(guardia.equals("on")){
guardia_log=true;
}else {
    guardia_log=false;
}%>

<%if(empleo_publico.equals("on")){
ep_log=true;
}else {
    ep_log=false;
}%>


<%
		List lpd = pd.Parte_periodo(anio_d+"-"+mes_d+"-"+dia_d,anio_h+"-"+mes_h+"-"+dia_h,guardia_log,ep_log,cem_param,tipo_licencia);

		 if (lpd.size() == 0) { %>
		   <div>
		     <br />No se han encontrado licencias o inasistencias para el periodo ingresado
		   </div>
		 <%
		 } else {%>
		  <tr>

		  </tr>
		 <tr>
				<td class="Estilo2"><div align="center" class="Estilo2">Numero Ficha</div></td>
		
				<td class="Estilo2"><div align="center">Apellido  </div></td>
		
				<td class="Estilo2"><div align="center">Nombres</div></td>
			
				<td class="Estilo2"><div align="center">Desde</div></td>

				<td class="Estilo2"><div align="center">Hasta</div></td>
               
                <td  class="Estilo2"   ><div align="center"  >Dias laborales contados</div></td>
                 <td  class="Estilo2"   ><div align="center"  >Duracion</div></td>
</font>

		  </tr>

	<%   Iterator it = lpd.iterator();
    int dia_a_contar=0;
    int dia=0;
    int mess=0;
    int mes_dd=Integer.parseInt(mes_d);

   





 //   int primer_sab=Integer.parseInt(primer_sab);


int num_ficha=0;

		 while(it.hasNext()) {
		   Licencia lic = (Licencia) it.next();
          dia= lic.getFecha_desde().getDate();
          mess= lic.getFecha_desde().getMonth()+1;
         lista_dias= ser.lista_dias(lic.getFecha_desde(), lic.getFecha_hasta(), ser.fechaint(Integer.parseInt(dia_d), Integer.parseInt(mes_d)-1, Integer.parseInt(anio_d)), ser.fechaint(Integer.parseInt(dia_h),Integer.parseInt(mes_h)-1, Integer.parseInt(anio_h)));
          /**Hago lista de dias de la licencia a contar**/
          if(lic.getFicha()!=num_ficha){
          num_ficha=lic.getFicha();
          cant_agentes++;

          }
          

          ite=lista_dias.iterator();






	%>


			<tr  >
				<td class="td_reporte"><div align="center"><%=lic.getFicha()%></div></td>
		
				<td class="td_reporte"><div align="center"><%=lic.getAgente().getApellido_paterno()%></div></td>
			
				<td class="td_reporte"><div align="center"><%=lic.getAgente().getNombres()%></div></td>
	

				<td width="103"><div align="center"><%=lic.getFecha_desde()%></div></td>
			
				<td width="103"><div align="center"><%=lic.getFecha_hasta()%></div></td>

                <td align="center">
				<font color="#0000FF">
             <%   
             int num=0;
             Object x=null;
             int dias_totales=0;

             while(ite.hasNext()){

                 x = ite.next();
num=Integer.parseInt(x.toString());
if(!lista_dias_feriados_fines.contains(num)){
    dias_totales++;
    acumulador_dias++;
                                                 %>
                 <%=num%>




<%}}%>
=  <%=dias_totales%>
<%dias_totales=0;%>
             </font>

              </td>
	<td class="td_reporte"><div align="center"><%=lic.getDuracion()%></div></td>
			</tr>
            <tr height="15" ></tr>

	<%
	     } /* fin del while*/
		 lpd.clear();
		 }
	%>
			</tbody>
		</table>
   </div>
   <p align="center">
  
  <font  color="#0000FF" >Dias Licencias Totales   <%=acumulador_dias%>
   </font>
    </p>
      <p align="center">
  
  <font  color="#0000FF" >Cantidad Agentes   <%=cant_agentes%>
   </font>
    </p>

</form>
	<%
	   } /* fin generar parte diario*/
 HibernateUtil.closeSession();
  %>

 