<%@ page import="org.example.printoffice.database.entity.PrintingMachine" %>
<%@ page import="org.example.printoffice.database.dao.DAOProvider" %>
<%@ page import="org.example.printoffice.database.entity.Order" %>
<%@ page import="org.example.printoffice.security.AuthenticationContextHolder" %>
<%@ page import="org.example.printoffice.database.entity.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="<%=session.getAttribute("lang")%>">
<head>
	<jsp:include page="../include/head.jsp"/>
	<title>Printing Machines</title>
</head>
<body>
<jsp:include page="../include/nav.jsp"/>
<main>
	<%
		pageContext.setAttribute("user", AuthenticationContextHolder.getUser());
		List<Order> orders;
		List<Order> searchedOrders = (List<Order>) request.getAttribute("searchedOrderList");
		if (searchedOrders == null){
			orders = DAOProvider.getDAO(Order.class).findAll();
		} else if (searchedOrders.isEmpty()){

			orders = new LinkedList<>();
		} else {
		    orders = searchedOrders;
		}

		orders.sort(Comparator.comparing(a -> a.getPrint().getDocument().getDeadline()));
		pageContext.setAttribute("orders", orders);
		pageContext.setAttribute("machines", DAOProvider.getDAO(PrintingMachine.class).findAll());
		pageContext.setAttribute("clients", DAOProvider.getDAO(Client.class).findAll());
	%>
	<br/>
	<div class="row">
		<div class="col s12">
			<a class="btn text-white grey" href="<c:url value="/user/create-order.jsp"/>"><i class="material-icons left">local_printshop</i>add order</a>
		</div>

		<div class="input-field col s12">
			<form class="container" method="get" action="<c:url value="/user/orders/search"/>">
				<input name="search" type="text">
				<button class="btn" type="submit">search<i class="material-icons right">search</i></button>
				<jsp:include page="../fragment/errorList.jsp"/>
				<jsp:include page="../fragment/successList.jsp"/>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col s12">
			<table class="responsive-table">
				<thead>
				<tr>
					<th>ID</th>
					<th>Client</th>
					<th>Deadline</th>
					<th>Print date</th>
					<th>Price</th>
					<th>Paid</th>
					<th>Actions</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="order" items="${orders}">
					<tr>
						<td>${order.id}</td>
						<td>${order.client.firstName} ${order.client.lastName}</td>
						<td>${order.print.document.deadline}</td>
						<td>${order.print.printDate}</td>
						<td>${order.price}</td>
						<td>${order.paid ? 'Yes' : ''}</td>
						<td>
							<form method="post" action="<c:url value="/user/orders/pay"/>">
								<input name="order_id" type="hidden" value="${order.id}">
								<button type="submit" class="btn-flat theme-foreground-light-text tooltipped"
										data-tooltip="Toggle paid">
									<i class="material-icons">
											${order.paid ? 'money_off' : 'attach_money'}
									</i>
								</button>
							</form>
							<form method="get"
								  action="<c:url value="/user/orders/${order.id}"/>">
								<button type="submit" class="btn-flat theme-foreground-light-text tooltipped"
										data-tooltip="Show more">
									<i class="material-icons">open_in_new</i>
								</button>
							</form>
							<form method="post" action="<c:url value="/user/orders/delete" />">
								<input name="order_id" type="hidden" value="${order.id}">
								<button class="btn-flat red theme-foreground-light-text tooltipped" type="submit"
									data-tooltip="Delete">
									<i class="material-icons">delete</i>
								</button>
							</form>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</main>
<jsp:include page="../include/footer.jsp"/>
</body>
<jsp:include page="../fragment/materializeTooltip.jsp"/>
</html>
