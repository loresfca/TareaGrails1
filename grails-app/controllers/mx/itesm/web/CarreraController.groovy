package mx.itesm.web

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CarreraController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Carrera.list(params), model:[carreraCount: Carrera.count()]
    }

    def show(Carrera carrera) {
        respond carrera
    }

    def create() {
        respond new Carrera(params)
    }

    @Transactional
    def save(Carrera carrera) {
        if (carrera == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (carrera.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond carrera.errors, view:'create'
            return
        }

        carrera.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'carrera.label', default: 'Carrera'), carrera.id])
                redirect carrera
            }
            '*' { respond carrera, [status: CREATED] }
        }
    }

    def edit(Carrera carrera) {
        respond carrera
    }

    @Transactional
    def update(Carrera carrera) {
        if (carrera == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (carrera.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond carrera.errors, view:'edit'
            return
        }

        carrera.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'carrera.label', default: 'Carrera'), carrera.id])
                redirect carrera
            }
            '*'{ respond carrera, [status: OK] }
        }
    }

    @Transactional
    def delete(Carrera carrera) {

        if (carrera == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        carrera.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'carrera.label', default: 'Carrera'), carrera.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrera.label', default: 'Carrera'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
