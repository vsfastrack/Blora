package com.quora.bootsrap

import com.Quora.entity.Role
import com.Quora.entity.User
import com.Quora.entity.UserRole
import grails.transaction.Transactional

@Transactional
class BootstrapService {
    public void createRoles() {
        if (Role.count < 1) {
            new Role(authority: "ROLE_ADMIN").save(flush: true)
            new Role(authority: "ROLE_USER").save(flush: true)
        }
    }

    public void createAdmins() {
        Role adminRole = Role.findByAuthority("ROLE_ADMIN")
        println adminRole
        if (!User.countByUsername("admin1@nexthoughts.com")) {
            User admin1 = new User("admin1@fintech.com" , 'admin123' ,'admin@fintech.com', "Neon" , "Admin" ,true)
            admin1.save(flush: true)
            UserRole.create(admin1,adminRole,true)
        }
    }

    public void createUsers() {
        Role adminRole = Role.findByAuthority("ROLE_USER")
                User user1 = new User("vaibhav@fintech.com" , 'vaibhav123','vaibhav@fintech' , "Vaibhav" , "User" )
                user1.save(flush: true)
                UserRole userRole = new UserRole(user: user1, role: adminRole)
                userRole.save(flush: true)
    }
}
