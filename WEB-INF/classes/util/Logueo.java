// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:02:48 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Logueo.java

package util;

import bean.Usuario;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

// Referenced classes of package util:
//            HibernateUtil

public class Logueo
{

    public Logueo()
    {
    }

    public static Usuario esta_usuario(String nombreusuario, String clave)
    {
        Session sesion = HibernateUtil.currentSession();
        List listaUsu = sesion.createQuery((new StringBuilder()).append("from Usuario as usu where usu.nombre_usuario='").append(nombreusuario).append("'and usu.clave='").append(clave).append("'").toString()).list();
        if(!listaUsu.isEmpty())
            return (Usuario)listaUsu.get(0);
        else
            return null;
    }
}