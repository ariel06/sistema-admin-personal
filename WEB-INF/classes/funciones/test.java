// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:01:51 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   test.java

package funciones;

import auxclases.MotivoLicencia;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;

// Referenced classes of package funciones:
//            ParteDiario

public class test
{

    public test()
    {
    }

    public static void main(String args[])
    {
        ParteDiario p = new ParteDiario();
        MotivoLicencia m;
        for(Iterator i = p.ResumenParteDiario("2006-06-13", false, false, null).iterator(); i.hasNext(); System.out.println(m.getId_motivo()))
        {
            Object o[] = (Object[])(Object[])i.next();
            m = (MotivoLicencia)o[0];
        }

    }
}