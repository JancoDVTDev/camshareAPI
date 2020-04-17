import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    //TipsAndTricks
    router.get("tipsandtricks") { request -> [String: [TipsAndTricksModel]] in
        var repo = TipsAndTricksRepo()
        let tipsAndTricksContent = repo.populateDictionaries()
        return ["tips": tipsAndTricksContent]
    }
    
    router.post(TipsAndTricksModel.self, at: "tipsandtricks/updatestatustried") { request, model -> TipsAndTricksModel in
        let tipsAndTricksController = TipsAndTricsController()
        let newModel = tipsAndTricksController.changeStatusTried(model: model)
        return newModel
    }
    
    router.post(TipsAndTricksModel.self, at: "tipsandtricks/updatestatusnew") { request, model -> TipsAndTricksModel in
        let tipsAndTricksController = TipsAndTricsController()
        let newModel = tipsAndTricksController.changeStatusNew(model: model)
        return newModel
    }
    
    // Validate Email
    router.get("validate", String.parameter) { request -> [String : String] in
        let email = try request.parameters.next(String.self)
        var error = "Nothing Wrong With Email!"
        var status = "true"
        // Check Email
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let valid = emailPredicate.evaluate(with: email)
        // Error Message
        if !valid {
            error = "Email format is not valid"
            status = "false"
        }
        
        return ["Error" : error]
    }
    
    router.post("welcome", String.parameter, String.parameter) { request -> PostModel in
        let name = try request.parameters.next(String.self)
        let surname = try request.parameters.next(String.self)
        let greet = "Welcome \(name) \(surname)"
        let pm = PostModel.init(name: name, surname: surname, greet: greet)
        return pm
    }
    
    router.post(PostModelBody.self, at:"user") { request, user -> PostModelBody in
        return user
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
