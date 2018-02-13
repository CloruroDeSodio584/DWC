package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Genero;
import es.altair.bean.Juego;
import es.altair.dao.GeneroDAO;
import es.altair.dao.GeneroDAOImplHibernate;
import es.altair.dao.JuegoDAO;
import es.altair.dao.JuegoDAOImplHibernate;

/**
 * Servlet implementation class EditarJuego
 */
@MultipartConfig
public class EditarJuego extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

    public EditarJuego() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int idJuego = Integer.parseInt(request.getParameter("idJuego"));
		 String titulo = request.getParameter("titulo");
		 String numJugadores = request.getParameter("numJugadores");
		 String descripcion = request.getParameter("descripcion");
		 int pegi =  Integer.parseInt(request.getParameter("pegi"));
		 
		 int idgenero = Integer.parseInt(request.getParameter("genero"));
		 
			GeneroDAO gDAO = new GeneroDAOImplHibernate();	
			Genero nuevoGenero = gDAO.ObtenerGeneroPorId(idgenero);
			
			JuegoDAO jDAO = new JuegoDAOImplHibernate();
			
			Juego j =jDAO.obtenerJuegoPorId(idJuego);
			
			j.setTitulo(titulo);
			j.setNumJugadores(numJugadores);
			j.setDescripcion(descripcion);
			j.setPegi(pegi);
			j.setGeneros(nuevoGenero);
			
			jDAO.actualizarJuego(j);
			
			response.sendRedirect("jsp/principalAdmin.jsp");
	}

}
