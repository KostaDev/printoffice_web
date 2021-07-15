package org.example.printoffice.database.entity;

import java.io.Serializable;
import java.time.*;
import javax.persistence.*;
import lombok.*;

@Data
@Entity(name = "Order")
@Table(name = "`order`")
@EqualsAndHashCode(callSuper = false, onlyExplicitlyIncluded = true)
@NamedQueries({
		@NamedQuery(name = "FindOrderByParametar", query = "select o from Order o where o.client.firstName like :parametar "+
				"or o.client.lastName like :parametar")
})
public class Order implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	@Column(name = "order_id")
	private Integer id;
	@JoinColumn(name = "print_id", referencedColumnName = "print_id")
	@ManyToOne
	private Print print;
	@JoinColumn(name = "client_id", referencedColumnName = "client_id")
	@ManyToOne
	private Client client;
	@Column(name = "order_date")
	private LocalDate orderDate;
	@Column(name = "price")
	private Float price;
	@Column(name = "paid")
	private boolean paid;
}