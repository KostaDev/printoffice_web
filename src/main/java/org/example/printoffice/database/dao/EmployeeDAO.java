package org.example.printoffice.database.dao;

import org.example.printoffice.database.entity.Employee;
import org.hibernate.Session;

import javax.persistence.Query;

public class EmployeeDAO extends AbstractDAO<Employee> {
	public EmployeeDAO() {
		super(Employee.class);
	}
	public Employee findByUsername(String username){
		Session session = getSession();
		Query query = session.createNamedQuery("Employee.findByUsername", Employee.class)
				.setParameter("username", username);
		return (Employee) query.getSingleResult();
	}
}
