<%@page import="com.emergentes.modelo.Tarea"%>
<% 
    Tarea item = (Tarea)request.getAttribute("miTarea");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>NUEVA TAREA</h1>
        <form action="MainController" method="POST">
            <input type="hidden" name="id" values="<%=item.getId() %>"/>
            <table>
                <tr>
                    <td>TAREA</td>
                    <td><input type="text" name="nombres" values="<%=item.getTarea()%>"/> </td>
                </tr>
                <tr>
                    <td><label>PRIORIDAD</label></td>
                    <td>
                        <select name="prioridad" values="<%=item.getPrioridad()%>">
                        <option> </option>
                        <option>ALTA</option>
                        <option>MEDIA</option>
                        <option>BAJA</option>
                        </select>
                    </td>
                </tr>  
                <tr>
                    <td>MEDIO:</td>
                    <td><input type="radio" name="medio" value="fisico" required>Fisico<br>
                    <input type="radio" name="medio" value="magnetico" required>Magnetico<br></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" values="Enviar"/></td>
                </tr>
                
            </table> 
        </form>
    </body>
</html>
