package org.example.printoffice.database;

import org.hibernate.HibernateException;
import org.hibernate.Session;

public class HibernateSessionHolder {
	private static Session session = null;
	public static Session getSession() {
		if (session == null){
			try {
				session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			} catch (HibernateException ignored){
				session = HibernateSessionFactory.getSessionFactory().openSession();
			}
		} else {
			if (!session.isOpen()){
				session = HibernateSessionFactory.getSessionFactory().openSession();
			}
		}
		return session;
	}
}
