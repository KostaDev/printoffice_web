package org.example.printoffice.database.entity;

import java.io.Serializable;
import java.time.*;
import javax.persistence.*;
import lombok.*;

@Data
@Entity
@Table(name = "document")
@EqualsAndHashCode(callSuper = false, onlyExplicitlyIncluded = true)
public class Document implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	@Column(name = "document_id")
	private Integer id;
	@Column(name = "deadline")
	private LocalDate deadline;
	@Column(name = "hard_cover")
	private boolean hardCover;
	@Column(name = "print_instructions")
	private String printInstructions;
	
}