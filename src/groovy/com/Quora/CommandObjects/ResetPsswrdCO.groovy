package com.Quora.CommandObjects

import grails.validation.Validateable

/**
 * Created by bhaskar on 2/9/17.
 */
@Validateable
class ResetPsswrdCO extends BaseCO{

    String username
    String email
    String oldPassword
    String newpassword
    String confirmPassword

    static constraints = {
        username blank: false,nullable: true
        email blank: false, nullable: true
        oldPassword blank: false , minSize: 8
        newpassword blank: false , minSize: 8
        confirmPassword blank: false , minSize: 8
    }

}
