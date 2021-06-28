<%@ page import="org.example.printoffice.database.entity.PrintingMachine" %>
<%@ page import="org.example.printoffice.database.dao.DAOProvider" %>
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
		pageContext.setAttribute("machineList", DAOProvider.getDAO(PrintingMachine.class).findAll());
	%>
	<div class="row">
		<div class="col s12 m12 l6 xl6">
			<h2>Add a printing machine</h2>
			<c:import url="../fragment/machineEditForm.jsp"/>
		</div>
		<div class="col s12 m12 l6 xl6">
			<ul class="collapsible">
				<c:forEach var="machine" items="${machineList}" varStatus="i">
					<c:set var="machine" value="${machine}" scope="request"/>
					<li>
						<div class="collapsible-header theme-foreground white-text">
								${i.index + 1}. <i class="material-icons">print</i>Machine ID: ${machine.id}
						</div>
						<div class="collapsible-body">
							<c:import url="../fragment/machineEditForm.jsp"/>
							<c:import url="../fragment/machineDeleteForm.jsp"/>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</main>
<jsp:include page="../include/footer.jsp"/>
</body>
<jsp:include page="../fragment/materializeUpdateTextFields.jsp"/>
<jsp:include page="../fragment/materializeCollapsible.jsp"/>
</html>
