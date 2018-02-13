package es.altair.dao;

import java.util.List;

import es.altair.bean.Usuario;

public interface UsuarioDAO {

	Usuario comprobarUsuario(String correo, String password);

	int insertar(Usuario usu);

	boolean validarEmail(Usuario usu);
	
	List<Usuario> listarUsuarios();

	void borrarUsuario(int idUsuario);
	
	Usuario obtenerUsuarioPorId(int idUsuario);

	void ActualizarUsuario(Usuario u);

}
