import Vapor

final class UserController {
    
    func list(_ req: Request) throws -> Future<View> {
        return User.query(on: req).all().flatMap { users in
            let data = ["userlist" : users]
            return try req.view().render("userview", data)
        }
    }
}
