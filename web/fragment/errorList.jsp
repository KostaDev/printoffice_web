<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="errors" value="${requestScope.errors}"/>
<ul class="collection">
    <c:forEach items="${errors}" var="error">
        <li class="collection-item red accent-2 text-white"><c:out value="${error}"/></li>
    </c:forEach>
</ul>
