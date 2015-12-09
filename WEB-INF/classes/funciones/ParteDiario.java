// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:01:51 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ParteDiario.java

package funciones;

import bean.Licencia;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.*;
import util.HibernateUtil;

// Referenced classes of package funciones:
//            Debug

public class ParteDiario
{

    public ParteDiario()
    {
    }

    public ArrayList CrearListaParteDiario(String fecha, boolean guardia, boolean ep, String cem)
    {
        ArrayList resul = new ArrayList();
        Session sesion = HibernateUtil.currentSession();
        Transaction tx = sesion.beginTransaction();
        String consulta;
        if(!guardia)
            consulta = (new StringBuilder()).append("from Licencia as lic where :param1>=lic.fecha_desde and :param1<=lic.fecha_hasta and lic.agente.guardia=").append(guardia).append(" and lic.agente.empleo_publico=").append(ep).toString();
        else
            consulta = (new StringBuilder()).append("from Licencia as lic where (:param1>=lic.fecha_desde and :param1<=lic.fecha_hasta and lic.agente.empleo_publico=").append(ep).append(")").append(" and (lic.agente.guardia=true or ina_motivo = 3 or ina_motivo = 4 or ina_motivo = 5 or ina_motivo = 6)").toString();
        if(cem != null)
            consulta = (new StringBuilder()).append(consulta).append(" and lic.agente.cementerio.cem_id='").append(cem).append("'").toString();
        consulta = (new StringBuilder()).append(consulta).append(" order by lic.motivo.id_motivo asc, lic.ficha asc").toString();
        Query query = sesion.createQuery(consulta);
        Query q2 = query.setString("param1", fecha);
        Licencia lic;
        for(Iterator it = q2.iterate(); it.hasNext(); Debug.view(lic))
        {
            lic = (Licencia)it.next();
            resul.add(lic);
        }

        tx.commit();
        return resul;
    }

    public ArrayList ResumenParteDiario(String fecha, boolean guardia, boolean ep, String cem)
    {
        ArrayList res = new ArrayList();
        Session sesion = HibernateUtil.currentSession();
        String consulta = (new StringBuilder()).append("select lic.motivo, count(lic.agente) from Licencia lic where :param1>=lic.fecha_desde and :param1<=lic.fecha_hasta and lic.agente.guardia=").append(guardia).append(" and lic.agente.empleo_publico=").append(ep).toString();
        if(cem != null)
            consulta = (new StringBuilder()).append(consulta).append(" and lic.agente.cementerio.cem_id='").append(cem).append("'").toString();
        consulta = (new StringBuilder()).append(consulta).append(" group by lic.motivo.id_motivo order by lic.motivo.id_motivo").toString();
        Query query = sesion.createQuery(consulta);
        Query q2 = query.setString("param1", fecha);
        Object o[];
        for(Iterator it = q2.iterate(); it.hasNext(); res.add(((Object) (o))))
            o = (Object[])(Object[])it.next();

        return res;
    }

    public ArrayList Parte_periodo(String fechadesde, String fechahasta, boolean guardia, boolean ep, String cem, String mot_lic)
    {
        ArrayList res = new ArrayList();
        Session sesion = HibernateUtil.currentSession();
        Transaction tx = sesion.beginTransaction();
        System.out.println((new StringBuilder()).append("empleo publico= ").append(ep).toString());
        System.out.println((new StringBuilder()).append("mot licencia= ").append(mot_lic).toString());
        String consulta;
        if(!guardia)
            consulta = (new StringBuilder()).append("from Licencia as lic where ((lic.fecha_desde <= '").append(fechahasta).append("' and lic.fecha_desde >= '").append(fechadesde).append("')").append("or (lic.fecha_desde <= '").append(fechadesde).append("' and lic.fecha_hasta >= '").append(fechahasta).append("')or (lic.fecha_desde >= '").append(fechadesde).append("' and lic.fecha_hasta <= '").append(fechahasta).append("') or (lic.fecha_hasta <= '").append(fechahasta).append("' ").append("and lic.fecha_hasta >= '").append(fechadesde).append("'  ))").append(" and lic.agente.guardia=").append(guardia).append(" and lic.agente.empleo_publico=").append(ep).append(" and lic.motivo=").append(mot_lic).toString();
        else
            consulta = (new StringBuilder()).append("from Licencia as lic where ((lic.fecha_desde <= '").append(fechahasta).append("' and lic.fecha_desde >= '").append(fechadesde).append("')").append("or (lic.fecha_desde <= '").append(fechadesde).append("' and lic.fecha_hasta >= '").append(fechahasta).append("')or (lic.fecha_desde >= '").append(fechadesde).append("' and lic.fecha_hasta <= '").append(fechahasta).append("') or (lic.fecha_hasta <= '").append(fechahasta).append("' ").append("and lic.fecha_hasta >= '").append(fechadesde).append("'  ))").append(" and lic.agente.empleo_publico=").append(ep).append(" and (lic.agente.guardia=true)").toString();
        if(cem != null)
            consulta = (new StringBuilder()).append(consulta).append(" and lic.agente.cementerio.cem_id='").append(cem).append("'").toString();
        consulta = (new StringBuilder()).append(consulta).append("  order by lic.agente.apellido_paterno,lic.agente.nombres").toString();
        Query query = sesion.createQuery(consulta);
        Licencia lic;
        for(Iterator it = query.iterate(); it.hasNext(); res.add(lic))
            lic = (Licencia)it.next();

        tx.commit();
        return res;
    }

    public String Parte_periodo1(String fechadesde, String fechahasta, boolean guardia, boolean ep, String cem, String mot_lic)
    {
        ArrayList res = new ArrayList();
        Session sesion = HibernateUtil.currentSession();
        Transaction tx = sesion.beginTransaction();
        String consulta = (new StringBuilder()).append("from Licencia as lic where (lic.fecha_desde <= '").append(fechahasta).append("' and lic.fecha_desde >= '").append(fechadesde).append("') or (lic.fecha_hasta <= '").append(fechahasta).append("' ").append("and lic.fecha_hasta >= '").append(fechadesde).append("'  )").append(" and lic.agente.guardia=").append(guardia).append(" and lic.agente.empleo_publico=").append(ep).append(" and lic.motivo.id_motivo=").append(mot_lic).toString();
        if(cem != null)
            consulta = (new StringBuilder()).append(consulta).append("  and lic.agente.cementerio.cem_id='F'").toString();
        consulta = (new StringBuilder()).append(consulta).append(" order by lic.fecha_desde").toString();
        return consulta;
    }
}