// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:49:19 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Nacionalidad.java

package auxclases;


public class Nacionalidad
{

    public Nacionalidad()
    {
    }

    public String getDescripcion()
    {
        return descripcion;
    }

    public void setDescripcion(String descripcion)
    {
        this.descripcion = descripcion;
    }

    public int getId_nacionalidad()
    {
        return id_nacionalidad;
    }

    public void setId_nacionalidad(int id_nacionalidad)
    {
        this.id_nacionalidad = id_nacionalidad;
    }

    private int id_nacionalidad;
    private String descripcion;
}