<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="successes" value="${requestScope.successes}"/>
<ul class="collection">
    <c:forEach var="success" items="${successes}">
        <li class="collection-item green accent-2 text-white"><c:out value="${success}"/></li>
    </c:forEach>

</ul>
