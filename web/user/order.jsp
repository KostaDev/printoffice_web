<%@ page import="org.example.printoffice.database.entity.Order" %>
<%@ page import="org.example.printoffice.database.dao.DAOProvider" %>

<%@ page import="org.example.printoffice.database.entity.Client" %>
<%@ page import="org.example.printoffice.database.entity.PrintingMachine" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="<%=session.getAttribute("lang")%>">
<head>
	<jsp:include page="../include/head.jsp"/>
	<title>Order ${order.id}</title>
</head>
<body>
<jsp:include page="../include/nav.jsp"/>
<main class="container">
	<%
		Order order = (Order) request.getAttribute("order");
		pageContext.setAttribute("order", order);
		List<Client> clientList = DAOProvider.getDAO(Client.class).findAll();
		clientList.remove(order.getClient());
		List<PrintingMachine> printingMachineList = DAOProvider.getDAO(PrintingMachine.class).findAll();
		printingMachineList.remove(order.getPrint().getPrintingMachine());
		pageContext.setAttribute("clients", clientList);
		pageContext.setAttribute("machines", printingMachineList);
	%>
	<br/>
	<div class="row">
		<div class="col s12">
			<a class="btn text-white grey" href="<c:url value="/user/orders"/>"><i class="material-icons left">arrow_left</i>orders</a>
		</div>
	</div>
	<form class="container" method="post" action="<c:url value="/user/orders"/>">
		<input name="order_id" value="${order.id}" type="hidden">
		<input name="print_id" value="${order.print.id}" type="hidden">
		<input name="employee_id" value="${user.id}" type="hidden">
		<input name="document_id" value="${order.print.document.id}" type="hidden">
		<div class="col s12 m12 l6 xl6">
			<div class="row">
				<h2>Document</h2>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="deadline" type="date" value="${order.print.document.deadline}" >
					<label>Deadline</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="" type="text" value="${order.print.document.hardCover ? 'Yes' : 'No'}" disabled/>

					<label>Hard Cover</label>
					<p>
						<label>

							<input class="filled-in" name="hard_cover" type="checkbox" ${order.print.document.hardCover ? 'checked' : ''}/>
							<span> </span>
						</label>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="price" type="text" value="${order.price}" >
					<label>Price</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<textarea name="printing_instructions" class="materialize-textarea"
							  >${order.print.document.printInstructions}</textarea>
					<label>Printing Instructions</label>
				</div>
			</div>
			<div class="row">
				<h2>Client</h2>
			</div>
			<div class="row">

				<div class="input-field col s12 m12">
					<select name="client_id">
						<option value="${order.client.id}"  selected>${order.client.firstName} ${order.client.lastName}</option>
						<c:forEach var="client" items="${clients}">
							<option value="${client.id}">${client.firstName} ${client.lastName}</option>
						</c:forEach>
					</select>
					<label>Client </label>
				</div>
			</div>

			<div class="row">
				<div class="input-field col s12 m12">
					<input name="email" type="email" value="${order.client.email}" disabled>
					<label>Email</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="phone" type="text" value="${order.client.phone}" disabled>
					<label>Phone</label>
				</div>
			</div>
		</div>
		<div class="col s12 m12 l6 xl6">
			<div class="row">
				<h2>Printing</h2>
			</div>

			<div class="row">
				<div class="input-field col s12 m12 l6 xl6">
					<select name="printing_machine_id">
						<option value="${order.print.printingMachine.id}"  selected>${order.print.printingMachine.make} - ${order.print.printingMachine.model}</option>
						<c:forEach var="machine" items="${machines}">
							<option value="${machine.id}">${machine.make} ${machine.model}</option>
						</c:forEach>
					</select>
					<label>Printing Machine</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input type="text" value="${order.print.employee.firstName} ${order.print.employee.lastName}"
						   disabled>
					<label>Employee</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="print_date" type="date" value="${order.print.printDate}" >
					<label>Print Date</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<textarea name="note" class="materialize-textarea" >${order.print.note}</textarea>
					<label>Note</label>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12 m12 l6 xl6">
				<button class="btn" type="submit">update<i class="material-icons right">update</i></button>
			</div>
		</div>
	</form>
</main>
<jsp:include page="../include/footer.jsp"/>
<jsp:include page="../fragment/materializeSelect.jsp"/>
<jsp:include page="../fragment/materializeTextarea.jsp"/>
<jsp:include page="../fragment/materializeUpdateTextFields.jsp"/>
</body>
</html>
