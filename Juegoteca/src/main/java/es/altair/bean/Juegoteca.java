package es.altair.bean;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="juegoteca")
public class Juegoteca implements Serializable {
			
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int idJuegoteca;
		
		@ManyToOne(cascade=CascadeType.MERGE)
		@JoinColumn(name="idJuego")
		private Juego juegos;
		
		@ManyToOne(cascade=CascadeType.MERGE)
		@JoinColumn(name="idUsuario")
		private Usuario usuarios;
		
		private String comentario;
		
		public Juegoteca() {
			
		}
		
		

		public Juegoteca(Juego juegos, Usuario usuarios, String comentario) {
			super();
			this.juegos = juegos;
			this.usuarios = usuarios;
			this.comentario = comentario;
		}

		public int getIdJuegoteca() {
			return idJuegoteca;
		}

		public void setIdJuegoteca(int idJuegoteca) {
			this.idJuegoteca = idJuegoteca;
		}

		public Juego getJuegos() {
			return juegos;
		}

		public void setJuegos(Juego juegos) {
			this.juegos = juegos;
		}

		public Usuario getUsuarios() {
			return usuarios;
		}

		public void setUsuarios(Usuario usuarios) {
			this.usuarios = usuarios;
		}

		public String getComentario() {
			return comentario;
		}

		public void setComentario(String comentario) {
			this.comentario = comentario;
		}



		@Override
		public String toString() {
			return "Juegoteca [idJuegoteca=" + idJuegoteca + ", juegos=" + juegos + ", usuarios=" + usuarios
					+ ", comentario=" + comentario + "]";
		}
		
		
		
		
}
