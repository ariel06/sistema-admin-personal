// Decompiled by DJ v3.10.10.93 Copyright 2007 Atanas Neshkov  Date: 03/11/2009 09:02:47 a.m.
// Home Page: http://members.fortunecity.com/neshkov/dj.html  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   HibernateUtil.java

package util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import util.HibernateUtil;

public class HibernateUtil
{

    public HibernateUtil()
    {
    }

    public static Session currentSession()
    {
        Session s = (Session)session.get();
        if(s == null)
        {
            s = sessionFactory.openSession();
            session.set(s);
        } else
        if(!s.isOpen())
        {
            session.set(null);
            s = sessionFactory.openSession();
            session.set(s);
        }
        return s;
    }

    public static void closeSession()
    {
        Session s = (Session)session.get();
        if(s != null)
            s.close();
        session.set(null);
    }

    public static SessionFactory getSessionFactory()
    {
        return sessionFactory;
    }

    private static Log log;
    private static final SessionFactory sessionFactory;
    private static final Configuration conf;
    public static final ThreadLocal session = new ThreadLocal();

    static 
    {
        log = LogFactory.getLog(util.HibernateUtil.class);
        try
        {
            conf = new Configuration();
            sessionFactory = conf.configure().buildSessionFactory();
        }
        catch(Throwable ex)
        {
            log.error("Initial SessionFactory creation failed.", ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
}