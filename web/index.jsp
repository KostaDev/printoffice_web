<%@ page import="org.example.printoffice.security.AuthenticationContextHolder" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="include/head.jsp"/>
    <title>Login</title>
</head>
<%
    if (AuthenticationContextHolder.getUser() != null) {
        response.sendRedirect(request.getContextPath() + "/user/dashboard.jsp");
    }
%>
<body>
<jsp:include page="./include/nav.jsp"/>
<main class="container">
    <div class="row">
        <form class="col s12" method="post" action="<c:url value="/login"/>">
            <h2 class="center">Employee Login</h2>
            <div class="row">
                <div class="col s12 m12 l3"></div>
                <div class="col s12 m12 l6">
                    <div class="row">
                        <div class="input-field col s12 m12 l12">
                            <i class="material-icons theme-white-text prefix">account_circle</i>
                            <input id="username" name="username" type="text" autofocus="autofocus">
                            <label for="username">Username</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12 m12 l12">
                            <i class="material-icons theme-white-text prefix">lock</i>
                            <input id="password" name="password" type="password">
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <div class="row">
                        <jsp:include page="fragment/errorList.jsp"/>
                    </div>
                    <div class="row">
                        <div class="col s12 center">
                            <button class="btn theme-foreground" type="submit" name="action">
                                Login
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <br><br>
</main>
<jsp:include page="include/footer.jsp"/>
</body>
<jsp:include page="./fragment/materializeUpdateTextFields.jsp"/>
</html>
