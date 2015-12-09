// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:00:47 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Perfil.java

package bean;

import java.util.HashSet;
import java.util.Set;

public class Perfil
{

    public Perfil()
    {
        nfiltro = null;
        funciones = new HashSet();
    }

    public Set getFunciones()
    {
        return funciones;
    }

    public void setFunciones(Set funciones)
    {
        this.funciones = funciones;
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id_perfil)
    {
        id = id_perfil;
    }

    int id;
    String descripcion;
    String nfiltro;
    String vfiltro;
    Set funciones;
}