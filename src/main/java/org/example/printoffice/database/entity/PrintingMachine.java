package org.example.printoffice.database.entity;

import java.io.Serializable;
import java.time.*;
import javax.persistence.*;
import lombok.*;

@Data
@Entity
@Table(name = "printing_machine")
@EqualsAndHashCode(callSuper = false, onlyExplicitlyIncluded = true)
public class PrintingMachine implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	@Column(name = "printing_machine_id")
	private Integer id;
	@Column(name = "description")
	private String description;
	@Column(name = "manufacturing_date")
	private LocalDate manufacturingDate;
	@Column(name = "make")
	private String make;
	@Column(name = "model")
	private String model;
	
}