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

	public void borrarJuego(int idJuego) {

		Session sesion = SessionProvider.getSession();

		
		try {
			sesion.beginTransaction();

			 sesion.createQuery("DELETE FROM Juego WHERE idJuego=:i")
			 .setParameter("i", idJuego )
			 .executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {

		} finally {
			sesion.close();
		}
		
	}

	public Juego obtenerJuegoPorId(int idJuego) {
		Juego j = null;
		
		Session sesion = SessionProvider.getSession();
		
		
		try {
			sesion.beginTransaction();

			 j = sesion.get(Juego.class, idJuego);

			sesion.getTransaction().commit();
		} catch (Exception e) {

		} finally {
			sesion.close();
		}
		return j;	
		
	}

	public void actualizarJuego(int idJuego, String titulo, String numJugadores, String descripcion, int pegi, int idgenero) {
		Session sesion = SessionProvider.getSession();
		
		
		try {
			sesion.beginTransaction();		
			 sesion.createSQLQuery("UPDATE juegos SET titulo = ':t', numJugadores = ':n', descripcion = ':d', pegi = ':p', idGenero = ':g' WHERE idJuego=:i ")
			 .setParameter("t", titulo)
			 .setParameter("n", numJugadores)
			 .setParameter("d", descripcion)
			 .setParameter("p", pegi)
			 .setParameter("g", idgenero)
			 .setParameter("i", idJuego)
			 .executeUpdate();

			sesion.getTransaction().commit();
		} catch (Exception e) {

		} finally {
			sesion.close();
		}
		
		
		
		
	}
	

}
