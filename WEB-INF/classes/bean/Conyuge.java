// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:59:29 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Conyuge.java

package bean;

import auxclases.Nacionalidad;
import java.util.Date;

// Referenced classes of package bean:
//            Agente

public class Conyuge
{

    public Conyuge()
    {
    }

    public Agente getAgente()
    {
        return agente;
    }

    public void setAgente(Agente agente)
    {
        this.agente = agente;
    }

    public String getApellido()
    {
        return apellido;
    }

    public void setApellido(String apellido)
    {
        this.apellido = apellido;
    }

    public String getDondeTrabaja()
    {
        return dondeTrabaja;
    }

    public void setDondeTrabaja(String dondeTrabaja)
    {
        this.dondeTrabaja = dondeTrabaja;
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

    public int getFicha_conyuge()
    {
        return ficha_conyuge;
    }

    public void setFicha_conyuge(int ficha_conyuge)
    {
        this.ficha_conyuge = ficha_conyuge;
    }

    public int getId_conyuge()
    {
        return id_conyuge;
    }

    public void setId_conyuge(int id_conyuge)
    {
        this.id_conyuge = id_conyuge;
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

    public boolean isTrabaja()
    {
        return trabaja;
    }

    public void setTrabaja(boolean trabaja)
    {
        this.trabaja = trabaja;
    }

    public Date getTrabajaDesde()
    {
        return trabajaDesde;
    }

    public void setTrabajaDesde(Date trabajaDesde)
    {
        this.trabajaDesde = trabajaDesde;
    }

    private int ficha;
    private String nombre;
    private String apellido;
    private Date fechaNacimiento;
    private Nacionalidad nacionalidad;
    private boolean trabaja;
    private String dondeTrabaja;
    private Date trabajaDesde;
    private int ficha_conyuge;
    private Agente agente;
    private int id_conyuge;
}