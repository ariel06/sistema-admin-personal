// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:01:33 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Persistente.java

package persistencia;

import auxclases.*;
import bean.*;
import java.io.PrintStream;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.*;
import org.hibernate.exception.ConstraintViolationException;
import util.HibernateUtil;

public class Persistente
{

    public Persistente()
    {
        nfiltro = null;
        vfiltro = null;
    }

    public void setFiltro(String nombre, String valor)
    {
        nfiltro = nombre;
        vfiltro = valor;
    }

    public List getElementsByFieldF(String clase, String params[], String orden)
    {
        String consulta = (new StringBuilder()).append("from ").append(clase).append(" as ag ").toString();
        if(params != null)
        {
            consulta = (new StringBuilder()).append(consulta).append(" where ").toString();
            for(int i = 0; i < params.length; i += 2)
            {
                consulta = (new StringBuilder()).append(consulta).append("upper(ag.").append(params[i]).append(") like upper('%").append(params[i + 1]).append("%') ").toString();
                if(i + 2 < params.length)
                    consulta = (new StringBuilder()).append(consulta).append(" and ").toString();
            }

        }
        if(nfiltro != null && vfiltro != null)
            consulta = (new StringBuilder()).append(consulta).append(" and ag.").append(nfiltro).append("='").append(vfiltro).append("' ").toString();
        if(orden != null)
            consulta = (new StringBuilder()).append(consulta).append("order by ag.").append(orden).toString();
        Session sesion = HibernateUtil.currentSession();
        return sesion.createQuery(consulta).list();
    }

    public List getElementsByField(String clase, String params[], String orden)
    {
        String consulta = (new StringBuilder()).append("from ").append(clase).toString();
        if(params != null)
        {
            consulta = (new StringBuilder()).append(consulta).append(" where ").toString();
            for(int i = 0; i < params.length; i += 2)
            {
                consulta = (new StringBuilder()).append(consulta).append("upper(").append(params[i]).append(") like upper('%").append(params[i + 1]).append("%') ").toString();
                if(i + 2 < params.length)
                    consulta = (new StringBuilder()).append(consulta).append(" and ").toString();
            }

        }
        if(orden != null)
            consulta = (new StringBuilder()).append(consulta).append("order by ").append(orden).toString();
        Session sesion = HibernateUtil.currentSession();
        return sesion.createQuery(consulta).list();
    }

    public Object getObjectByField(String clase, String field, String valor)
    {
        Object result = null;
        Session sesion = HibernateUtil.currentSession();
        String consulta = (new StringBuilder()).append("from ").append(clase).append(" as cl where cl.").append(field).append("='").append(valor).append("'").toString();
        List res = sesion.createQuery(consulta).list();
        try
        {
            result = res.get(0);
        }
        catch(IndexOutOfBoundsException e)
        {
            System.out.println("No se encuentra el objeto");
            res = null;
        }
        return result;
    }

    public boolean save(HttpServletRequest request, Agente ag, boolean update)
    {
        Session sesion = null;
        if(request.getParameter("ficha") != null)
        {
            sesion = HibernateUtil.currentSession();
            String sf = request.getParameter("ficha");
            Integer ficha = new Integer(sf);
            if(!update && sesion.get(bean.Agente.class, ficha) != null)
                return false;
            if(update)
                ag = (Agente)sesion.get(bean.Agente.class, ficha);
            ag.setFicha(ficha.intValue());
            ag.setApellido_paterno(request.getParameter("apellidop"));
            ag.setApellido_materno(request.getParameter("apellidom"));
            ag.setNombres(request.getParameter("nombre"));
            ag.setSexo(request.getParameter("sexo").charAt(0));
            ag.setFecha_nacimiento(Fecha.parseFecha(request.getParameter("fnac_dia"), request.getParameter("fnac_mes"), request.getParameter("fnac_anio")));
            ag.setTelefono(request.getParameter("tel"));
            ag.setCuil(request.getParameter("cuil"));
            ag.setTipo_doc((TipoDocumento)getObjectByField("TipoDocumento", "desc_tipo_documento", request.getParameter("menu_tipodoc")));
            ag.setNumero_doc(request.getParameter("num_doc"));
            ag.setNacionalidad((Nacionalidad)getObjectByField("Nacionalidad", "descripcion", request.getParameter("menu_nac")));
            ag.setEstado_civil((EstadoCivil)getObjectByField("EstadoCivil", "desc_estado_civil", request.getParameter("menu_estcivil")));
            ag.setCalle(request.getParameter("calle"));
            ag.setNumero_dom(request.getParameter("nro"));
            ag.setPiso(request.getParameter("piso"));
            ag.setDepto(request.getParameter("depto"));
            ag.setLocalidad(request.getParameter("localidad"));
            ag.setProvincia(request.getParameter("provincia"));
            ag.setPais(request.getParameter("pais"));
            ag.setNivel(request.getParameter("nivel"));
            String grado = request.getParameter("grado");
            if(grado != null)
                try
                {
                    ag.setGrado(Integer.parseInt(grado));
                }
                catch(Exception e) { }
            ag.setFuncion((Funcion)getObjectByField("Funcion", "descripcion", request.getParameter("menu_funcion")));
            ag.setFecha_ingreso_mun(Fecha.parseFecha(request.getParameter("dia_ing_gcba"), request.getParameter("mes_ing_gcba"), request.getParameter("anio_ing_gcba")));
            ag.setFecha_ingreso_dgcem(Fecha.parseFecha(request.getParameter("dia_ing_dgcem"), request.getParameter("mes_ing_dgcem"), request.getParameter("anio_ing_dgcem")));
            try
            {
                Double sueldo = new Double(request.getParameter("sueldo"));
                ag.setSueldo_bruto(sueldo.doubleValue());
            }
            catch(Exception e)
            {
                ag.setSueldo_bruto(0.0D);
            }
            ag.setHora_desde(request.getParameter("hora_desde"));
            ag.setHora_hasta(request.getParameter("hora_hasta"));
            ag.setGuardia(request.getParameter("guardia") != null);
            ag.setEmpleo_publico(request.getParameter("epublico") != null);
            ag.setCementerio((Cementerio)getObjectByField("Cementerio", "cem_id", request.getParameter("menu_cem")));
            ag.setObservaciones(request.getParameter("obser"));
            ag.setApellido_casada(request.getParameter("ape_casada"));
            ag.setFecha_casado(Fecha.parseFecha(request.getParameter("dia_casamiento"), request.getParameter("mes_casamiento"), request.getParameter("anio_casamiento")));
            String ape_conyuge = request.getParameter("ape_conyuge");
            String nom_conyuge = request.getParameter("nom_conyuge");
            if(ape_conyuge != null && ape_conyuge.length() > 0 || nom_conyuge != null && nom_conyuge.length() > 0)
            {
                Conyuge conyuge = null;
                if(update)
                    conyuge = (Conyuge)sesion.get(bean.Conyuge.class, new Integer(ag.getFicha()));
                if(conyuge == null)
                {
                    conyuge = new Conyuge();
                    conyuge.setFicha(-1);
                }
                conyuge.setAgente(ag);
                conyuge.setApellido(ape_conyuge);
                conyuge.setNombre(nom_conyuge);
                conyuge.setFechaNacimiento(Fecha.parseFecha(request.getParameter("dia_nac_conyuge"), request.getParameter("mes_nac_conyuge"), request.getParameter("anio_nac_conyuge")));
                conyuge.setNacionalidad((Nacionalidad)getObjectByField("Nacionalidad", "descripcion", request.getParameter("menu_nac_conyuge")));
                if(request.getParameter("trabaja") != null)
                {
                    conyuge.setTrabaja(true);
                    conyuge.setDondeTrabaja(request.getParameter("trabaja_en"));
                    conyuge.setTrabajaDesde(Fecha.parseFecha(request.getParameter("dia_desde"), request.getParameter("mes_desde"), request.getParameter("anio_desde")));
                } else
                {
                    conyuge.setDondeTrabaja(null);
                }
                ag.setConyuge(conyuge);
            } else
            if(ag.getConyuge() != null)
            {
                sesion.delete(ag.getConyuge());
                ag.setConyuge(null);
            }
            Transaction t = sesion.beginTransaction();
            String consulta = (new StringBuilder()).append("delete Hijo where ficha = ").append(ag.getFicha()).toString();
            int borrados = sesion.createQuery(consulta).executeUpdate();
            sesion.flush();
            consulta = (new StringBuilder()).append("delete Hermano where ficha = ").append(ag.getFicha()).toString();
            borrados = sesion.createQuery(consulta).executeUpdate();
            sesion.flush();
            t.commit();
            for(int cantidad = 1; request.getParameter((new StringBuilder()).append("ape_hijo").append(cantidad).toString()) != null && request.getParameter((new StringBuilder()).append("ape_hijo").append(cantidad).toString()).length() > 0 || request.getParameter((new StringBuilder()).append("nom_hijo").append(cantidad).toString()) != null && request.getParameter((new StringBuilder()).append("nom_hijo").append(cantidad).toString()).length() > 0; cantidad++)
            {
                String nom = request.getParameter((new StringBuilder()).append("nom_hijo").append(cantidad).toString());
                String ape = request.getParameter((new StringBuilder()).append("ape_hijo").append(cantidad).toString());
                if(nom.length() == 0 && ape.length() == 0)
                    break;
                Hijo hijo = new Hijo();
                hijo.setId_hijo(-1);
                hijo.setApellido(ape);
                hijo.setNombre(nom);
                hijo.setFechaNacimiento(Fecha.parseFecha(request.getParameter((new StringBuilder()).append("dia_hijo").append(cantidad).toString()), request.getParameter((new StringBuilder()).append("mes_hijo").append(cantidad).toString()), request.getParameter((new StringBuilder()).append("anio_hijo").append(cantidad).toString())));
                String sexo = request.getParameter((new StringBuilder()).append("sexo_hijo").append(cantidad).toString());
                if(sexo.equals("M"))
                    hijo.setSexo('M');
                else
                if(sexo.equals("F"))
                    hijo.setSexo('F');
                hijo.setNacionalidad((Nacionalidad)getObjectByField("Nacionalidad", "descripcion", request.getParameter((new StringBuilder()).append("nac_hijo").append(cantidad).toString())));
                hijo.setNumeroDoc(request.getParameter((new StringBuilder()).append("nro_hdoc").append(cantidad).toString()));
                hijo.setTipoDoc((TipoDocumento)getObjectByField("TipoDocumento", "desc_tipo_documento", request.getParameter((new StringBuilder()).append("doc_hijo").append(cantidad).toString())));
                ag.getHijos().add(hijo);
            }

            for(int cantidad = 1; request.getParameter((new StringBuilder()).append("ape_he").append(cantidad).toString()) != null && request.getParameter((new StringBuilder()).append("ape_he").append(cantidad).toString()).length() > 0 || request.getParameter((new StringBuilder()).append("nom_he").append(cantidad).toString()) != null && request.getParameter((new StringBuilder()).append("nom_he").append(cantidad).toString()).length() > 0; cantidad++)
            {
                String nom = request.getParameter((new StringBuilder()).append("nom_he").append(cantidad).toString());
                String ape = request.getParameter((new StringBuilder()).append("ape_he").append(cantidad).toString());
                if(nom.length() == 0 && ape.length() == 0)
                    break;
                Hermano her = new Hermano();
                her.setId_hermano(-1);
                her.setFicha(ag.getFicha());
                her.setApellido(ape);
                her.setNombre(nom);
                String sexo = request.getParameter((new StringBuilder()).append("sexo_he").append(cantidad).toString());
                if(sexo.equals("M"))
                    her.setSexo('M');
                else
                if(sexo.equals("F"))
                    her.setSexo('F');
                her.setNacionalidad((Nacionalidad)getObjectByField("Nacionalidad", "descripcion", request.getParameter((new StringBuilder()).append("nac_he").append(cantidad).toString())));
                her.setNumeroDoc(request.getParameter((new StringBuilder()).append("num_he").append(cantidad).toString()));
                her.setTipoDoc((TipoDocumento)getObjectByField("TipoDocumento", "desc_tipo_documento", request.getParameter((new StringBuilder()).append("doc_he").append(cantidad).toString())));
                ag.getHermanos().add(her);
            }

            Transaction tx = null;
            try
            {
                tx = sesion.beginTransaction();
                if(update)
                    sesion.update(ag);
                else
                    sesion.save(ag);
                tx.commit();
                sesion.flush();
            }
            catch(ConstraintViolationException e)
            {
                tx.rollback();
                sesion.close();
                System.out.println("ERROR*****:");
                e.printStackTrace();
                return false;
            }
            catch(Exception e)
            {
                tx.rollback();
                sesion.close();
                return false;
            }
        }
        return true;
    }

    private String nfiltro;
    private String vfiltro;
}