<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p>
            User:<security:authentication property="principal.username"/>
            <br/>
            Role(s):<security:authentication property="principal.authorities"/>
        </p>
        <hr/>
        <security:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator</a>
        </security:authorize >
        
        <security:authorize access="hasRole('TEACHER')">
            <a href="${pageContext.request.contextPath}/teacher">Teacher</a>
        </security:authorize >
        <hr/>
        <form:form method="POST" action="${pageContext.request.contextPath}/logout">
            <input type="submit" value="Logout"/>
        </form:form>
    </body>
</html>