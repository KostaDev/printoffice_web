package org.example.printoffice.database.dao;

public class DAOProvider {
	public static <T> GenericDAO<T> getDAO(Class<T> clazz) {
		return new GenericDAO<>(clazz);
	}
}
