<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Tarea"%>
<%ArrayList<Tarea> lista = (ArrayList<Tarea>)session.getAttribute("listatareas"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    </head>
    <body>
        <FONT COLOR="red"><h1>LISTA DE TAREAS</h1></FONT>
        <a href="MainController?opcion=nuevo">NUEVO</a>
        <table border="2" >
            <tr>
                <th>ID</th>
                <th>TAREA</th>
                <th>PRIORIDAD</th>
                <th>COMPLETADO</th>
                <th></th>
                <th></th>
            </tr>
            <%if (lista!=null) {
            for (Tarea i:lista) {
            %>
            <tr>
                <td><%=i.getId()%></td>
                <td><%=i.getTarea()%></td>
                <td><%=i.getPrioridad()%></td>
                <td><%=i.getCompletado()%></td>
                <td><a href="MainController?opcion=editar&id=<%=i.getId()%>">Editar</a></td>
                <td><a href="MainController?opcion=eliminar&id=<%=i.getId()%>" onclick="return confirm('ESTA SEGURO QUE DESEA ELIMINAR ESTE REGISTRO?');">Eliminar</a></td>
            </tr>
            <% 
                }
            }
            %>
        </table>
    </body>
</html>