// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:02:47 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Principal.java

package util;

import auxclases.Cementerio;
import bean.Agente;
import bean.Licencia;
import funciones.ParteDiario;
import java.io.PrintStream;
import java.util.*;
import org.hibernate.Session;

// Referenced classes of package util:
//            HibernateUtil

public class Principal
{

    public Principal()
    {
    }

    public static void main(String args[])
    {
        ParteDiario par = new ParteDiario();
        Session sesion = HibernateUtil.currentSession();
        org.hibernate.Transaction tx = sesion.beginTransaction();
        Date fecha_desde = new Date();
        Date fecha_hasta = new Date();
        fecha_desde.setDate(12);
        fecha_desde.setMonth(4);
        fecha_desde.setYear(2005);
        fecha_hasta.setDate(12);
        fecha_hasta.setMonth(5);
        fecha_hasta.setYear(2006);
        ArrayList con = par.Parte_periodo("2006-06-12", "2006-06-12", false, false, "FL", "4");
        if(!con.isEmpty())
        {
            Licencia lic;
            for(Iterator ite = con.iterator(); ite.hasNext(); System.out.println(lic.getAgente().getCementerio().getDescripcion()))
            {
                lic = (Licencia)ite.next();
                System.out.println(lic);
            }

        }
    }
}