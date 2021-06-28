package org.example.printoffice.database.entity;

import java.io.Serializable;
import java.time.*;
import javax.persistence.*;

import lombok.*;

@Data
@Entity
@Table(name = "print")
@EqualsAndHashCode(callSuper = false, onlyExplicitlyIncluded = true)
public class Print implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	@Column(name = "print_id")
	private Integer id;
	@JoinColumn(name = "document_id", referencedColumnName = "document_id")
	@ManyToOne
	private Document document;
	@JoinColumn(name = "printing_machine_id", referencedColumnName = "printing_machine_id")
	@ManyToOne
	private PrintingMachine printingMachine;
	@JoinColumn(name = "employee_id", referencedColumnName = "employee_id")
	@ManyToOne
	private Employee employee;
	@Column(name = "note")
	private String note;
	@Column(name = "print_date")
	private LocalDate printDate;
}