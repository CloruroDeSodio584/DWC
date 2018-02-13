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
 * Servlet implementation class EditarUsuario
 */
public class EditarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarUsuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		int edad = Integer.parseInt(request.getParameter("edad"));
		String correo = request.getParameter("correo");
		
		UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
		Usuario usu = uDAO.obtenerUsuarioPorId(idUsuario);
		Usuario u = new Usuario(nombre, apellidos, edad, correo, usu.getPassword(), 1);
		
		int filas;
		String msg ="";
		
		if(usu.getCorreo() == correo) {
		
		if(uDAO.validarEmail(u)) {
			
			usu.setNombre(nombre);
			usu.setApellidos(apellidos);
			usu.setEdad(edad);
			usu.setCorreo(correo);
		
			uDAO.ActualizarUsuario(usu);
	    	
			if(usu != u)
				 response.sendRedirect("jsp/juegotecaAdmin.jsp?mensaje=El usuario ha sido actualizado");
			else response.sendRedirect("jsp/juegotecaAdmin.jsp?mensaje=El usuario no ha sido actualizado");
			
		} else
			msg ="Email ya registrado";
	
		} else {
			
			usu.setNombre(nombre);
			usu.setApellidos(apellidos);
			usu.setEdad(edad);
			usu.setCorreo(correo);
		
			uDAO.ActualizarUsuario(usu);
	    	
			if(usu != u)
				 response.sendRedirect("jsp/juegotecaAdmin.jsp?mensaje=El usuario ha sido actualizado");
			else response.sendRedirect("jsp/juegotecaAdmin.jsp?mensaje=El usuario no ha sido actualizado");
		}
			
			
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
