package org.example.printoffice.servlet.user.printingMachines;

import org.example.printoffice.database.dao.DAOProvider;
import org.example.printoffice.database.entity.PrintingMachine;
import org.example.printoffice.servlet.ServletWithContext;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/printing-machines/delete")
public class PrintingMachineDeleteServlet extends ServletWithContext {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String machineId = req.getParameter("printing_machine_id");
		if (machineId != null && !machineId.isEmpty()) {
			DAOProvider.getDAO(PrintingMachine.class)
					.removeById(Integer.parseInt(machineId));
		}
		resp.sendRedirect(servletContext + "/user/printing-machines.jsp");
	}
}
