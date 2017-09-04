package com.Quora.CommandObjects

import grails.validation.Validateable

/**
 * Created by bhaskar on 2/9/17.
 */
@Validateable
class TopicCO extends BaseCO{

    String topicName
    String visibility
    static constraints = {
        topicName blank : false
        visibility blank :false,maxSize: 2
    }
}
