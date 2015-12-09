// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:47:52 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   DetallesInhabilitacion.java

package auxclases;


public class DetallesInhabilitacion
{

    public DetallesInhabilitacion()
    {
    }

    public void setDet_fecha_inhabilitado(String det_fecha_inhabilitado)
    {
        this.det_fecha_inhabilitado = det_fecha_inhabilitado;
    }

    public void setDet_fecha_sistema(String det_fecha_sistema)
    {
        this.det_fecha_sistema = det_fecha_sistema;
    }

    public String getDet_fecha_inhabilitado()
    {
        return det_fecha_inhabilitado;
    }

    public String getDet_fecha_sistema()
    {
        return det_fecha_sistema;
    }

    public void setDet_observaciones(String det_observaciones)
    {
        this.det_observaciones = det_observaciones;
    }

    public String getDet_observaciones()
    {
        return det_observaciones;
    }

    public void setDet_operacion(String det_operacion)
    {
        this.det_operacion = det_operacion;
    }

    public String getDet_operacion()
    {
        return det_operacion;
    }

    public void setDet_agente_nombre(String det_agente_nombre)
    {
        this.det_agente_nombre = det_agente_nombre;
    }

    public String getDet_agente_nombre()
    {
        return det_agente_nombre;
    }

    public void setDet_agente_apellido(String det_agente_apellido)
    {
        this.det_agente_apellido = det_agente_apellido;
    }

    public void setDet_ficha(String det_ficha)
    {
        this.det_ficha = det_ficha;
    }

    public void setDet_id(int det_id)
    {
        this.det_id = det_id;
    }

    public void setDet_motivo(String det_motivo)
    {
        this.det_motivo = det_motivo;
    }

    public void setDet_usuario(String det_usuario)
    {
        this.det_usuario = det_usuario;
    }

    public String getDet_agente_apellido()
    {
        return det_agente_apellido;
    }

    public String getDet_ficha()
    {
        return det_ficha;
    }

    public int getDet_id()
    {
        return det_id;
    }

    public String getDet_motivo()
    {
        return det_motivo;
    }

    public String getDet_usuario()
    {
        return det_usuario;
    }

    private int det_id;
    private String det_usuario;
    private String det_ficha;
    private String det_agente_apellido;
    private String det_agente_nombre;
    private String det_motivo;
    private String det_operacion;
    private String det_observaciones;
    private String det_fecha_inhabilitado;
    private String det_fecha_sistema;
}