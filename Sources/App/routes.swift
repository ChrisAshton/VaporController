import Vapor
import Leaf // added
import Routing // added


/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    
    // MARK: GET routes
    // Diving into databases
    let userController = UserController()
    router.get("users", use: userController.list) // much shortened version
    
    // MARK: POST routes
    router.post("users") { req -> Future<Response> in
        return try req.content.decode(User.self).flatMap { user in
            return user.save(on: req).map { _ in
                return req.redirect(to: "users")
            }
        }
    }
}

// Important: Your class or struct conforms to Content
struct Person: Content {
    var name: String
    var age: Int
}
