

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mrysi.beans.Escuela"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <%getServletContext().getRequestDispatcher("/ServletEscuelas").include(request,response);%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <th>Clave</th>
                <th>Escuela</th>
                <th>Domicilio</th>
                <th>Turno</th>
                <th></th>
            </tr>
            <c:forEach items="${requestScope.ListaEscuelas}" var="e">
                <tr>
                    <td><c:out value="${e.claveEscuela}"/></td>
                    <td><c:out value="${e.nombreEscuela}"/></td>
                    <td><c:out value="${e.domicilio}"/></td>
                    <td><c:out value="${e.turno}"/></td>
                    <td><a href="#">Editar</a> | <a href="#">Eliminar</a></td>
                    
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
