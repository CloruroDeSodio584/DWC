package es.altair.dao;

import java.util.List;

import es.altair.bean.Genero;

public interface GeneroDAO {
	
	public List<Genero>listarGeneros();

	public Genero ObtenerGeneroPorId(int idgenero);

	public boolean validarGenero(Genero nuevoGenero);

	public int insertar(Genero nuevoGenero);
	
	public int ObtenerIdGeneroPorIdJuego(int idJuego);
}
