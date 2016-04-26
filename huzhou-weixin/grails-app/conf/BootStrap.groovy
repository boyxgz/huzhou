import com.surelution.huzhou.User
import com.surelution.huzhou.Role
import com.surelution.huzhou.UserRole
class BootStrap {

    def init = { servletContext ->
		def admin = User.findByUsername("huzhouadmin")
		if(!admin){
			admin = new User()
			admin.username = "huzhouadmin"
			admin.password = "huzhouadmin"
			admin.enabled = true
			admin.save(flush:true)
		}else{
			admin.password = "huzhouadmin"
			admin.save(flush:true)
		}
		
		def roleAdmin = Role.findByAuthority("ROLE_ADMIN")
		if(!roleAdmin){
			roleAdmin = new Role()
			roleAdmin.authority = "ROLE_ADMIN"
			roleAdmin.save(flush:true)
		}
		
    }
    def destroy = {
    }
}
