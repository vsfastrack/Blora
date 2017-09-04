package com.Quora.CommandObjects

import grails.validation.Validateable

/**
 * Created by bhaskar on 1/9/17.
 */
@Validateable
class RegistrationCO extends BaseCO{
    String firstName
    String lastName
    String email
    String username
    String password
    String confirmPassword
    //String emailRegex = '?:[a-z0-9!#$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&\'*+/=?^_`{|}~-]+)*|"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\]'
    Byte [] profilePhoto

    static constraints = {
        firstName blank: false
        lastName blank: false
        email blank: false
        username blank: false
        password blank: false , minSize: 8
        confirmPassword blank: false , minSize: 8
        profilePhoto nullable: true
    }
}
