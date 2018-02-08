package es.altair.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="juegos")
public class Juego implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idJuego;
	private String titulo;
	private String numJugadores;
	private String descripcion;
	private int pegi;
	
	@ManyToOne(cascade=CascadeType.MERGE)
	@JoinColumn(name="idGenero")
	private Genero generos;
	
	@OneToMany(mappedBy="juegos", cascade=CascadeType.ALL)
	public Set<Juegoteca> juegotecas = new HashSet<Juegoteca>();
	
	
	public Juego() {
		
	}
	
	

	public Juego(String titulo, String numJugadores, String descripcion, int pegi, Genero generos) {
		super();
		this.titulo = titulo;
		this.numJugadores = numJugadores;
		this.descripcion = descripcion;
		this.pegi = pegi;
		this.generos = generos;
	}



	public int getIdJuego() {
		return idJuego;
	}
	
	public void setIdJuego(int idJuego) {
		this.idJuego = idJuego;
	}
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getNumJugadores() {
		return numJugadores;
	}
	
	public void setNumJugadores(String numJugadores) {
		this.numJugadores = numJugadores;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public int getPegi() {
		return pegi;
	}
	
	
	public Genero getGeneros() {
		return generos;
	}


	public void setGeneros(Genero generos) {
		this.generos = generos;
	}


	public void setPegi(int pegi) {
		this.pegi = pegi;
	}
	
	
}
