package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Genero;
import es.altair.bean.Juego;
import es.altair.util.SessionProvider;

public class GeneroDAOImplHibernate implements GeneroDAO {

	public List<Genero> listarGeneros() {
		List<Genero> generos = new ArrayList<Genero>();

		Session sesion = SessionProvider.getSession();

		try {
			sesion.beginTransaction();

			generos = sesion.createSQLQuery("SELECT * FROM generos").addEntity(Genero.class).list();

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		return generos;
	}

	public Genero ObtenerGeneroPorId(int idgenero) {
		Session sesion = SessionProvider.getSession();
		
		Genero gen = null;
		try {
			sesion.beginTransaction();

			gen = sesion.get(Genero.class, idgenero);

			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
		return gen;
	}

}
