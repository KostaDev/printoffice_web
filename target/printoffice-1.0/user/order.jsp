<%@ page import="org.example.printoffice.database.entity.Order" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	pageContext.setAttribute("order", (Order) request.getAttribute("order"));
%>
<!DOCTYPE html>
<html lang="<%=session.getAttribute("lang")%>">
<head>
	<jsp:include page="../include/head.jsp"/>
	<title>Order ${order.id}</title>
</head>
<body>
<jsp:include page="../include/nav.jsp"/>
<main class="container">
	<br/>
	<div class="row">
		<div class="col s12">
			<a class="btn text-white grey" href="<c:url value="/user/orders"/>"><i class="material-icons left">arrow_left</i>orders</a>
		</div>
	</div>
	<form class="row" method="post" action="<c:url value="/user/orders"/>">
		<input name="order_id" value="" type="hidden">
		<input name="print_id" value="" type="hidden">
		<div class="col s12 m12 l6 xl6">
			<div class="row">
				<h2>Document</h2>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="deadline" type="date" value="${order.print.document.deadline}" disabled>
					<label>Deadline</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="hard_cover" type="text" value="${order.print.document.hardCover ? 'Yes' : 'No'}" disabled/>
					<label>Hard Cover</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="price" type="text" value="${order.price}" disabled>
					<label>Price</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<textarea name="printing_instructions" class="materialize-textarea"
							  disabled>${order.print.document.printInstructions}</textarea>
					<label>Printing Instructions</label>
				</div>
			</div>
			<div class="row">
				<h2>Client</h2>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<input name="client" type="text" value="${order.client.firstName} ${order.client.lastName}"
						   disabled>
					<label>First Name</label>
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
				<div class="input-field col s12 m12">
					<input name="machine" type="text"
						   value="${order.print.printingMachine.make} - ${order.print.printingMachine.model}" disabled>
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
					<input name="print_date" type="date" value="${order.print.printDate}" disabled>
					<label>Print Date</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m12">
					<textarea name="note" class="materialize-textarea" disabled>${order.print.note}</textarea>
					<label>Note</label>
				</div>
			</div>
		</div>
	</form>
</main>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
