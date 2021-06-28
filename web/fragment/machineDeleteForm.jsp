<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="machine" value="${requestScope.machine}"/>
<form method="post" action="<c:url value="/user/printing-machines/delete"/>">
	<input name="printing_machine_id" value="${machine.id}" type="hidden">
	<div class="row">
		<div class="input-field col s6">
			<button class="btn red" type="submit">remove<i class="material-icons right">delete</i></button>
		</div>
	</div>
</form>
