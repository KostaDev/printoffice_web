package org.example.printoffice.database.entity;

import java.io.Serializable;
import javax.persistence.*;
import lombok.*;

@Data
@Entity
@Table(name = "client")
@EqualsAndHashCode(callSuper = false, onlyExplicitlyIncluded = true)
public class Client implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	@Column(name = "client_id")
	private Integer id;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "email")
	private String email;
	@Column(name = "phone")
	private String phone;
	
}