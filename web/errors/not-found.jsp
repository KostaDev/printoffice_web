<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="../include/head.jsp"/>
    <title>Home</title>
</head>
<body>
<jsp:include page="../include/nav.jsp"/>
<div class="container text-white">
    <h1>Not Found</h1>
</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
