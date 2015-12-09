// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:00:59 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Usuario.java

package bean;

import java.util.Iterator;
import java.util.Set;

// Referenced classes of package bean:
//            Funciones, Perfil

public class Usuario
{

    public Usuario()
    {
    }

    public String getApellido()
    {
        return apellido;
    }

    public void setApellido(String apellido)
    {
        this.apellido = apellido;
    }

    public String getClave()
    {
        return clave;
    }

    public void setClave(String clave)
    {
        this.clave = clave;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getNombre_usuario()
    {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario)
    {
        this.nombre_usuario = nombre_usuario;
    }

    public Perfil getPerfil()
    {
        return perfil;
    }

    public void setPerfil(Perfil perfil)
    {
        this.perfil = perfil;
    }

    public boolean funcionHabilitada(String fun)
    {
        if(perfil == null)
            return false;
        for(Iterator it = perfil.getFunciones().iterator(); it.hasNext();)
        {
            Funciones f = (Funciones)it.next();
            if(f.getMenu().equals(fun))
                return true;
        }

        return false;
    }

    String nombre;
    String apellido;
    String nombre_usuario;
    String clave;
    private int id;
    Perfil perfil;
}