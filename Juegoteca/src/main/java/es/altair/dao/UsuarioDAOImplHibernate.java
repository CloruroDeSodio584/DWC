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

}
