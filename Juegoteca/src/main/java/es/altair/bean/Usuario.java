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
@Table(name="usuarios")
public class Usuario implements Serializable {
		
		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private int idUsuario;
		private String nombre;
		private String apellidos;
		private int edad;
		private String correo;
		private String password;
		private int tipo;
		
		@OneToMany(mappedBy="usuarios", cascade=CascadeType.ALL)
		public Set<Juegoteca> juegotecas = new HashSet<Juegoteca>();
		
		public Usuario() {
			
		}	
	
		
		public Usuario(String nombre, String apellidos, int edad, String correo, String password, int tipo) {
			super();
			this.nombre = nombre;
			this.apellidos = apellidos;
			this.edad = edad;
			this.correo = correo;
			this.password = password;
			this.tipo = tipo;
		}


		

		public int getTipo() {
			return tipo;
		}


		public void setTipo(int tipo) {
			this.tipo = tipo;
		}


		public int getIdUsuario() {
			return idUsuario;
		}

		public void setIdUsuario(int idUsuario) {
			this.idUsuario = idUsuario;
		}

		public String getNombre() {
			return nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}

		public String getApellidos() {
			return apellidos;
		}

		public void setApellidos(String apellidos) {
			this.apellidos = apellidos;
		}

		public int getEdad() {
			return edad;
		}

		public void setEdad(int edad) {
			this.edad = edad;
		}

		public String getCorreo() {
			return correo;
		}

		public void setCorreo(String correo) {
			this.correo = correo;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public Set<Juegoteca> getJuegoteca() {
			return juegotecas;
		}

		public void setJuegoteca(Set<Juegoteca> juegoteca) {
			this.juegotecas = juegoteca;
		}

		@Override
		public String toString() {
			return "Usuario [idUsuario=" + idUsuario + ", nombre=" + nombre + ", apellidos=" + apellidos + ", edad="
					+ edad + ", correo=" + correo + ", password=" + password + "]";
		}
		
		
		
}
