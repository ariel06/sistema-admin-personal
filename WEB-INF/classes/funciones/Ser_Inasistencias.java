// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:01:51 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Ser_Inasistencias.java

package funciones;

import auxclases.Cementerio;
import auxclases.MotivoLicencia;
import bean.Agente;
import bean.Licencia;
import java.io.PrintStream;
import java.util.*;
import org.hibernate.*;
import util.HibernateUtil;

public class Ser_Inasistencias
{

    public Ser_Inasistencias()
    {
        sesion = HibernateUtil.currentSession();
        lista = new ArrayList();
        listaInasistenciasModificables = new ArrayList();
        lista_motivos = new ArrayList();
    }

    public Licencia getLicenciarepetida()
    {
        return licenciarepetida;
    }

    public void setLicenciarepetida(Licencia licenciarepetida)
    {
        this.licenciarepetida = licenciarepetida;
    }

    public Agente darAgente()
    {
        return ag;
    }

    public Cementerio darCementerio(String id_cem)
    {
        Session ses = HibernateUtil.currentSession();
        Query lis = ses.createQuery((new StringBuilder()).append("from Cementerio as cem where cem.cem_id='").append(id_cem).append("'").toString());
        if(!lis.list().isEmpty())
        {
            Iterator ite = lis.iterate();
            Cementerio cem = (Cementerio)ite.next();
            return cem;
        } else
        {
            Cementerio cem1 = new Cementerio();
            return cem1;
        }
    }

    public boolean Esta_licencia(Date F_des, Date F_has, int numficha, Cementerio cem)
    {
        for(Iterator ite5 = crearListaInasistencias(numficha, cem).iterator(); ite5.hasNext();)
        {
            Licencia lic = (Licencia)ite5.next();
            System.out.println(lic.getFicha());
            System.out.println(lic.getFecha_desde());
            System.out.println(lic.getFecha_hasta());
            if(lic.getFecha_desde() != null)
            {
                if(lic.getFecha_desde().before(F_des) && lic.getFecha_hasta().after(F_des) || lic.getFecha_desde().equals(F_des) || F_des.equals(lic.getFecha_hasta()))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(lic.getFecha_hasta().getDate() == F_des.getDate() && lic.getFecha_hasta().getMonth() == F_des.getMonth() && lic.getFecha_hasta().getYear() == F_des.getYear())
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(lic.getFecha_desde().before(F_has) && lic.getFecha_hasta().after(F_has) || lic.getFecha_desde().equals(F_has) || lic.getFecha_hasta().equals(F_has))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(F_des.before(lic.getFecha_desde()) && F_has.after(lic.getFecha_desde()))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(F_des.before(lic.getFecha_hasta()) && F_has.after(lic.getFecha_hasta()))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
            }
        }

        return false;
    }

    public boolean Esta_licencia_a_modificar(Date F_des, Date F_has, int id, Cementerio cem)
    {
        for(Iterator ite = crearListaModificarLicencias(id, cem).iterator(); ite.hasNext();)
        {
            Licencia lic = (Licencia)ite.next();
            if(lic.getId() != id)
            {
                if(lic.getFecha_desde().before(F_des) && lic.getFecha_hasta().after(F_des) || lic.getFecha_desde().equals(F_des) || F_des.equals(lic.getFecha_hasta()))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(lic.getFecha_hasta().getDate() == F_des.getDate() && lic.getFecha_hasta().getMonth() == F_des.getMonth() && lic.getFecha_hasta().getYear() == F_des.getYear())
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(lic.getFecha_desde().before(F_has) && lic.getFecha_hasta().after(F_has) || lic.getFecha_desde().equals(F_has) || lic.getFecha_hasta().equals(F_has))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(F_des.before(lic.getFecha_desde()) && F_has.after(lic.getFecha_desde()))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
                if(F_des.before(lic.getFecha_hasta()) && F_has.after(lic.getFecha_hasta()))
                {
                    setLicenciarepetida(lic);
                    return true;
                }
            }
        }

        return false;
    }

    public ArrayList darListaMotivoLicencia()
    {
        Session sesion = HibernateUtil.currentSession();
        Query consulta = sesion.createQuery("from auxclases.MotivoLicencia as mot order by mot.id_motivo");
        MotivoLicencia mot;
        for(Iterator ite = consulta.iterate(); ite.hasNext(); mot.getDescripcion())
        {
            mot = (MotivoLicencia)ite.next();
            lista_motivos.add(mot);
        }

        return lista_motivos;
    }

    public MotivoLicencia darMotivo(String descripcion)
    {
        Session sesion = HibernateUtil.currentSession();
        MotivoLicencia moti = null;
        sesion = HibernateUtil.currentSession();
        List consulta = sesion.createQuery((new StringBuilder()).append("from auxclases.MotivoLicencia as mot where mot.descripcion ='").append(descripcion).append("'").toString()).list();
        return (MotivoLicencia)consulta.get(0);
    }

    public void guardarLicencia(Licencia lic1)
    {
        Session ses = HibernateUtil.currentSession();
        Transaction t = ses.beginTransaction();
        ses.save(lic1);
        ses.flush();
        t.commit();
    }

    public void modificarLicencia(Licencia lic1)
    {
        sesion.update(lic1);
        sesion.flush();
        tx.commit();
    }

    public ArrayList crearListaInasistencias(int numeroFicha, Cementerio cem)
    {
        Session sesion = HibernateUtil.currentSession();
        lista.clear();
        Query consulta;
        if(cem.getCem_id() != null)
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where ag.ficha =").append(numeroFicha).append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString());
        else
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where ag.ficha =").append(numeroFicha).append("and ag.inhabilitado=FALSE").toString());
        Iterator ite = consulta.iterate();
        if(ite.hasNext())
        {
            ag = (Agente)ite.next();
            ultima_consulta = "encontro";
            Query consulta1 = sesion.createQuery((new StringBuilder()).append("from bean.Licencia as lic where lic.ficha =").append(numeroFicha).append(" order by lic.fecha_desde").toString());
            for(Iterator ina = consulta1.iterate(); ina.hasNext(); lista.add(ina.next()));
            if(consulta1.list().isEmpty())
            {
                Licencia lic = new Licencia();
                lic.setAgente(ag);
                lista.add(lic);
            }
        } else
        {
            ultima_consulta = "no encontro";
        }
        return lista;
    }

    public Date darFechaActual()
    {
        long seg = System.currentTimeMillis();
        Date fechaActual = new Date(seg);
        fechaActual.setMonth(fechaActual.getMonth());
        fechaActual.setYear(fechaActual.getYear());
        return fechaActual;
    }

    public Date darFechaMesAnterior()
    {
        long seg = System.currentTimeMillis();
        Date fechaActual = new Date(seg);
        fechaActual.setMonth(fechaActual.getMonth() - 1);
        fechaActual.setYear(fechaActual.getYear());
        return fechaActual;
    }

    public ArrayList crearListaModificarLicencias(int numeroFicha, Cementerio cem)
    {
        Session sesion = HibernateUtil.currentSession();
        Query lista_agente;
        if(cem.getCem_id() != null)
            lista_agente = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where ag.ficha =").append(numeroFicha).append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString());
        else
            lista_agente = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where ag.ficha =").append(numeroFicha).append(" and ag.inhabilitado=FALSE").toString());
        if(!lista_agente.list().isEmpty())
        {
            Session s = HibernateUtil.currentSession();
            Date hoy = new Date(System.currentTimeMillis());
            String mes_anterior = null;
            if(hoy.getMonth() != 0)
                mes_anterior = (new StringBuilder()).append("'").append(hoy.getYear() + 1900).append("-").append(hoy.getMonth()).append("-").append(hoy.getDay()).append("'").toString();
            else
                mes_anterior = (new StringBuilder()).append("'").append(hoy.getYear() + 1899).append("-").append(12).append("-").append(hoy.getDay()).append("'").toString();
            String consulta = (new StringBuilder()).append("from bean.Licencia as lic where lic.ficha=").append(numeroFicha).append(" and lic.fecha_hasta >").append(mes_anterior).toString();
            List lista = s.createQuery(consulta).list();
            return (ArrayList)lista;
        } else
        {
            return new ArrayList();
        }
    }

    public ArrayList crearListaInasistencias(String apellido, String nombre, Cementerio cem)
    {
        Session sesion = HibernateUtil.currentSession();
        lista.clear();
        apellido = apellido.toUpperCase();
        nombre = nombre.toUpperCase();
        List consulta;
        if(cem.getCem_id() != null)
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("%'and upper(ag.nombres) like '").append(nombre).append("%'").append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString()).list();
        else
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("%'and upper(ag.nombres) like '").append(nombre).append("%' and ag.inhabilitado=FALSE").toString()).list();
        if(!consulta.isEmpty())
        {
            Iterator ite = consulta.iterator();
            ag = (Agente)ite.next();
            System.out.println(ag.getApellido_paterno());
            System.out.println(ag.getNombres());
            System.out.println(ag.getFicha());
            ultima_consulta = "encontro";
            System.out.println(ag.getFicha());
            List consult = sesion.createQuery((new StringBuilder()).append("from bean.Licencia as lic where lic.ficha =").append(ag.getFicha()).append(" order by lic.fecha_desde").toString()).list();
            for(Iterator it = consult.iterator(); it.hasNext(); lista.add(it.next()));
            if(consult.isEmpty())
            {
                Licencia lic = new Licencia();
                lic.setAgente(ag);
                lista.add(lic);
            }
        } else
        {
            apellido = apellido.toUpperCase();
            nombre = nombre.toUpperCase();
            apellido = (new StringBuilder()).append(apellido).append("%").toString();
            nombre = (new StringBuilder()).append(nombre).append("%").toString();
            Query consulta1;
            if(cem.getCem_id() != null)
                consulta1 = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("'").append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString());
            else
                consulta1 = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("' and ag.inhabilitado=FALSE").toString());
            Iterator ite1 = consulta1.iterate();
            if(!consulta1.list().isEmpty())
            {
                ultima_consulta = "encontro";
                System.out.println("dssdsd");
                ag = (Agente)ite1.next();
                List consult = sesion.createQuery((new StringBuilder()).append("from bean.Licencia as lic where lic.ficha =").append(ag.getFicha()).append(" order by lic.fecha_desde").toString()).list();
                for(Iterator ite_ina1 = ag.getLicencias().iterator(); ite_ina1.hasNext(); lista.add(ite_ina1.next()));
                if(consult.isEmpty())
                {
                    Licencia lic = new Licencia();
                    lic.setAgente(ag);
                    lista.add(lic);
                }
            }
        }
        if(lista.isEmpty())
            ultima_consulta = "no encontro";
        return lista;
    }

    public ArrayList crearListaModificarInasistencias(String apellido, String nombre, Cementerio cem)
    {
        long seg = System.currentTimeMillis();
        Date fechaActual = new Date(seg);
        fechaActual.setMonth(fechaActual.getMonth());
        fechaActual.setYear(fechaActual.getYear() + 1900);
        Date fechaMesAntes = darFechaActual();
        fechaMesAntes.setMonth(fechaMesAntes.getMonth() - 1);
        Session sesion = HibernateUtil.currentSession();
        this.lista.clear();
        apellido = apellido.toUpperCase();
        nombre = nombre.toUpperCase();
        List consulta;
        if(cem.getCem_id() != null)
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("%'and upper(ag.nombres) like '").append(nombre).append("%'").append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString()).list();
        else
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("%'and upper(ag.nombres) like '").append(nombre).append("%' and ag.inhabilitado=FALSE").toString()).list();
        if(!consulta.isEmpty())
        {
            int numeroFicha = ((Agente)consulta.get(0)).getFicha();
            Date hoy = new Date(System.currentTimeMillis());
            GregorianCalendar gc = new GregorianCalendar();
            gc.setTime(hoy);
            String mes_anterior = null;
            if(hoy.getMonth() != 0)
                mes_anterior = (new StringBuilder()).append("'").append(hoy.getYear() + 1900).append("-").append(hoy.getMonth()).append("-").append(hoy.getDay()).append("'").toString();
            else
                mes_anterior = (new StringBuilder()).append("'").append(hoy.getYear() + 1899).append("-").append(12).append("-").append(hoy.getDay()).append("'").toString();
            String consulta1 = (new StringBuilder()).append("from bean.Licencia as lic where lic.ficha=").append(numeroFicha).append(" and lic.fecha_hasta > ").append(mes_anterior).toString();
            List lista = sesion.createQuery(consulta1).list();
            return (ArrayList)lista;
        }
        apellido = apellido.toUpperCase();
        nombre = nombre.toUpperCase();
        apellido = (new StringBuilder()).append(apellido).append("%").toString();
        nombre = (new StringBuilder()).append(nombre).append("%").toString();
        Query consulta1;
        if(cem.getCem_id() != null)
            consulta1 = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("'").append(" and ag.cementerio ='").append(cem.getCem_id()).append("'").toString());
        else
            consulta1 = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("'").toString());
        Iterator ite1 = consulta1.iterate();
        if(!consulta1.list().isEmpty())
        {
            int numeroFicha = ((Agente)consulta.get(0)).getFicha();
            Date hoy = new Date(System.currentTimeMillis());
            String fecha_actual = (new StringBuilder()).append(hoy.getYear() + 1900).append("-").append(hoy.getMonth() + 1).append("-").append(hoy.getDay()).toString();
            String mes_anterior = (new StringBuilder()).append(hoy.getYear() + 1900).append("-").append(hoy.getMonth()).append("-").append(hoy.getDay()).toString();
            String mes_siguiente = (new StringBuilder()).append(hoy.getYear() + 1900).append("-").append(hoy.getMonth() + 2).append("-").append(hoy.getDay()).toString();
            String consult = (new StringBuilder()).append("from bean.Licencia as lic where lic.ficha=").append(numeroFicha).append(" and lic.fecha_hasta > ").append(mes_anterior).toString();
            List lista = sesion.createQuery(consult).list();
            if(lista.isEmpty())
            {
                Licencia lic = new Licencia();
                lic.setAgente(ag);
                lista.add(lic);
            }
            return (ArrayList)lista;
        } else
        {
            return this.lista;
        }
    }

    private Date fecha_Verdadera(Date fechalic)
    {
        Date fecha_aux = new Date();
        fecha_aux.setYear(fechalic.getYear() + 1900);
        fecha_aux.setMonth(fechalic.getMonth() + 1);
        fecha_aux.setDate(fechalic.getDate());
        return fecha_aux;
    }

    public Date fecha_Guardar_Base(Date fechalic)
    {
        Date fecha_aux = new Date();
        fecha_aux.setYear(fechalic.getYear() - 1900);
        fecha_aux.setMonth(fechalic.getMonth() - 1);
        fecha_aux.setDate(fechalic.getDate());
        return fecha_aux;
    }

    public ArrayList crearListaInasistencias(String apellido, String nombre, Date fecha_desde, Date fecha_hasta, Cementerio cem)
    {
        Session sesion = HibernateUtil.currentSession();
        lista.clear();
        apellido = apellido.toUpperCase();
        nombre = nombre.toUpperCase();
        Query consulta;
        if(cem.getCem_id() != null)
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("'").append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString());
        else
            consulta = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("' and ag.inhabilitado=FALSE").toString());
        if(!consulta.list().isEmpty())
        {
            ultima_consulta = "encontro";
            Iterator ite = consulta.iterate();
            ag = (Agente)ite.next();
            List con = sesion.createQuery((new StringBuilder()).append("from bean.Licencia as lic where lic.ficha =").append(ag.getFicha()).append(" order by lic.fecha_desde").toString()).list();
            Iterator ite_ina = con.iterator();
            do
            {
                if(!ite_ina.hasNext())
                    break;
                Licencia lic = (Licencia)ite_ina.next();
                Date fecha_des = fecha_Verdadera(lic.getFecha_desde());
                if(fecha_desde.before(fecha_des) && fecha_hasta.after(fecha_des))
                    lista.add(lic);
            } while(true);
            if(con.isEmpty())
            {
                Licencia lic = new Licencia();
                lic.setAgente(ag);
                lista.add(lic);
            }
        } else
        {
            apellido = apellido.toUpperCase();
            nombre = nombre.toUpperCase();
            apellido = (new StringBuilder()).append(apellido).append("%").toString();
            nombre = (new StringBuilder()).append(nombre).append("%").toString();
            Query consulta1;
            if(cem.getCem_id() != null)
                consulta1 = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("'").append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString());
            else
                consulta1 = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where upper(ag.apellido_paterno) like '").append(apellido).append("'and upper(ag.nombres) like '").append(nombre).append("' and ag.inhabilitado=FALSE").toString());
            if(!consulta1.list().isEmpty())
            {
                ultima_consulta = "encontro";
                Iterator ite1 = consulta1.iterate();
                ag = (Agente)ite1.next();
                List con1 = sesion.createQuery((new StringBuilder()).append("from bean.Licencia as lic where lic.ficha =").append(ag.getFicha()).append(" order by lic.fecha_desde").toString()).list();
                Iterator ite_ina1 = con1.iterator();
                do
                {
                    if(!ite_ina1.hasNext())
                        break;
                    Licencia lic = (Licencia)ite_ina1.next();
                    Date fecha_des = fecha_Verdadera(lic.getFecha_desde());
                    if(fecha_desde.before(fecha_des) && fecha_hasta.after(fecha_des))
                        lista.add(lic);
                } while(true);
                if(con1.isEmpty())
                {
                    Licencia lic = new Licencia();
                    lic.setAgente(ag);
                    lista.add(lic);
                }
            }
        }
        if(lista.isEmpty())
            ultima_consulta = "no encontro";
        return lista;
    }

    public Date fecha(String dia, String mes, String anio)
    {
        Date fecha_desde = new Date();
        Integer d = new Integer(dia);
        Integer m = new Integer(mes);
        Integer a = new Integer(anio);
        fecha_desde.setDate(d.intValue());
        fecha_desde.setMonth(m.intValue());
        fecha_desde.setYear(a.intValue());
        return fecha_desde;
    }

    public Date fechaint(int dia, int mes, int anio)
    {
        Date fecha_desde = new Date();
        fecha_desde.setDate(dia);
        fecha_desde.setMonth(mes);
        fecha_desde.setYear(anio - 1900);
        return fecha_desde;
    }

    public ArrayList lista_dias(Date fechaO, Date fechaD, Date fecha_desde, Date fecha_hasta)
    {
        lista.clear();
        System.out.println("metodo magico");
        System.out.println((new StringBuilder()).append("fechaO= ").append(fechaO.toString()).toString());
        System.out.println((new StringBuilder()).append("fechaD= ").append(fechaD.toString()).toString());
        System.out.println((new StringBuilder()).append("fecha_desde= ").append(fecha_desde.toString()).toString());
        System.out.println((new StringBuilder()).append("fecha_hasta= ").append(fecha_hasta.toString()).toString());
        if((fechaO.before(fecha_desde) || fechaO.equals(fecha_desde)) && (fechaD.before(fecha_hasta) || fechaD.equals(fecha_hasta)))
        {
            for(int i = 1; i <= fechaD.getDate(); i++)
                lista.add(Integer.valueOf(i));

        }
        if(fechaO.after(fecha_desde) && (fechaD.before(fecha_hasta) || fechaD.equals(fecha_hasta)))
        {
            for(int i = fechaO.getDate(); i <= fechaD.getDate(); i++)
                lista.add(Integer.valueOf(i));

        }
        if(fechaO.after(fecha_desde) && fechaD.after(fecha_hasta))
        {
            for(int i = fechaO.getDate(); i <= fecha_hasta.getDate(); i++)
                lista.add(Integer.valueOf(i));

        }
        if(fechaO.before(fecha_desde) && fechaD.after(fecha_hasta))
        {
            for(int i = fecha_desde.getDate(); i <= fecha_hasta.getDate(); i++)
                lista.add(Integer.valueOf(i));

        }
        return lista;
    }

    public ArrayList crearListaInasistencias(int numeroFicha, Date fechaDesde, Date fechaHasta, Cementerio cem)
    {
        Session s = HibernateUtil.currentSession();
        lista.clear();
        List lista_agente;
        if(cem.getCem_id() != null)
            lista_agente = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where ag.ficha =").append(numeroFicha).append(" and ag.cementerio ='").append(cem.getCem_id()).append("' and ag.inhabilitado=FALSE").toString()).list();
        else
            lista_agente = sesion.createQuery((new StringBuilder()).append("from bean.Agente as ag where ag.ficha =").append(numeroFicha).append(" and ag.inhabilitado=FALSE").toString()).list();
        Iterator ite1 = lista_agente.iterator();
        if(!lista_agente.isEmpty())
        {
            ag = (Agente)ite1.next();
            ultima_consulta = "encontro";
            List con = sesion.createQuery((new StringBuilder()).append("from bean.Licencia as lic where lic.ficha =").append(ag.getFicha()).append(" order by lic.fecha_desde").toString()).list();
            Iterator ite_ina = con.iterator();
            do
            {
                if(!ite_ina.hasNext())
                    break;
                Licencia lic = (Licencia)ite_ina.next();
                Date fecha_des = fecha_Verdadera(lic.getFecha_desde());
                if(fechaDesde.before(fecha_des) && fechaHasta.after(fecha_des))
                    lista.add(lic);
            } while(true);
            if(con.isEmpty())
            {
                Licencia lic = new Licencia();
                lic.setAgente(ag);
                lista.add(lic);
            }
            ultima_consulta = "encontro";
        }
        return lista;
    }

    Session sesion;
    Transaction tx;
    public String ultima_consulta;
    private Agente ag;
    private ArrayList lista;
    private ArrayList listaInasistenciasModificables;
    public ArrayList lista_motivos;
    private Licencia licenciarepetida;
    private Cementerio cementerio;
}