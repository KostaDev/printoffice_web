package org.example.printoffice.servlet.user.orders;


import org.example.printoffice.database.dao.DAOProvider;
import org.example.printoffice.database.dao.GenericDAO;

import org.example.printoffice.database.entity.Document;
import org.example.printoffice.database.entity.Order;
import org.example.printoffice.database.entity.Print;
import org.example.printoffice.servlet.ServletWithContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user/orders/delete")
public class OrderDeleteServlet extends ServletWithContext {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String orderId = request.getParameter("order_id");
        if (orderId !=null && !orderId.isEmpty()){
            GenericDAO<Order> orderDAO = DAOProvider.getDAO(Order.class);
            GenericDAO<Document> documentDAO = DAOProvider.getDAO(Document.class);
            GenericDAO<Print> printDAO = DAOProvider.getDAO(Print.class);

            try {
                Order orderToRemove = orderDAO.find(Integer.parseInt(orderId));
                orderDAO.removeById(orderToRemove.getId());
                printDAO.removeById(orderToRemove.getPrint().getId());
                documentDAO.removeById(orderToRemove.getPrint().getDocument().getId());
                request.setAttribute("successes", "Order deleted!");


            } catch (Exception e) {
                request.setAttribute("errors", new String[]{e.getMessage()});
            }

            request.getRequestDispatcher("/user/orders.jsp").include(request,response);
        }
    }


}
