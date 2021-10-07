package com.emergentes.controlador;
import com.emergentes.modelo.Tarea;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {   
        HttpSession sesion = request.getSession();   
        Tarea tareaone = new Tarea();
        if (sesion.getAttribute("listatareas")==null) {
            ArrayList<Tarea> listaauxiliar = new ArrayList<Tarea>();
            sesion.setAttribute("listatareas", listaauxiliar);
        }
        ArrayList<Tarea> lista = (ArrayList<Tarea>)sesion.getAttribute("listatareas");

        String opciones=request.getParameter("opcion");

        String opcion =(opciones != null)? opciones:"view";
        int id,position;
        switch (opcion){
            case "nuevo":
            request.setAttribute("tarea", tareaone);

            request.getRequestDispatcher("nuevo.jsp").forward(request, response);
            break;
            case "editar":

            id=Integer.parseInt(request.getParameter("id"));
            position=BuscarIndice(request,id);

            tareaone=lista.get(position);

            request.setAttribute("tarea", tareaone);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
            break;
            case "eliminar":

            id=Integer.parseInt(request.getParameter("id"));
            position=BuscarIndice(request,id);

            lista.remove(position);
            sesion.setAttribute("listatareas", lista);
            response.sendRedirect("index.jsp");
            break;
            default:
            response.sendRedirect("index.jsp");
            break;
           }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
        HttpSession sesion = request.getSession();
        
        ArrayList<Tarea> lista = (ArrayList<Tarea>)sesion.getAttribute("listatareas");
        
        Tarea tareaone = new Tarea();
        
        tareaone.setId(Integer.parseInt(request.getParameter("id")));
        tareaone.setTarea(request.getParameter("tarea"));
        tareaone.setPrioridad(request.getParameter("prioridad"));
        tareaone.setCompletado(request.getParameter("completado"));
        
        int idauxiliar=tareaone.getId();
        if (idauxiliar==0) {
        int ultimoid=BuscarUltimo(request);
        tareaone.setId(ultimoid);
        lista.add(tareaone);
        }else{
        lista.set(BuscarIndice(request,idauxiliar), tareaone);
        }
      
        sesion.setAttribute("listatareas", lista);
       
        response.sendRedirect("index.jsp");
    }

    private int BuscarIndice(HttpServletRequest request,int id){
        HttpSession ses = request.getSession();
        int indice=0;
        ArrayList<Tarea> lista = (ArrayList<Tarea>)ses.getAttribute("listatareas");
        if (lista.size()>0) {
            for (int i = 0; i < lista.size(); i++) {
                if (lista.get(i).getId()==id) {
                   indice=i;
                }
            }
        }
        return indice;
    }
    
    private int BuscarUltimo(HttpServletRequest request){
        HttpSession ses = request.getSession();
        ArrayList<Tarea> lista = (ArrayList<Tarea>)ses.getAttribute("listatareas");
        int idaux=0;
        for (Tarea i:lista) {
            idaux=i.getId();
        }
        return idaux+1;
    }
}