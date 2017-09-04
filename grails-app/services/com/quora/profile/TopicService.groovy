package com.quora.profile

import com.Quora.CommandObjects.TopicCO
import com.Quora.entity.Subscription
import com.Quora.entity.Topic
import com.Quora.entity.User
import grails.transaction.Transactional

@Transactional
class TopicService {

    def springSecurityService

    def createTopic(TopicCO topicCO) {
        def user = springSecurityService.currentUser
            if(user){
                if(!Topic.findByUser(user)?.name?.equalsIgnoreCase(topicCO.topicName)) {
                    Topic topic = new Topic(topicCO.topicName ,topicCO.visibility)
                    user.addToTopics(topic)
                    user.save(flush: true,failOnError: true)

                    //To auto-subscribe User
                    Subscription subscription = new Subscription(createdDate:new Date())
                    subscription.user = user
                    subscription.topic = topic
                    subscription.save(flush: true,failOnError: true)
                    topicCO.responseMsg = "Topic created"
                }else{
                    topicCO.errMsg.add("Topic already exists already for this User")
                }
            }
        return topicCO
    }
}
