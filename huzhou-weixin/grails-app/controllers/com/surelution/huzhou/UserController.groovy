package com.surelution.huzhou

import org.springframework.dao.DataIntegrityViolationException

class UserController {

//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }
		
		def role = UserRole.findByUser(userInstance)?.role
		println role
        [userInstance: userInstance,role:role]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "list", model: [userInstance: userInstance],id:id)
                return
            }
        }
        userInstance.properties = params
		
        if (!userInstance.save(flush: true)) {
			
            render(view: "show", model: [userInstance: userInstance])
            return
        }
		
		def userRole = UserRole.findByUser(userInstance)
		println userRole
		if(!userRole){
			userRole = UserRole.create(userInstance,Role.get(params.role),true)
		}else{
			userRole.delete(flush:true)
			UserRole.create(userInstance,Role.get(params.role),true)
		}

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def showChangePw() {
	
	}

	def changePw() {
		def newPw1 = params.newPw1
		def newPw2 = params.newPw2
		if(newPw1 != newPw2) {
			flash.message = message(code: 'password.and.confirmPassword.not.match')
			redirect(action:'showChangePw')
			return
		}
		def user = springSecurityService.currentUser
		user = User.findByUsername(user.username)
		if(user) {
	//			def pw1 = params.password // the old password which user input
	//			def pw2 = springSecurityService.encodePassword(pw1, user.username) // the encrypted old password user input
	//			def pw3 = user.password
	//			println "${pw1},\n ${pw2},\n ${pw3}"
			
			if(springSecurityService.passwordEncoder.isPasswordValid(user.password, params.password, null)) {
				user.password = newPw1
				user.save(flush:true)
				flash.message = message(code: 'password.change.succeed')
				redirect(action:'showChangePw')
				return
			} else {
				flash.message = message(code: 'old.password.not.match')
				redirect(action:'showChangePw')
				return
			}
		}
	}
}
