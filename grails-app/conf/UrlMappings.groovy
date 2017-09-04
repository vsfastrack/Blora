import com.quora.profile.TopicController

class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/register"(controller: "registration" , action: "register")
        "/addtopic"(controller: "topic" ,action: "createTopic")
        "/resetPassword"(controller: "profile" , action: "resetPassword")
        "500"(view:'/error')
	}
}
