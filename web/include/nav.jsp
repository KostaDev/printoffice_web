<%@ page import="org.example.printoffice.security.AuthenticationContextHolder" %>
<%@ page import="org.example.printoffice.security.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%
    User user = AuthenticationContextHolder.getUser();
    pageContext.setAttribute("user", user);
    pageContext.setAttribute("loggedIn", user != null);
%>
<nav role="navigation" class="theme-background-light">
    <div class="nav-wrapper">
        <a href="<c:url value="/"/>" class="brand-logo center">
            Print Office
        </a>
        <a data-target="nav-mobile" class="sidenav-trigger right pointer">
            <i class="material-icons">menu</i>
        </a>
        <ul class="nav-list hide-on-med-and-down left">
            <c:if test="${loggedIn}">
                <li><i class="tiny material-icons left">person</i>${user.firstName} ${user.lastName}</li>
            </c:if>
        </ul>
        <ul class="nav-list hide-on-med-and-down right">
            <c:if test="${!loggedIn}">
                <li><a href="<c:url value="/login"/>">Login</a></li>
            </c:if>
            <c:if test="${loggedIn}">
                <li><a href="<c:url value="/user/orders.jsp"/>">Orders</a></li>
                <li><a href="<c:url value="/user/printing-machines.jsp"/>">Machines</a></li>
                <li><a href="<c:url value="/logout"/>">Logout</a></li>
            </c:if>
        </ul>
    </div>
    <ul id="nav-mobile" class="sidenav">
        <c:if test="${!loggedIn}">
            <li><a href="<c:url value="/login"/>">Login</a></li>
        </c:if>
        <c:if test="${loggedIn}">
            <li><a href="<c:url value="/user/dashboard.jsp"/>">Dashboard</a></li>
            <li><a href="<c:url value="/logout"/>">Logout</a></li>
        </c:if>
    </ul>
</nav>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", () => {
        M.Sidenav.init(document.querySelector(".sidenav"), {edge: "right"});
    });
</script>