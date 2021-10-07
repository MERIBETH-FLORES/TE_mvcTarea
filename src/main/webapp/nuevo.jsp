<%@page import="com.emergentes.modelo.Tarea"%>
<%Tarea item = (Tarea)request.getAttribute("tarea"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">NUEVO REGISTRO DE TAREAS</h1>
        <form action="MainController" method="post">
        <table>
        <input type="hidden" name="id" value="<%=item.getId()%>">
        <tr>
        <td>TAREA: </td>
        <td><input type="text" name="tarea" value="" required></td>
        </tr>
        <tr>
        <td>PRIORIDAD: </td>
        <td><select name="prioridad" required>
        <option value="Alta">Alta</option>
        <option value="Media">Media</option>
        <option value="Baja">Baja</option>
        </select>
        </td>
        </tr>
        <tr>
        <td>COMPLETADO: </td>
        <td><input type="radio" name=completado value="X" required>Concluido</td>
        <td><input type="radio" name=completado value="" required>Pendiente</td>
        </tr>
        <tr>
        <td><a href="index.jsp">VOLVER</a></td>
        <td><input type="submit" value="ENVIAR"></td>
        </tr>
        </table>
        </form>
    </body>
</html>
