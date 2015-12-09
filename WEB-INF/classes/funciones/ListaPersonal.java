// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:01:51 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   ListaPersonal.java

package funciones;

import bean.Agente;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.*;
import util.HibernateUtil;

public class ListaPersonal
{

    public ListaPersonal()
    {
    }

    public ArrayList CrearListaPersonal(String orderBy, String cementerio, boolean epublico)
    {
        ArrayList resul = new ArrayList();
        Session sesion = HibernateUtil.currentSession();
        Transaction tx = sesion.beginTransaction();
        String q = "from Agente as age ";
        if(cementerio != null)
        {
            q = (new StringBuilder()).append(q).append("where age.cementerio.cem_id='").append(cementerio).append("' ").toString();
            if(epublico)
                q = (new StringBuilder()).append(q).append(" and age_empleo_publico = true ").toString();
            else
                q = (new StringBuilder()).append(q).append(" and age_empleo_publico = false ").toString();
        } else
        if(epublico)
            q = (new StringBuilder()).append(q).append(" where age_empleo_publico = true ").toString();
        else
            q = (new StringBuilder()).append(q).append(" where age_empleo_publico = false ").toString();
        q = (new StringBuilder()).append(q).append("order by age.").append(orderBy).toString();
        Query query = sesion.createQuery(q);
        Agente ag;
        for(Iterator it = query.iterate(); it.hasNext(); resul.add(ag))
            ag = (Agente)it.next();

        tx.commit();
        return resul;
    }
}