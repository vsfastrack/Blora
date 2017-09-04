package com.Quora.CommandObjects

import grails.validation.Validateable

/**
 * Created by bhaskar on 3/9/17.
 */
@Validateable
class ResourceCO extends BaseCO{
    String description
    String url
    String filePath
    String topicId

    static  constraints = {
        description blank: false
        topicId blank: false
        url nullable: true
        filePath nullable: true
    }
}
