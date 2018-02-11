package es.altair.dao;

import org.hibernate.Session;

import es.altair.bean.Usuario;
import es.altair.util.SessionProvider;


public class UsuarioDAOImplHibernate implements UsuarioDAO {
	String pass = "altair123$%";
	public Usuario comprobarUsuario(String correo, String password) {
		Usuario usu = null;
		
		Session sesion = SessionProvider.getSession();
		
		try {
			sesion.beginTransaction();
			
			usu = (Usuario) sesion.createQuery("SELECT u FROM Usuario u WHERE correo=:c AND password=AES_ENCRYPT(:p, :passphrase)")
					.setParameter("c", correo)
					.setParameter("p", password)
					.setParameter("passphrase", pass)
					.uniqueResult();
					
			
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			sesion.close();
		}
		
	
		
		return usu;
	}
	public int insertar(Usuario usu) {
		Session sesion = SessionProvider.getSession();
		
		int filas=0;
		try {
			sesion.beginTransaction();
						
	
			filas = sesion.createSQLQuery("INSERT INTO usuarios (nombre, apellidos, edad, correo, password, tipo) values (:n, :a, :e, :c, AES_ENCRYPT(:p, :passphrase), :t)")
			.setParameter("n", usu.getNombre())
			.setParameter("a", usu.getApellidos())
			.setParameter("e", usu.getEdad())
			.setParameter("c", usu.getCorreo())
			.setParameter("p", usu.getPassword())
			.setParameter("passphrase", pass)
			.setParameter("t", usu.getTipo())
			.executeUpdate();
				
			
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			
		} finally {
			sesion.close();
		}
		
		return filas;
		
	}
	public boolean validarEmail(Usuario usu) {
		Session sesion = SessionProvider.getSession();
		boolean correcto = true;
		
		
		try {
			sesion.beginTransaction();
						
			if( (Usuario) sesion.createQuery("FROM Usuario WHERE correo=:c")
			.setParameter("c", usu.getCorreo())
			.uniqueResult() !=null)
				correcto = false;
			
			sesion.getTransaction().commit();
		} catch (Exception e) {
			
		} finally {
			sesion.close();
		}
		
		return correcto;

		
		
		
	}

}
