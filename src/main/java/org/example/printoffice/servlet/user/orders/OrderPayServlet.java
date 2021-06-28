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
import java.util.Map;

@WebServlet("/user/orders/pay")
public class OrderPayServlet extends ServletWithContext {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		GenericDAO<Order> orderDao = DAOProvider.getDAO(Order.class);
		String orderId = req.getParameter("order_id");

		Order order = orderDao.find(Integer.parseInt(orderId));
		order.setPaid(!order.isPaid());
		orderDao.update(order);

		resp.sendRedirect(servletContext + "/user/orders.jsp");
	}
}
