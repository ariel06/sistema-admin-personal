// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:49:12 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   MotivoLicencia.java

package auxclases;


public class MotivoLicencia
{

    public MotivoLicencia()
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

    public int getId_motivo()
    {
        return id_motivo;
    }

    public void setId_motivo(int id_motivo)
    {
        this.id_motivo = id_motivo;
    }

    private int id_motivo;
    private String descripcion;
}