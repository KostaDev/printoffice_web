<%@ page import="org.example.printoffice.database.entity.PrintingMachine" %>
<%@ page import="org.example.printoffice.database.dao.DAOProvider" %>
<%@ page import="org.example.printoffice.database.entity.Order" %>
<%@ page import="org.example.printoffice.security.AuthenticationContextHolder" %>
<%@ page import="org.example.printoffice.database.entity.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Comparator" %>
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
		List<Order> orders = DAOProvider.getDAO(Order.class).findAll();
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
