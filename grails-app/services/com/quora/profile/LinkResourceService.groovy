package com.quora.profile

import com.Quora.CommandObjects.ResourceCO
import com.Quora.entity.DocumentResource
import com.Quora.entity.LinkResource
import com.Quora.entity.Resource
import com.Quora.entity.Topic
import com.Quora.entity.User
import grails.transaction.Transactional

@Transactional
class LinkResourceService {

    def springSecurityService

    def saveLink(ResourceCO resourceCO) {

        User user =springSecurityService.currentUser

        if(user){
            Resource resource = null;
            Topic topic = Topic.findById(Long.parseLong(resourceCO.topicId))
            if(resourceCO?.url){
                 resource = new LinkResource(resourceCO.url)
            }else if(resourceCO?.filePath){
                 resource = new DocumentResource(resourceCO?.filePath)
            }
            resource.description = resourceCO.description
            resource.topic = topic
            resource.createdBy = user
            resource.save(flush: true ,failOnError: true)
        }else{
            resourceCO.errMsg.add("Resource cannot be created")
        }
       return resourceCO
    }
}
