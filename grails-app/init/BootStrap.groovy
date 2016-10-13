import mx.itesm.web.*

class BootStrap {

    def init = { servletContext ->
    	new Carrera(nombre:'ITC').save()
    	new Carrera(nombre:'IEC').save()
    	new Carrera(nombre:'LAE').save()
    	new Alumno(nombre: 'Juan',matricula:'955014',apellido: 'Velez' ).save()
    	new Alumno(nombre: 'Juan1',matricula:'dsafdfa',apellide:'Hola' ).save()
        new Campus(nombre:'CCM').save()
    }
    def destroy = {
    }
}
