// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:49:06 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Funcion.java

package auxclases;


public class Funcion
{

    public Funcion()
    {
    }

    public int getCod_funcion()
    {
        return cod_funcion;
    }

    public void setCod_funcion(int cod_funcion)
    {
        this.cod_funcion = cod_funcion;
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    private int cod_funcion;
    private String descripcion;
}