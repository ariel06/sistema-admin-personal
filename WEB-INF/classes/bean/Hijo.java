// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:00:09 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Hijo.java

package bean;

import auxclases.Nacionalidad;
import auxclases.TipoDocumento;
import java.util.Date;

public class Hijo
{

    public Hijo()
    {
    }

    public int getId_hijo()
    {
        return id_hijo;
    }

    public void setId_hijo(int id_hijo)
    {
        this.id_hijo = id_hijo;
    }

    public String getApellido()
    {
        return apellido;
    }

    public void setApellido(String apellido)
    {
        this.apellido = apellido;
    }

    public Date getFechaNacimiento()
    {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento)
    {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getFicha()
    {
        return ficha;
    }

    public void setFicha(int ficha)
    {
        this.ficha = ficha;
    }

    public Nacionalidad getNacionalidad()
    {
        return nacionalidad;
    }

    public void setNacionalidad(Nacionalidad nacionalidad)
    {
        this.nacionalidad = nacionalidad;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getNumeroDoc()
    {
        return numeroDoc;
    }

    public void setNumeroDoc(String numeroDoc)
    {
        this.numeroDoc = numeroDoc;
    }

    public char getSexo()
    {
        return sexo;
    }

    public void setSexo(char sexo)
    {
        this.sexo = sexo;
    }

    public TipoDocumento getTipoDoc()
    {
        return tipoDoc;
    }

    public void setTipoDoc(TipoDocumento tipoDoc)
    {
        this.tipoDoc = tipoDoc;
    }

    private int ficha;
    private String nombre;
    private String apellido;
    private Date fechaNacimiento;
    private Nacionalidad nacionalidad;
    private char sexo;
    private TipoDocumento tipoDoc;
    private String numeroDoc;
    private int id_hijo;
}