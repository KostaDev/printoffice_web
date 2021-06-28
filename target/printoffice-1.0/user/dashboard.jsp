<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="<%=session.getAttribute("lang")%>">
<head>
    <jsp:include page="../include/head.jsp"/>
    <title>Dashboard</title>
</head>
<body>
<jsp:include page="../include/nav.jsp"/>
<main class="container">

</main>
<script type="text/javascript">
    window.location.replace("${pageContext.servletContext.contextPath}/user/orders.jsp");
</script>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>
