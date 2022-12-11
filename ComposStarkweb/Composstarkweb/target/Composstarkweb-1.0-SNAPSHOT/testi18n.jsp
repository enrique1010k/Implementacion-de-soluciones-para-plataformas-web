<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ResourceBundle"%>

<%@ page import="java.io.*,java.util.Locale"%>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            ResourceBundle resourceBundle = ResourceBundle.getBundle("i18n.messages", request.getLocale()); 
        %>
        
        <h1><spring:message code="label.TITULO" /></h1>
        <h2> <%= resourceBundle.getString("label.SUBTITULO")%> </h2>
        <!-- 
        
        https://o7planning.org/11227/create-a-multiple-languages-web-application-with-spring-mvc
        https://dotnettutorials.net/lesson/internationalization-in-jsp/
        https://www.youtube.com/watch?v=yPiJ13HDgHA&t=294s&ab_channel=PrototypeProject
        
        -->
    </body>
</html>
