package es.altair.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import es.altair.bean.Genero;
import es.altair.dao.GeneroDAO;
import es.altair.dao.GeneroDAOImplHibernate;

/**
 * Servlet implementation class NuevoGenero
 */
public class NuevoGenero extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NuevoGenero() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String genero = request.getParameter("genero");

		Genero nuevoGenero = new Genero(genero);
		GeneroDAO gDAO = new GeneroDAOImplHibernate();

		int filas;
		/*
		 * String msg =""; if(uDAO.validarEmail(usu)) { filas =uDAO.insertar(usu); if
		 * (filas ==1) msg ="Usuario Registrado"; else msg
		 * ="Error al registrar Usuario"; } else { msg ="Email ya registrado";
		 * //response.sendRedirect("registrar.jsp?mensaje="+msg); }
		 */
		String msg = "";
		if (gDAO.validarGenero(nuevoGenero)) {
			filas = gDAO.insertar(nuevoGenero);

			if (filas == 1)
				msg = "Genero Registrado";
			else
				msg = "Error al registrar Género";
		} else {
			msg = "Genero ya registrado";
		}
		response.sendRedirect("jsp/principalAdmin.jsp?mensaje="+msg);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
