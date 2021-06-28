package org.example.printoffice.database.dao;

public class GenericDAO<T> extends AbstractDAO<T> {
	public GenericDAO(Class<T> entityClass) {
		super(entityClass);
	}
}
