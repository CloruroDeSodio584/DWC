package es.altair.dao;

import java.util.List;

import es.altair.bean.Juego;
import es.altair.bean.Usuario;

public interface JuegoDAO {

	List<Juego> listar(Usuario u);
	List<Juego> listarTodos();
	void InsertarJuego(Juego nuevoJuego);
}
