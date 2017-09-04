package com.quora.registration

import com.Quora.CommandObjects.RegistrationCO
import com.Quora.entity.User
import grails.transaction.Transactional

@Transactional
class RegistrationService {

   def register(RegistrationCO registrationCO){
       User user = User.findByUsername(registrationCO.username)
       if(!user){
           user = new User(registrationCO.username , registrationCO.password , registrationCO.email ,registrationCO.firstName ,registrationCO.lastName);
           user.save(flush: true);
       }else{
           registrationCO.errMsg.add("User already exists")
       }
       return registrationCO
   }
}
