package es.altair.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import es.altair.bean.Genero;
import es.altair.bean.Juego;
import es.altair.bean.Usuario;
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

	public boolean validarGenero(Genero nuevoGenero) {
		
		Session sesion = SessionProvider.getSession();
		boolean correcto = true;
		
		
		try {
			sesion.beginTransaction();
						
			if( (Genero) sesion.createQuery("FROM Genero WHERE nombreGenero=:g")
			.setParameter("g", nuevoGenero.getNombreGenero())
			.uniqueResult() !=null)
				correcto = false;
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			
		} finally {
			sesion.close();
		}
		
		return correcto;
		
	}

	public int insertar(Genero nuevoGenero) {
		Session sesion = SessionProvider.getSession();
		
		int filas=0;
		try {
			sesion.beginTransaction();
						
	
			filas = sesion.createSQLQuery("INSERT INTO generos (nombreGenero) values (:n)")
			.setParameter("n", nuevoGenero.getNombreGenero())
			.executeUpdate();
				
			
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			
		} finally {
			sesion.close();
		}
		return filas;
	}

}
