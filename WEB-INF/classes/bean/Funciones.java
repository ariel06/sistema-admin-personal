// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:59:39 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Funciones.java

package bean;


public class Funciones
{

    public Funciones()
    {
    }

    public String getMenu()
    {
        return menu;
    }

    public void setMenu(String menu)
    {
        this.menu = menu;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
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

    public void setId(int id_funcion)
    {
        id = id_funcion;
    }

    int id;
    String descripcion;
    String url;
    private String menu;
}