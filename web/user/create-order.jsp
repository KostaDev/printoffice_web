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
			<a class="btn text-white grey" href="<c:url value="/user/orders"/>"><i class="material-icons left">arrow_left</i>orders</a>
		</div>
	</div>
	<div class="row">
		<div class="col s12">
			<form class="container" method="post" action="<c:url value="/user/orders"/>">
				<jsp:include page="../fragment/errorList.jsp"/>
				<input name="order_id" value="0" type="hidden">
				<input name="print_id" value="" type="hidden">
				<input name="employee_id" value="${user.id}" type="hidden">
				<div class="row">
					<h2>Document</h2>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input name="deadline" type="date">
						<label>Deadline</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<p>
							<label>
								<input class="filled-in" name="hard_cover" type="checkbox"/>
								<span>Hard Cover</span>
							</label>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input name="price" type="text">
						<label>Price</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<textarea name="printing_instructions" class="materialize-textarea"></textarea>
						<label>Printing Instructions</label>
					</div>
				</div>
				<div class="row">
					<h2>Client</h2>
				</div>
				<div class="row">
					<h4>Choose a client</h4>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<select name="client_id">
							<option value="" disabled selected>Choose a client</option>
							<c:forEach var="client" items="${clients}">
								<option value="${client.id}">${client.firstName} ${client.lastName}</option>
							</c:forEach>
						</select>
						<label>Client</label>
					</div>
				</div>
				<div class="row">
					<h4>or add a new one</h4>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input name="first_name" type="text">
						<label>First Name</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input name="last_name" type="text">
						<label>Last Name</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input name="email" type="email">
						<label>Email</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input name="phone" type="text">
						<label>Phone</label>
					</div>
				</div>
				<div class="row">
					<h2>Printing</h2>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<select name="printing_machine_id">
							<option value="" disabled selected>Choose a machine</option>
							<c:forEach var="machine" items="${machines}">
								<option value="${machine.id}">${machine.make} ${machine.model}</option>
							</c:forEach>
						</select>
						<label>Printing Machine</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input type="text" disabled value="${user.firstName} ${user.lastName}">
						<label>Employee</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<input name="print_date" type="date">
						<label>Print Date</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<textarea name="note" class="materialize-textarea"></textarea>
						<label>Note</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l6 xl6">
						<button class="btn" type="submit">add<i class="material-icons right">add</i></button>
					</div>
				</div>
			</form>
		</div>
	</div>
</main>
<jsp:include page="../include/footer.jsp"/>
</body>
<jsp:include page="../fragment/materializeUpdateTextFields.jsp"/>
<jsp:include page="../fragment/materializeSelect.jsp"/>
<jsp:include page="../fragment/materializeTextarea.jsp"/>
</html>
