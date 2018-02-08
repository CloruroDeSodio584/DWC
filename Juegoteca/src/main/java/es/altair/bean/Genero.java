package es.altair.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="generos")
public class Genero implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idGenero;
	private String nombreGenero;
	
	@OneToMany(mappedBy="generos", cascade=CascadeType.ALL)
	private Set<Juego> juegos = new HashSet<Juego>();
	
	public Genero() {
		
	}
	
	
	public Genero(String nombreGenero) {
		super();
		this.nombreGenero = nombreGenero;
	}
	
	
	
	public Set<Juego> getJuegos() {
		return juegos;
	}


	public void setJuegos(Set<Juego> juegos) {
		this.juegos = juegos;
	}


	public int getIdGenero() {
		return idGenero;
	}
	public void setIdGenero(int idGenero) {
		this.idGenero = idGenero;
	}
	public String getNombreGenero() {
		return nombreGenero;
	}
	public void setNombreGenero(String nombreGenero) {
		this.nombreGenero = nombreGenero;
	}


	@Override
	public String toString() {
		return "Genero [idGenero=" + idGenero + ", nombreGenero=" + nombreGenero + "]";
	}
	
	
}
