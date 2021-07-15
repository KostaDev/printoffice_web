package org.example.printoffice.database.dao;

import org.example.printoffice.database.entity.Order;
import org.hibernate.Session;

import javax.persistence.Query;
import java.util.List;

public class OrderDAO extends AbstractDAO<Order> {
    public OrderDAO() {
        super(Order.class);
    }
    public List<Order> findByParametar(String param){
        Session session = getSession();
        Query query = session.createNamedQuery("FindOrderByParametar", Order.class)
                .setParameter("parametar","%"+ param+"%");
        List<Order> orderList;

        orderList = query.getResultList();
        if (orderList == null || orderList.isEmpty())
            orderList=null;

        return orderList;
    }
}
