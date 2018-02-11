package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
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
 * Servlet implementation class AnadirJuego
 */
public class AnadirJuego extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnadirJuego() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String titulo = request.getParameter("titulo");
		String numJugadores = request.getParameter("numJugadores");
		String descripcion =  request.getParameter("descripcion");
		int pegi = Integer.parseInt(request.getParameter("pegi"));
		
		int idgenero = Integer.parseInt(request.getParameter("genero"));
		
		GeneroDAO gDAO = new GeneroDAOImplHibernate();	
		Genero nuevoGenero = gDAO.ObtenerGeneroPorId(idgenero);
		
		Juego nuevoJuego = new Juego(titulo, numJugadores, descripcion, pegi, nuevoGenero);
		
		JuegoDAO jDAO = new JuegoDAOImplHibernate();
		
		System.out.println("idgenero: " + idgenero);
		
		jDAO.InsertarJuego(nuevoJuego);
		
		response.sendRedirect("jsp/principalAdmin.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
