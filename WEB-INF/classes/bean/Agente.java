// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:55:27 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Agente.java

package bean;

import auxclases.*;
import java.util.*;

// Referenced classes of package bean:
//            Conyuge

public class Agente
{

    public boolean isEmpleo_publico()
    {
        return empleo_publico;
    }

    public void setEmpleo_publico(boolean empleo_publico)
    {
        this.empleo_publico = empleo_publico;
    }

    public Cementerio getCementerio()
    {
        return cementerio;
    }

    public void setCementerio(Cementerio cementerio)
    {
        this.cementerio = cementerio;
    }

    public Agente()
    {
        licencias = new HashSet();
        hijos = new HashSet();
        hermanos = new HashSet();
    }

    public String getApellido_casada()
    {
        return apellido_casada;
    }

    public void setApellido_casada(String apellido_casada)
    {
        this.apellido_casada = apellido_casada;
    }

    public String getApellido_materno()
    {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno)
    {
        this.apellido_materno = apellido_materno;
    }

    public String getApellido_paterno()
    {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno)
    {
        this.apellido_paterno = apellido_paterno;
    }

    public String getCalle()
    {
        return calle;
    }

    public void setCalle(String calle)
    {
        this.calle = calle;
    }

    public boolean isConduce_vehiculo()
    {
        return conduce_vehiculo;
    }

    public void setConduce_vehiculo(boolean conduce_vehiculo)
    {
        this.conduce_vehiculo = conduce_vehiculo;
    }

    public String getCuil()
    {
        return cuil;
    }

    public void setCuil(String cuil)
    {
        this.cuil = cuil;
    }

    public String getDepto()
    {
        return depto;
    }

    public void setDepto(String depto)
    {
        this.depto = depto;
    }

    public EstadoCivil getEstado_civil()
    {
        return estado_civil;
    }

    public void setEstado_civil(EstadoCivil estado_civil)
    {
        this.estado_civil = estado_civil;
    }

    public Date getFecha_actual()
    {
        return fecha_actual;
    }

    public void setFecha_actual(Date fecha_actual)
    {
        this.fecha_actual = fecha_actual;
    }

    public Date getFecha_casado()
    {
        return fecha_casado;
    }

    public void setFecha_casado(Date fecha_casado)
    {
        this.fecha_casado = fecha_casado;
    }

    public Date getFecha_ingreso_dgcem()
    {
        return fecha_ingreso_dgcem;
    }

    public void setFecha_ingreso_dgcem(Date fecha_ingreso_dgcem)
    {
        this.fecha_ingreso_dgcem = fecha_ingreso_dgcem;
    }

    public Date getFecha_ingreso_mun()
    {
        return fecha_ingreso_mun;
    }

    public void setFecha_ingreso_mun(Date fecha_ingreso_mun)
    {
        this.fecha_ingreso_mun = fecha_ingreso_mun;
    }

    public Date getFecha_nacimiento()
    {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento)
    {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public Date getFecha_radicacion()
    {
        return fecha_radicacion;
    }

    public void setFecha_radicacion(Date fecha_radicacion)
    {
        this.fecha_radicacion = fecha_radicacion;
    }

    public int getFicha()
    {
        return ficha;
    }

    public void setFicha(int ficha)
    {
        this.ficha = ficha;
    }

    public Funcion getFuncion()
    {
        return funcion;
    }

    public void setFuncion(Funcion funcion)
    {
        this.funcion = funcion;
    }

    public int getGrado()
    {
        return grado;
    }

    public void setGrado(int grado)
    {
        this.grado = grado;
    }

    public boolean isGuardia()
    {
        return guardia;
    }

    public void setGuardia(boolean guardia)
    {
        this.guardia = guardia;
    }

    public String getHora_desde()
    {
        return hora_desde;
    }

    public void setHora_desde(String hora_desde)
    {
        this.hora_desde = hora_desde;
    }

    public String getHora_hasta()
    {
        return hora_hasta;
    }

    public void setHora_hasta(String hora_hasta)
    {
        this.hora_hasta = hora_hasta;
    }

    public Set getLicencias()
    {
        return licencias;
    }

    public void setLicencias(Set licencias)
    {
        this.licencias = licencias;
    }

    public String getLocalidad()
    {
        return localidad;
    }

    public void setLocalidad(String localidad)
    {
        this.localidad = localidad;
    }

    public Nacionalidad getNacionalidad()
    {
        return nacionalidad;
    }

    public void setNacionalidad(Nacionalidad nacionalidad)
    {
        this.nacionalidad = nacionalidad;
    }

    public String getNivel()
    {
        return nivel;
    }

    public void setNivel(String nivel)
    {
        this.nivel = nivel;
    }

    public String getNombres()
    {
        return nombres;
    }

    public void setNombres(String nombres)
    {
        this.nombres = nombres;
    }

    public String getNumero_doc()
    {
        return numero_doc;
    }

    public void setNumero_doc(String numero_doc)
    {
        this.numero_doc = numero_doc;
    }

    public String getNumero_dom()
    {
        return numero_dom;
    }

    public void setNumero_dom(String numero_dom)
    {
        this.numero_dom = numero_dom;
    }

    public String getNumero_reg()
    {
        return numero_reg;
    }

    public void setNumero_reg(String numero_reg)
    {
        this.numero_reg = numero_reg;
    }

    public String getObservaciones()
    {
        return observaciones;
    }

    public void setObservaciones(String observaciones)
    {
        this.observaciones = observaciones;
    }

    public String getPais()
    {
        return pais;
    }

    public void setPais(String pais)
    {
        this.pais = pais;
    }

    public String getPiso()
    {
        return piso;
    }

    public void setPiso(String piso)
    {
        this.piso = piso;
    }

    public boolean isPosee_vehiculo()
    {
        return posee_vehiculo;
    }

    public void setPosee_vehiculo(boolean posee_vehiculo)
    {
        this.posee_vehiculo = posee_vehiculo;
    }

    public String getProvincia()
    {
        return provincia;
    }

    public void setProvincia(String provincia)
    {
        this.provincia = provincia;
    }

    public char getSexo()
    {
        return sexo;
    }

    public void setSexo(char sexo)
    {
        this.sexo = sexo;
    }

    public double getSueldo_bruto()
    {
        return sueldo_bruto;
    }

    public void setSueldo_bruto(double sueldo_bruto)
    {
        this.sueldo_bruto = sueldo_bruto;
    }

    public String getTelefono()
    {
        return telefono;
    }

    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }

    public TipoDocumento getTipo_doc()
    {
        return tipo_doc;
    }

    public void setTipo_doc(TipoDocumento tipo_doc)
    {
        this.tipo_doc = tipo_doc;
    }

    public Conyuge getConyuge()
    {
        return conyuge;
    }

    public void setConyuge(Conyuge conyuge)
    {
        this.conyuge = conyuge;
    }

    public Set getHermanos()
    {
        return hermanos;
    }

    public void setHermanos(Set hermanos)
    {
        this.hermanos = hermanos;
    }

    public Set getHijos()
    {
        return hijos;
    }

    public void setHijos(Set hijos)
    {
        this.hijos = hijos;
    }

    public boolean isInhabilitado()
    {
        return inhabilitado;
    }

    public void setInhabilitado(boolean inhabilitado)
    {
        this.inhabilitado = inhabilitado;
    }

    private int ficha;
     private int numero_ficha;

    public int getNumero_ficha() {
        return numero_ficha;
    }

    public void setNumero_ficha(int numero_ficha) {
        this.numero_ficha = numero_ficha;
    }
    private String nivel;
    private int grado;
    private Funcion funcion;
    private Date fecha_ingreso_mun;
    private Date fecha_ingreso_dgcem;
    private boolean guardia;
    private boolean inhabilitado;
    private boolean empleo_publico;
    private double sueldo_bruto;
    private String hora_desde;
    private String hora_hasta;
    private Date fecha_actual;
    private String apellido_paterno;
    private String apellido_materno;
    private String nombres;
    private char sexo;
    private Date fecha_nacimiento;
    private TipoDocumento tipo_doc;
    private String numero_doc;
    private String cuil;
    private Nacionalidad nacionalidad;
    private Date fecha_radicacion;
    private String telefono;
    private EstadoCivil estado_civil;
    private Date fecha_casado;
    private String apellido_casada;
    private String calle;
    private String numero_dom;
    private String piso;
    private String depto;
    private String localidad;
    private String provincia;
    private String pais;
    private boolean posee_vehiculo;
    private boolean conduce_vehiculo;
    private String numero_reg;
    private String observaciones;
    private Conyuge conyuge;
    private Cementerio cementerio;
    private Set licencias;
    private Set hijos;
    private Set hermanos;
}