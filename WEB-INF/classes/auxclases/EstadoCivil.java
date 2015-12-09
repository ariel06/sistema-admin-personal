// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:47:59 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   EstadoCivil.java

package auxclases;


public class EstadoCivil
{

    public EstadoCivil()
    {
    }

    public int getCod_estado_civil()
    {
        return cod_estado_civil;
    }

    public void setCod_estado_civil(int cod_estado_civil)
    {
        this.cod_estado_civil = cod_estado_civil;
    }

    public String getDesc_estado_civil()
    {
        return desc_estado_civil;
    }

    public void setDesc_estado_civil(String desc_estado_civil)
    {
        this.desc_estado_civil = desc_estado_civil;
    }

    private int cod_estado_civil;
    private String desc_estado_civil;
}