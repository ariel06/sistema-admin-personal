<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "java.util.*" %>
<%@ page import = "auxclases.*" %>
<%@ page import = "bean.*" %>
<%@ page import = "util.*" %>
<%@ page import = "funciones.*" %>
<%@ page import = "org.hibernate.*" %>
<%@ page import = "persistencia.*" %>

<jsp:useBean id="ina"    scope="session"
class="funciones.Ser_Inasistencias" />

<script language="javascript" src="jsolait/init.js"></script>
<script language="javascript" src="jsolait/lib/urllib.js"></script>
<script language="javascript" src="jsolait/lib/xml.js"></script>
<script language="javascript" src="jsolait/lib/xmlrpc.js"></script>
<script language="javascript" src="jsolait/modulo.js"></script>

<script language="javascript"  src="src/js/jscal2.js"></script>
<script language="javascript"  src="src/js/lang/en.js"></script>
  <link rel="stylesheet" type="text/css" href="src/css/jscal2.css" />
    <link rel="stylesheet" type="text/css" href="src/css/border-radius.css" />
    <link rel="stylesheet" type="text/css" href="src/css/steel/steel.css" />
  



<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
.Estilo3 {
	font-size: 18px;
	color: #0000FF;
}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Parte por periodo</title>

    <link rel="STYLESHEET" type="text/css" href="reporte.css">
	<link rel="STYLESHEET" type="text/css" href="css/tablas.css">
	<script language="javascript" src="varios.js"></script>


</head>
<style>
  .separador {
		 border-bottom:1px solid #333333
  }
.Estilo4 {
	font-size: 12px;
	color: #FF0000;
}
.Estilo5 {
	font-size: 9pt;
	font-weight: bold;
}
</style>

<%@include file="header.jsp" %>
<body>

<script language="JavaScript">

var dias_a_pasar=null;
function desabilitar(oo){
var f=oo.form;
if(f.menuTipoLicencia.disabled==false)
f.menuTipoLicencia.disabled= true;else
f.menuTipoLicencia.disabled=false;
}



function getUltimoDiaDelMes( mes, ano )
{

    /*
        Los meses 1,3,5,7,8,10,12 siempre tienen 31 días
        Los meses 4,6,9,11 siempre tienen 30 días
        El único problema es el mes de febrero dependiendo del año puede tener 28 o 29 días
    */


    if( (mes == 1) || (mes == 3) || (mes == 5) || (mes == 7) || (mes == 8) || (mes == 10) || (mes == 12) )
        return 31;
    else if( (mes == 4) || (mes == 6) || (mes == 9) || (mes == 11) )
        return 30;
    else if( mes == 2 )
    {

        if( (ano % 4 == 0) && (ano % 100 != 0) || (ano % 400 == 0) )
            return 29;
        else
            return 28;

    }

}









function iniciocalendario() {



/*
var f=document.formu;

var anio=f.anio.value;


var mes=parseInt(f.mes.value);
var dia_h=getDays(mes-1,anio);

modulo.loadComponent( "fechas", "fechas", {mes:f.mes.value, dias:dia_h});*/

}
function verificar() {

var date = Calendar.intToDate(LEFT_CAL.selection.get());

var dias=document.formu.area_fechas.value;
var dia=null;
var posComa=null;
while((posComa=dias.indexOf(','))>0){
dia=dias.substring(0,posComa);
/*alert(dia);*/
dia=dias.substring(8,10);
dias=dias.substring(11,dias.length);
}



  //document.write("El ultimo dia del mes es " + lastDOM);
/*
  alert('mes= '+LEFT_CAL.date.getMonth());
  alert('anio= '+LEFT_CAL.date.getYear());
*/
var mes=(LEFT_CAL.date.getMonth()+1);

//var mess=parseInt(mes);
if(mes<10) mes='0'+mes;
//alert('mes= '+mes);
document.formu.mes.value=mes;

var anio=LEFT_CAL.date.getYear();
document.formu.anio.value=anio;
var miFecha = new Date(anio,mes-1,1) ;
var primer_dia=miFecha.getDay();
var primer_sabado=null;

//alert(primer_dia);
switch(primer_dia)

{

case 1:
primer_sabado='06';
break;

case 2:
primer_sabado='05';

break;

case 3:
primer_sabado='04';
break;

case 4:
primer_sabado='03';

break;

case 5:
primer_sabado='02';
break;

case 6:
primer_sabado='01';
break;

case 0:
primer_sabado='07';
break;

}

//alert('primer_sabado= '+primer_sabado);

document.formu.dia_h.value=getUltimoDiaDelMes(mes,anio);
//alert(document.formu.dia_h.value);
document.formu.primer_sabado.value=primer_sabado;

document.formu.tipo_lic.value=document.formu.menuTipoLicencia.options[document.formu.menuTipoLicencia.selectedIndex].text;

 document.formu.submit();
		      return true;


   }



</script>
	<%
    if (session.getAttribute("usuario")!=null) {

	Session sesion = HibernateUtil.currentSession();
	%>
	    <%@include file="menu.jsp" %>
		<div align="center" style="position: relative; top:10%">
	  
			 <p >Parte por Periodo:</p>

		
		  <p class="Estilo3">Marque los dias  feriados del mes a tener en cuenta :</p>
		
		<p class="Estilo4">    (Para seleccionar mas de un dia mantener presionado CRTL)
		  
</p>
		</div>
		<div align="center" style="position: relative; top:10%">
		  <form name="formu" method="post" action="impresion_parte_intervalo.jsp">
  
      <table>
        <tr>
          <td colspan="4" id="cont">
		  </td>
          <td >
		 <p class="Estilo5">
		 Feriados seleccionados		 </p>
		 
              <textarea readonly="readonly" class="DynarchCalendar-day-selected" id="f_selection" name="area_fechas" style="width: 20em; height: 10em" ></textarea>
			
          </td>
  
        </tr>
         
      </table>
     

  
            <table class="tabla">
  
              <tr>
                  <td>
                      <div id="fechas"></div>
  
</td>
  

              </tr>
              <tr>
                <td align="left">Guardia
                    <input type="checkbox" name="guardia"  onchange="desabilitar(this)" /></td>
                <td></td>
                <td align="left">Empleo publico
                    <input type="checkbox" name="epublico" /></td>
              </tr>
              <tr>
                <td><select name="cem" style="width:140px">
                    <% String cementerio = request.getParameter("cem");
						   boolean restriccion = (cementerio!=null);
						if (!restriccion) { %>
                    <option value="TD">Todo</option>
                    <%}

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
                  </select>
                </td>
                <td> Motivo
                    <%

			ina.darListaMotivoLicencia().clear();

			%>
                    <select  class=""name="menuTipoLicencia">
                      <%
		Iterator it = ina.darListaMotivoLicencia().iterator();
		while (it.hasNext()) {
			  MotivoLicencia mot = (MotivoLicencia)it.next();
			  		%>
                      <option value="<%=mot.getId_motivo()%>"> <%=mot.getDescripcion() %> </option>
                      <%
					         }
					 %>
                    </select>
                </td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td align="right"><input type="button" name="generar" value="Generar" onclick="return verificar()"/></td>
              </tr>
            </table>
             <input type="hidden" name="dia_h">
           <input type="hidden" name="mes">
               <input type="hidden" name="anio">
                     <input type="hidden" name="primer_sabado">
                
                          <input type="hidden" name="tipo_lic">
                               <input type="hidden" name="mes_actual">
          </form>
</div>
	<%
	//HibernateUtil.closeSession();
   } else { %>

	 <%@include file="include/caducado.jsp" %>

    <% }
	%>
</body>


   <script type="text/javascript">//<![CDATA[

      // this handler is designed to work both for onSelect and onTimeChange
      // events.  It updates the input fields according to what's selected in
      // the calendar.
      function updateFields(cal) {
              var date = cal.selection.get();

              if (date) {
                      date = Calendar.intToDate(date);
                     // document.getElementById("f_date").value = Calendar.printDate(date, "%Y-%m-%d");
              }
            /*  document.getElementById("f_hour").value = cal.getHours();
              document.getElementById("f_minute").value = cal.getMinutes();*/
      };

      var LEFT_CAL =Calendar.setup({
              cont         : "cont",
                fdow          : 1,

selectionType : Calendar.SEL_MULTIPLE,
             onSelect: function() {
                                var selectionObject = this.selection;
  
                                
                         var ta = document.getElementById("f_selection");
                  
                       

                       var date = Calendar.intToDate(selectionObject.get());
                       document.formu.mes_actual.value=LEFT_CAL.date.getMonth()+1;
                     //  alert(this.date.getDate());
                     
                        //   dias_a_pasar += dias_a_pasar+'-'+date.getDate();
                       //    alert('dias_a_pasar= '+date.getDate());
                            
                               // var date = Calendar.intToDate(this.selection[0]);
                             

                          
                                ta.value = this.selection.print("%Y/%m/%d").join("\n")+'.';
                               /* valor=this.selection.print("%Y/%m/%d").join("\n")+'.';
                                if(valor.indexOf('->')>0) alert(valor);*/
                   

                     
/*

                          alert('dia selec= '+date.getDate());
                           alert('MES= '+LEFT_CAL.date.getMonth());
                      */
                   
                                
                          },

              onChange : function() {
                            var ta = document.getElementById("f_selection");
                            ta.value = '';
                       //   alert('cambia');

                          }
      });

    //]]></script>

<script language="JavaScript">
window.onload =iniciocalendario;
</script>
<%@include file="footer.jsp" %>

</html>
