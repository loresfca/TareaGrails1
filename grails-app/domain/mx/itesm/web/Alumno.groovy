package mx.itesm.web

class Alumno {

	String nombre
	String matricula
	String apellido
    String correo
    String direccion
	Carrera carrera
    Campus campus



    static constraints = {
    	matricula unique: true,blank: false
    	nombre nullable: false
    }

    String toString(){
    	nombre +" "+ apellido
    }
}
