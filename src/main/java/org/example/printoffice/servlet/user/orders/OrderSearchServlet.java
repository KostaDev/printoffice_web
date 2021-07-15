package org.example.printoffice.servlet.user.orders;

import org.example.printoffice.database.dao.OrderDAO;
import org.example.printoffice.database.entity.Order;
import org.example.printoffice.servlet.ServletWithContext;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/user/orders/search")
public class OrderSearchServlet extends ServletWithContext {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            String searchParam = getOrThrow(request, "search", "Please enter search parameter");
            List<Order> orderList = new OrderDAO().findByParametar(searchParam);
            if (orderList == null)
                throw new NullPointerException("no orders found");
            request.setAttribute("searchedOrderList", orderList);
            //actual search results


        } catch (NullPointerException npe){
            request.setAttribute("errors", new String[]{npe.getMessage()});
            request.setAttribute("searchedOrderList", new LinkedList<>());
            // new LinkedList is used to represent empty list user is getting if the search results for entered
            // parameter are null
        } catch (RuntimeException re){
            request.setAttribute("errors", new String[]{re.getMessage()});
            request.setAttribute("searchedOrderList",  null);
            // null is used because searchedOrderList attribute will be null when first loading the orders.jsp
            // and thus will fetch all orders from database, and I want the same result when the search parameter is null

        }
        request.getRequestDispatcher("/user/orders.jsp").forward(request,response);

    }

    private String getOrThrow(HttpServletRequest request, String param, String message) {
        String val = get(request,param);
        if (val == null || val.isEmpty()){
            throw new RuntimeException(message);
        }
        return val;
    }

    private String get(HttpServletRequest request, String param) {
        return request.getParameter(param);
    }
}
