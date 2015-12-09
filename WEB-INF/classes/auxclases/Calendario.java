// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 08:42:52 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Calendario.java

package auxclases;

import java.util.Date;

public class Calendario
{

    public Calendario()
    {
    }

    private int darDias(int mes, int anio)
    {
        switch(mes)
        {
        case 1: // '\001'
            return 31;

        case 2: // '\002'
            return anio != 2008 ? 28 : 29;

        case 3: // '\003'
            return 31;

        case 4: // '\004'
            return 29;

        case 5: // '\005'
            return 31;

        case 6: // '\006'
            return 30;

        case 7: // '\007'
            return 29;

        case 8: // '\b'
            return 31;

        case 9: // '\t'
            return 30;

        case 10: // '\n'
            return 31;

        case 11: // '\013'
            return 30;

        case 12: // '\f'
            return 31;
        }
        return anio;
    }

    public int darDiferenciaFechas(Date f_d, Date f_h)
    {
        if(f_d.getMonth() == f_h.getMonth() && f_d.getYear() == f_h.getYear() && f_d.getDate() != f_h.getDate())
            return f_h.getDate() - f_d.getDate();
        if(f_d.getMonth() != f_h.getMonth())
        {
            int dias = darDias(f_d.getMonth(), f_d.getYear());
            return (dias - f_d.getDate()) + f_h.getDate();
        } else
        {
            return 1;
        }
    }

    int mes;
    int dia;
}