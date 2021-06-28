package org.example.printoffice.database;

import org.example.printoffice.database.entity.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import java.util.Properties;

public class HibernateSessionFactory {
	private static SessionFactory sessionFactory;
	private static final Properties properties = new Properties();
	static {
		properties.setProperty(Environment.DRIVER, "com.mysql.cj.jdbc.Driver");
		properties.setProperty(Environment.URL, "jdbc:mysql://127.0.0.1:3306/printoffice?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
		properties.setProperty(Environment.USER, "root");
		properties.setProperty(Environment.PASS, "");
		properties.setProperty(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
		properties.setProperty(Environment.SHOW_SQL, "true");
		properties.setProperty(Environment.FORMAT_SQL, "true");
	}
	private static void initializeSessionFactory() {
		try {

			Configuration configuration = new Configuration();
			configuration.addAnnotatedClass(Client.class);
			configuration.addAnnotatedClass(Document.class);
			configuration.addAnnotatedClass(Employee.class);
			configuration.addAnnotatedClass(Order.class);
			configuration.addAnnotatedClass(Print.class);
			configuration.addAnnotatedClass(PrintingMachine.class);
			ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
					.applySettings(properties)
					.build();
			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SessionFactory getSessionFactory() {
		if (sessionFactory == null) {
			initializeSessionFactory();
		}
		return sessionFactory;
	}
}

