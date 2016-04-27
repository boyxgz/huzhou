package com.surelution.huzhou

import org.springframework.dao.DataIntegrityViolationException

class Prize2016EarlySummberController {

//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [prize2016EarlySummberInstanceList: Prize2016EarlySummber.list(params), prize2016EarlySummberInstanceTotal: Prize2016EarlySummber.count()]
    }

    def create() {
        [prize2016EarlySummberInstance: new Prize2016EarlySummber(params)]
    }

    def save() {
        def prize2016EarlySummberInstance = new Prize2016EarlySummber(params)
        if (!prize2016EarlySummberInstance.save(flush: true)) {
            render(view: "create", model: [prize2016EarlySummberInstance: prize2016EarlySummberInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), prize2016EarlySummberInstance.id])
        redirect(action: "list", id: prize2016EarlySummberInstance.id)
    }

    def show(Long id) {
        def prize2016EarlySummberInstance = Prize2016EarlySummber.get(id)
        if (!prize2016EarlySummberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), id])
            redirect(action: "list")
            return
        }

        [prize2016EarlySummberInstance: prize2016EarlySummberInstance]
    }

    def edit(Long id) {
        def prize2016EarlySummberInstance = Prize2016EarlySummber.get(id)
        if (!prize2016EarlySummberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), id])
            redirect(action: "list")
            return
        }

        [prize2016EarlySummberInstance: prize2016EarlySummberInstance]
    }

    def update(Long id, Long version) {
        def prize2016EarlySummberInstance = Prize2016EarlySummber.get(id)
        if (!prize2016EarlySummberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (prize2016EarlySummberInstance.version > version) {
                prize2016EarlySummberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber')] as Object[],
                          "Another user has updated this Prize2016EarlySummber while you were editing")
                render(view: "edit", model: [prize2016EarlySummberInstance: prize2016EarlySummberInstance])
                return
            }
        }

        prize2016EarlySummberInstance.properties = params

        if (!prize2016EarlySummberInstance.save(flush: true)) {
            render(view: "edit", model: [prize2016EarlySummberInstance: prize2016EarlySummberInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), prize2016EarlySummberInstance.id])
        redirect(action: "show", id: prize2016EarlySummberInstance.id)
    }

    def delete(Long id) {
        def prize2016EarlySummberInstance = Prize2016EarlySummber.get(id)
        if (!prize2016EarlySummberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), id])
            redirect(action: "list")
            return
        }

        try {
            prize2016EarlySummberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'prize2016EarlySummber.label', default: 'Prize2016EarlySummber'), id])
            redirect(action: "show", id: id)
        }
    }
}
