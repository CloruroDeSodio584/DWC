package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Usuario;
import es.altair.dao.UsuarioDAO;
import es.altair.dao.UsuarioDAOImplHibernate;

/**
 * Servlet implementation class RegistrarUsuario
 */
public class RegistrarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		int edad = Integer.parseInt(request.getParameter("edad"));
		String correo = request.getParameter("correo");  
		String contrase�a = request.getParameter("password");  
	
		System.out.println(nombre +" - " + apellidos + " - " + edad + " - " + correo + " - " + contrase�a);
		
		Usuario usu = new Usuario(nombre, apellidos, edad, correo, contrase�a, 1);
		UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
		
		int filas;
		String msg ="";
		if(uDAO.validarEmail(usu)) {
			filas =uDAO.insertar(usu);
	    if (filas ==1)
			msg ="Usuario Registrado";
		else
			msg ="Error al registrar Usuario";
		} else {
	    	msg ="Email ya registrado";
	    	//response.sendRedirect("registrar.jsp?mensaje="+msg);
		}
	
		
		
		response.sendRedirect("index.jsp?mensaje="+msg);
		
	}

}
