// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:49:27 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   TipoDocumento.java

package auxclases;


public class TipoDocumento
{

    public TipoDocumento()
    {
    }

    public int getCod_tipo_documento()
    {
        return cod_tipo_documento;
    }

    public void setCod_tipo_documento(int cod_tipo_documento)
    {
        this.cod_tipo_documento = cod_tipo_documento;
    }

    public String getDesc_tipo_documento()
    {
        return desc_tipo_documento;
    }

    public void setDesc_tipo_documento(String desc_tipo_documento)
    {
        this.desc_tipo_documento = desc_tipo_documento;
    }

    private int cod_tipo_documento;
    private String desc_tipo_documento;
}