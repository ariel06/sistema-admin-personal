// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:01:49 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Debug.java

package funciones;

import auxclases.*;
import bean.*;
import java.io.PrintStream;
import java.util.Date;

public class Debug
{

    public Debug()
    {
    }

    public static void view(Hermano h)
    {
        System.out.println("[Hermano:]");
        System.out.println((new StringBuilder()).append("Apellido: ").append(h.getApellido()).toString());
        System.out.println((new StringBuilder()).append("Nombre: ").append(h.getNombre()).toString());
        if(h.getTipoDoc() != null)
            System.out.println((new StringBuilder()).append(h.getTipoDoc().getDesc_tipo_documento()).append(": ").append(h.getNumeroDoc()).toString());
        else
            System.out.println("No hay dato en documento");
        System.out.println((new StringBuilder()).append("Ficha: ").append(h.getFicha()).toString());
        System.out.println((new StringBuilder()).append("Sexo: ").append(h.getSexo()).toString());
        if(h.getNacionalidad() != null)
            System.out.println((new StringBuilder()).append("Nacionalidad: ").append(h.getNacionalidad().getDescripcion()).toString());
        else
            System.out.println("No hay datos en nacionalidad");
        System.out.println("[Fin - Hermano]");
    }

    public static void view(Hijo h)
    {
        System.out.println("[Hijo:]");
        System.out.println((new StringBuilder()).append("Apellido: ").append(h.getApellido()).toString());
        System.out.println((new StringBuilder()).append("Nombre: ").append(h.getNombre()).toString());
        if(h.getTipoDoc() != null)
            System.out.println((new StringBuilder()).append(h.getTipoDoc().getDesc_tipo_documento()).append(": ").append(h.getNumeroDoc()).toString());
        else
            System.out.println("No hay dato en documento");
        System.out.println((new StringBuilder()).append("Ficha: ").append(h.getFicha()).toString());
        System.out.println((new StringBuilder()).append("Sexo: ").append(h.getSexo()).toString());
        if(h.getNacionalidad() != null)
            System.out.println((new StringBuilder()).append("Nacionalidad: ").append(h.getNacionalidad().getDescripcion()).toString());
        else
            System.out.println("No hay datos en nacionalidad");
        if(h.getFechaNacimiento() != null)
            System.out.println((new StringBuilder()).append("Fecha nacimiento: ").append(h.getFechaNacimiento().toString()).toString());
        System.out.println("[Fin - Hijo]");
    }

    public static void view(Licencia lic)
    {
        System.out.println("[Inasistecia - licencia:]");
        System.out.println((new StringBuilder()).append("Ficha: ").append(lic.getFicha()).toString());
        if(lic.getAgente() != null)
            System.out.println((new StringBuilder()).append("Apellido: ").append(lic.getAgente().getApellido_paterno()).toString());
        if(lic.getMotivo() != null)
            System.out.println((new StringBuilder()).append("Motivo: ").append(lic.getMotivo().getDescripcion()).toString());
        System.out.println((new StringBuilder()).append("Duracion: ").append(lic.getDuracion()).toString());
        System.out.println((new StringBuilder()).append("Desde: ").append(lic.getFecha_desde()).toString());
        System.out.println((new StringBuilder()).append("Hasta: ").append(lic.getFecha_hasta()).toString());
        System.out.println((new StringBuilder()).append("Observaciones: ").append(lic.getObservaciones()).toString());
        System.out.println((new StringBuilder()).append("Con sueldo: ").append(lic.isCon_sueldo()).toString());
        System.out.println("[Fin inasistencia - licencia]");
    }

    public static void view(Conyuge con)
    {
        System.out.println("[conyuge:]");
        System.out.println((new StringBuilder()).append("Ficha: ").append(con.getFicha()).toString());
        System.out.println((new StringBuilder()).append("Apellido: ").append(con.getApellido()).toString());
        System.out.println((new StringBuilder()).append("Nombre: ").append(con.getNombre()).toString());
        if(con.getFechaNacimiento() != null)
            System.out.println((new StringBuilder()).append("Fecha nacimiento: ").append(con.getFechaNacimiento().toString()).toString());
        if(con.getNacionalidad() != null)
            System.out.println((new StringBuilder()).append("Nacionalidad: ").append(con.getNacionalidad().getDescripcion()).toString());
        if(con.isTrabaja())
        {
            System.out.println((new StringBuilder()).append("Trabaja en: ").append(con.getDondeTrabaja()).toString());
            System.out.println((new StringBuilder()).append("Desde: ").append(con.getTrabajaDesde()).toString());
        }
        System.out.println((new StringBuilder()).append("Ficha conyuge: ").append(con.getFicha_conyuge()).toString());
        System.out.println("[fin conyuge]");
    }

    public static void view(Agente ag)
    {
        System.out.println("[Agente:]");
        System.out.println((new StringBuilder()).append("Ficha: ").append(ag.getFicha()).toString());
        System.out.println((new StringBuilder()).append("Apellido: ").append(ag.getApellido_paterno()).toString());
        System.out.println((new StringBuilder()).append("Nombre: ").append(ag.getNombres()).toString());
        if(ag.getFecha_nacimiento() != null)
            System.out.println((new StringBuilder()).append("Fecha nacimiento: ").append(ag.getFecha_nacimiento().toString()).toString());
        if(ag.getNacionalidad() != null)
            System.out.println((new StringBuilder()).append("Nacionalidad: ").append(ag.getNacionalidad().getDescripcion()).toString());
        System.out.println("[fin agente]");
    }
}