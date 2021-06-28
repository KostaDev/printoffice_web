package org.example.printoffice.database.entity;

import java.io.Serializable;
import javax.persistence.*;
import lombok.*;

@Data
@Entity
@Table(name = "employee")
@EqualsAndHashCode(callSuper = false, onlyExplicitlyIncluded = true)
@NamedQueries({
		@NamedQuery(name = "Employee.findByUsername", query = "select e from Employee e where e.username = :username"),
		@NamedQuery(name = "Employee.findByFirstName", query = "select e from Employee e where e.firstName = :firstName"),
		@NamedQuery(name = "Employee.findByLastName", query = "select e from Employee e where e.lastName = :lastName")
})
public class Employee implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	@Column(name = "employee_id")
	private Integer id;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "username")
	private String username;
	@Column(name = "password")
	private String password;
	
}