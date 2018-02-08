package es.altair.dao;

import es.altair.bean.Usuario;

public interface UsuarioDAO {

	Usuario comprobarUsuario(String correo, String password);

}
