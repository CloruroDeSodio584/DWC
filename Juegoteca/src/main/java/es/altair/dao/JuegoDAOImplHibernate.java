package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Genero;
import es.altair.bean.Juego;
import es.altair.bean.Usuario;
import es.altair.util.SessionProvider;

public class JuegoDAOImplHibernate implements JuegoDAO {

	public List<Juego> listar(Usuario u) {
		List<Juego> juegos = new ArrayList<Juego>();
		Session sesion = SessionProvider.getSession();

		try {
			sesion.beginTransaction();

			juegos = sesion.createSQLQuery(
					"SELECT juegos.titulo, juegos.numJugadores, juegos.descripcion, juegos.pegi FROM juegoteca JOIN juegos WHERE idUsuario=:i")
					.addEntity(Juego.class).setParameter("i", u.getIdUsuario()).list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return null;
	}

	public List<Juego> listarTodos() {
		List<Juego> juegos = new ArrayList<Juego>();
		Session sesion = SessionProvider.getSession();

		try {
			sesion.beginTransaction();

			juegos = sesion.createSQLQuery("SELECT * FROM juegos").addEntity(Juego.class).list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return juegos;
	}

	public void InsertarJuego(Juego nuevoJuego) {

		Session sesion = SessionProvider.getSession();

		
		try {
			sesion.beginTransaction();

			 sesion.save(nuevoJuego);

			sesion.getTransaction().commit();
		} catch (Exception e) {

		} finally {
			sesion.close();
		}

	

	}

}
