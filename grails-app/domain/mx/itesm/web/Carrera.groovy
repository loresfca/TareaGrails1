package mx.itesm.web

class Carrera {

	String nombre 

	static hasMany = [alumnos: Alumno]


    static constraints = {
    	nombre nullable: false, unique: true, blank:false
    }

    
}
