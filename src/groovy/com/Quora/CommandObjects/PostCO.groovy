package com.Quora.CommandObjects

import grails.validation.Validateable

/**
 * Created by bhaskar on 3/9/17.
 */
@Validateable
class PostCO {
    String userName
    String fullName
    String topicName
    String topicDescription
    

}
