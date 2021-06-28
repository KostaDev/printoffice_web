<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="machine" value="${requestScope.machine}" />
<form method="post" action="<c:url value="/user/printing-machines"/>">
	<input name="printing_machine_id" value="${machine.id}" type="hidden">
	<div class="row">
		<div class="input-field col s12 m12">
			<input name="make" type="text" value="${machine.make}">
			<label>Make</label>
		</div>
	</div>
	<div class="row">
		<div class="input-field col s12 m12">
			<input name="model" type="text" value="${machine.model}">
			<label>Model</label>
		</div>
	</div>
	<div class="row">
		<div class="input-field col s12 m12">
			<input name="manufacturing_date" type="date" value="${machine.manufacturingDate}">
			<label>Manufacturing Date</label>
		</div>
	</div>
	<div class="row">
		<div class="input-field col s12 m12">
			<textarea name="description" type="text" class="materialize-textarea">${machine.description} </textarea>
			<label>Description</label>
		</div>
	</div>
	<div class="row">
		<div class="input-field col s12 m12">
			<button class="btn" type="submit">${machine != null ? 'save' : 'add'}<i class="material-icons right">${machine != null? 'save' : 'add'}</i></button>
		</div>
	</div>
</form>
<jsp:include page="../fragment/materializeTextarea.jsp"/>
