package org.example.printoffice.servlet.user.printingMachines;

import org.example.printoffice.database.dao.DAOProvider;
import org.example.printoffice.database.dao.GenericDAO;
import org.example.printoffice.database.entity.PrintingMachine;
import org.example.printoffice.servlet.ServletWithContext;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/user/printing-machines")
public class PrintingMachineServlet extends ServletWithContext {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String machineId = req.getParameter("printing_machine_id");
		String make = req.getParameter("make");
		String model = req.getParameter("model");
		String manufacturingDate = req.getParameter("manufacturing_date");
		String description = req.getParameter("description");

		PrintingMachine machine = new PrintingMachine();
		machine.setMake(make);
		machine.setModel(model);
		machine.setManufacturingDate(LocalDate.parse(manufacturingDate));
		machine.setDescription(description);

		GenericDAO<PrintingMachine> dao = DAOProvider.getDAO(PrintingMachine.class);

		if (machineId == null || machineId.isEmpty()) {
			dao.create(machine);
		} else {
			machine.setId(Integer.parseInt(machineId));
			dao.update(machine);
		}
		resp.sendRedirect(servletContext + "/user/printing-machines.jsp");
	}
}
