<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html>
    <head>
        <title>Login Form</title>
    </head>
    <body>

        <c:if test="${param.error != null}">
            <b>Sorry you entered wrong credentials. Try again!!!</b>
        </c:if>
        <c:if test="${param.logout != null}">
            <b>You have successfully logged out!!!!</b>
        </c:if>

        <form:form method="POST">
            <p>
                User name: <input type="text" name="username"/>
            </p>
            <p>
                Password: <input type="password" name="password"/>
            </p>
            <input type="submit" value="Login"/>
        </form:form>
    </body>
</html>

