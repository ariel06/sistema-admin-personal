// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:48:09 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Fecha.java

package auxclases;

import java.util.Date;

public class Fecha
{

    public Fecha()
    {
    }

    public static Date parseFecha(String dia, String mes, String anio)
    {
        if(dia != null && mes != null && anio != null)
        {
            Date fecha;
            try
            {
                int dd = (new Integer(dia)).intValue();
                int mm = (new Integer(mes)).intValue();
                int aaaa = (new Integer(anio)).intValue();
                fecha = new Date(aaaa - 1900, mm - 1, dd);
            }
            catch(Exception e)
            {
                fecha = null;
            }
            return fecha;
        } else
        {
            return null;
        }
    }
}