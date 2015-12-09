// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:03:16 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Menu.java

package view;

import bean.*;
import java.util.Iterator;
import java.util.Set;

public class Menu
{

    public Menu()
    {
    }

    public String mostrarMenu(Usuario user)
    {
        StringBuffer buffer = new StringBuffer();
        buffer.append("<DIV id=\"contenedor\">\n");
        buffer.append("<DIV id=\"barra\" style=\"width:526px\">\n");
        buffer.append("<DIV id=\"barraizq\"></DIV>");
        buffer.append("<DIV id=\"botones\">\n");
        buffer.append("<A title=\"Pagina inicial\" href=\"principal.jsp\"><IMG id=\"btn_home\" src=\"imagenes/btn_home2.gif\" border=\"0\"></A>\n");
        if(user.funcionHabilitada("LI"))
            buffer.append("<A title=Licencias><IMG id=\"btn_listados\" src=\"imagenes/btn_listados.gif\" border=\"0\"></A>\n");
        if(user.funcionHabilitada("AG"))
            buffer.append("<A title=Agentes><IMG id=\"btn_agentes\" src=\"imagenes/btn_agentes.gif\" border=\"0\"></A>\n");
        if(user.funcionHabilitada("LC"))
            buffer.append("<A title=Licencias><IMG id=\"btn_licencias\" src=\"imagenes/btn_licencias.gif\" border=\"0\"></A>\n");
        buffer.append("<A title=Contrasenia><IMG id=\"btn_contrasenia\" src=\"imagenes/btn_contrasenia.gif\" border=\"0\"></A>\n");
        buffer.append("<A title=Ayuda href=\"index.jsp\"><IMG id=\"btn_ayuda\" src=\"imagenes/btn_ayuda.gif\" border=\"0\"></A>\n");
        buffer.append("<DIV id=\"barrader\"></DIV>");
        buffer.append("</DIV>");
        buffer.append("<DIV id=\"menues\">");
        buffer.append("<OL class=\"desplegable\" id=\"menu2\">");
        Iterator LO = user.getPerfil().getFunciones().iterator();
        do
        {
            if(!LO.hasNext())
                break;
            Funciones f = (Funciones)LO.next();
            if(f.getMenu().equals("LI"))
                buffer.append((new StringBuilder()).append("<LI><A href=\"").append(f.getUrl()).append("\">").append(f.getDescripcion()).append("</A></LI>\n").toString());
        } while(true);
        buffer.append("</OL>");
        buffer.append("<OL class=\"desplegable\" id=\"menu3\">");
        Iterator AG = user.getPerfil().getFunciones().iterator();
        do
        {
            if(!AG.hasNext())
                break;
            Funciones f = (Funciones)AG.next();
            if(f.getMenu().equals("AG"))
                buffer.append((new StringBuilder()).append("<LI><A href=\"").append(f.getUrl()).append("\">").append(f.getDescripcion()).append("</A></LI>\n").toString());
        } while(true);
        buffer.append("</OL>");
        buffer.append("<OL class=\"desplegable\" id=\"menu4\">");
        Iterator LC = user.getPerfil().getFunciones().iterator();
        do
        {
            if(!LC.hasNext())
                break;
            Funciones f = (Funciones)LC.next();
            if(f.getMenu().equals("LC"))
                buffer.append((new StringBuilder()).append("<LI><A href=\"").append(f.getUrl()).append("\">").append(f.getDescripcion()).append("</A></LI>\n").toString());
        } while(true);
        buffer.append("</OL>");
        buffer.append("<OL class=\"desplegable\" id=\"menu5\">\n");
        buffer.append("  <LI><A href=\"cambiar_pass.jsp\">Modificar contrase\uFFFDa</A></LI>\n");
        buffer.append("</OL>\n");
        buffer.append("<OL class=\"desplegable\" id=\"menu6\"></OL>");
        buffer.append("</DIV>");
        buffer.append("</DIV>");
        buffer.append("<SCRIPT type=text/javascript>prepararMenu();</SCRIPT>");
        buffer.append("</DIV>");
        return buffer.toString();
    }
}