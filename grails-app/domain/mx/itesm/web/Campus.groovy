package mx.itesm.web

class Campus {

	String nombre 

	static hasMany = [alumnos: Alumno]


    static constraints = {
    	nombre nullable: false, unique: false, blank:false
    }
}
