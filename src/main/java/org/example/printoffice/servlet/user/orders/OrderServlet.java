package org.example.printoffice.servlet.user.orders;

import org.example.printoffice.database.dao.DAOProvider;
import org.example.printoffice.database.dao.GenericDAO;
import org.example.printoffice.database.entity.*;
import org.example.printoffice.servlet.ServletWithContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.stream.Collectors;

@WebServlet("/user/orders/*")
public class OrderServlet extends ServletWithContext {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String orderIdStr = Arrays.stream(req.getRequestURI()
				.split("/"))
				.collect(Collectors.toCollection(LinkedList::new))
				.getLast();

		Integer orderId = null;
		try {
			orderId = Integer.parseInt(orderIdStr);
		} catch (Exception ignored) {
		}
		if (orderId != null) {
			GenericDAO<Order> orderDao = DAOProvider.getDAO(Order.class);
			Order order = orderDao.find(orderId);
			req.setAttribute("order", order);
			req.getRequestDispatcher("/user/order.jsp").forward(req, resp);
		} else {
			resp.sendRedirect(servletContext + "/user/orders.jsp");
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		GenericDAO<Order> orderDao = DAOProvider.getDAO(Order.class);
		try {
			Order order = validate(req);
			if (Integer.parseInt(get(req,"order_id"))==0)
			orderDao.create(order);
			else {
				order.setId(Integer.parseInt(get(req,"order_id")));
				orderDao.update(order);
			}
			resp.sendRedirect(servletContext + "/user/orders.jsp");
		} catch (Exception e) {
			req.setAttribute("errors", new String[]{e.getMessage()});
			req.getRequestDispatcher("/user/create-order.jsp").include(req, resp);
		}
	}

	public Order validate(HttpServletRequest req) {

		GenericDAO<Client> clientDao = DAOProvider.getDAO(Client.class);
		GenericDAO<Document> documentDao = DAOProvider.getDAO(Document.class);
		GenericDAO<Employee> employeeDao = DAOProvider.getDAO(Employee.class);
		GenericDAO<Print> printDao = DAOProvider.getDAO(Print.class);
		GenericDAO<PrintingMachine> printingMachineDao = DAOProvider.getDAO(PrintingMachine.class);

		Integer documentId;
		try{
			documentId = Integer.parseInt(get(req, "document_id"));
		} catch (NumberFormatException e){
			documentId=0;
		}

		Integer printId;
		try {
			printId = Integer.parseInt(get(req,"print_id"));
		} catch (NumberFormatException e){
			printId = 0;
		}
		String deadline = getOrThrow(req, "deadline", "Deadline must be set");
		String hardCover = get(req, "hard_cover");
		String printInstructions = get(req, "printing_instructions");
		String price = getOrThrow(req, "price", "Price must be set");

		String clientId = req.getParameter("client_id");

		String employeeId = req.getParameter("employee_id");
		String printingMachineId = getOrThrow(req, "printing_machine_id", "Must select a printing machine");
		String note = req.getParameter("note");
		String printDate = getOrThrow(req, "print_date", "Must set a print date");

		LocalDate datePrintDate;
		LocalDate dateDeadline;
		try {
			datePrintDate = LocalDate.parse(printDate);
			dateDeadline = LocalDate.parse(deadline);
		} catch (Exception ignored) {
			throw new RuntimeException("Invalid date");
		}

		if (dateDeadline.isBefore(datePrintDate)) {
			throw new RuntimeException("Print date must be before the deadline");
		}

		Document document = new Document();
		document.setHardCover(hardCover != null && hardCover.equals("on"));
		document.setPrintInstructions(printInstructions);
		document.setDeadline(dateDeadline);
		if (documentId==0) {
			documentId = documentDao.create(document);
			document.setId(documentId);
		} else {
			document.setId(documentId);
			documentDao.update(document);
		}





		Print print = new Print();
		Employee employee = employeeDao.find(Integer.parseInt(employeeId));
		PrintingMachine printingMachine = printingMachineDao.find(Integer.parseInt(printingMachineId));
		print.setEmployee(employee);
		print.setPrintingMachine(printingMachine);
		print.setNote(note);
		print.setPrintDate(datePrintDate);
		print.setDocument(document);
		if (printId== 0){
			printId = printDao.create(print);
			print.setId(printId);
		} else {
			print.setId(printId);
			printDao.update(print);
		}


		Order order = new Order();
		Client client;
		if (clientId != null && !clientId.isEmpty()) {
			client = clientDao.find(Integer.parseInt(clientId));
		} else {
			String firstName = getOrThrow(req, "first_name", "Client first name is required");
			String lastName = getOrThrow(req, "last_name", "Client last name is required");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			if (email == null && phone == null) {
				throw new RuntimeException("Must specify either phone or email");
			}
			client = new Client();
			client.setFirstName(firstName);
			client.setLastName(lastName);
			client.setEmail(email);
			client.setPhone(phone);
			Integer savedClientId = clientDao.create(client);
			client.setId(savedClientId);
		}
		order.setClient(client);
		order.setOrderDate(LocalDate.now());

		order.setPaid(false);
		order.setPrice(Float.parseFloat(price));
		order.setPrint(print);

		return order;
	}

	private String get(HttpServletRequest req, String param) {
		return req.getParameter(param);
	}

	private String getOrThrow(HttpServletRequest req, String param, String message) {
		String val = get(req, param);
		if (val == null || val.isEmpty()) {
			throw new RuntimeException(message);
		}
		return val;
	}
}
