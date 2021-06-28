package org.example.printoffice.security;

import org.example.printoffice.database.entity.Employee;

public class User extends Employee {
	public User(String username, String password){
		super();
		this.setUsername(username);
		this.setPassword(password);
	}
	public User(Employee employee){
		super();
		this.setId(employee.getId());
		this.setUsername(employee.getUsername());
		this.setPassword(employee.getPassword());
		this.setFirstName(employee.getFirstName());
		this.setLastName(employee.getLastName());
	}
}
