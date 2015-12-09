// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:00:18 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Licencia.java

package bean;

import auxclases.MotivoLicencia;
import java.util.Date;

// Referenced classes of package bean:
//            Agente

public class Licencia
{

    public Agente getAgente()
    {
        return agente;
    }

    public void setAgente(Agente agente)
    {
        this.agente = agente;
    }

    public Licencia()
    {
        motivo = new MotivoLicencia();
    }

    public boolean isCon_sueldo()
    {
        return con_sueldo;
    }

    public void setCon_sueldo(boolean con_sueldo)
    {
        this.con_sueldo = con_sueldo;
    }

    public int getDuracion()
    {
        return duracion;
    }

    public void setDuracion(int duracion)
    {
        this.duracion = duracion;
    }

    public Date getFecha_desde()
    {
        return fecha_desde;
    }

    public void setFecha_desde(Date fecha_desde)
    {
        this.fecha_desde = fecha_desde;
    }

    public Date getFecha_hasta()
    {
        return fecha_hasta;
    }

    public void setFecha_hasta(Date fecha_hasta)
    {
        this.fecha_hasta = fecha_hasta;
    }

    public int getFicha()
    {
        return ficha;
    }

    public void setFicha(int ficha)
    {
        this.ficha = ficha;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public MotivoLicencia getMotivo()
    {
        return motivo;
    }

    public void setMotivo(MotivoLicencia motivo)
    {
        this.motivo = motivo;
    }

    public String getObservaciones()
    {
        return observaciones;
    }

    public void setObservaciones(String observaciones)
    {
        this.observaciones = observaciones;
    }

    private int ficha;
    private int duracion;
    private MotivoLicencia motivo;
    private boolean con_sueldo;
    private Date fecha_desde;
    private Date fecha_hasta;
    private String observaciones;
    private int id;
    private Agente agente;
}