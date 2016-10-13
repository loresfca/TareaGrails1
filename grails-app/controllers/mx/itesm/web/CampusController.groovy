package mx.itesm.web

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CampusController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Campus.list(params), model:[campusCount: Campus.count()]
    }

    def show(Campus campus) {
        respond campus
    }

    def create() {
        respond new Campus(params)
    }

    @Transactional
    def save(Campus campus) {
        if (campus == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (campus.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond campus.errors, view:'create'
            return
        }

        campus.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'campus.label', default: 'Campus'), campus.id])
                redirect campus
            }
            '*' { respond campus, [status: CREATED] }
        }
    }

    def edit(Campus campus) {
        respond campus
    }

    @Transactional
    def update(Campus campus) {
        if (campus == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (campus.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond campus.errors, view:'edit'
            return
        }

        campus.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'campus.label', default: 'Campus'), campus.id])
                redirect campus
            }
            '*'{ respond campus, [status: OK] }
        }
    }

    @Transactional
    def delete(Campus campus) {

        if (campus == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        campus.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'campus.label', default: 'Campus'), campus.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'campus.label', default: 'Campus'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
