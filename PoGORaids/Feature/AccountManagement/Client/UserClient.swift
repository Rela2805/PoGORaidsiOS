//
//  UserClient.swift
//  PoGORaids
//
//  Created by Borna Relic on 1/30/21.
//

import Foundation

protocol UserClientProtocol {
    func login(email: String, password: String, completionHandler: @escaping ((UserReposnse) -> ()))
    func register(userModel: UserRequest, completionHandler: @escaping ((UserReposnse) -> ()))
    func editProfile(userModel: UserRequest, userId: Int) -> Void
    func deleteProfile(id: Int) -> Void
    func getUser(id: Int, completionHandler: @escaping ((UserReposnse) -> ()))
}

class UserClient: UserClientProtocol {

    private let baseApiClient: BaseApiClient

    init(baseApiClient: BaseApiClient) {
        self.baseApiClient = baseApiClient
    }

    func login(email: String, password: String, completionHandler: @escaping ((UserReposnse) -> ())) {
        baseApiClient
            .executeAndReturn(path: "/user/login", method: .get, parameters: ["password" : password, "email": email], resultType: UserReposnse.self) { user in
                completionHandler(user)
            }
    }

    func register(userModel: UserRequest, completionHandler: @escaping ((UserReposnse) -> ())) {
        baseApiClient.executeAndReturn(path: "/user/register", method: .post, body: userModel, resultType: UserReposnse.self) { user in
            completionHandler(user)
        }
    }

    func editProfile(userModel: UserRequest, userId: Int) {
        baseApiClient.execute(path: "/user/\(userId)", method: .patch, body: userModel)
    }

    func deleteProfile(id: Int) {
        baseApiClient.execute(path: "/user/\(id)", method: .delete)
    }

    func getUser(id: Int, completionHandler: @escaping ((UserReposnse) -> ())) {
        baseApiClient.executeAndReturn(path: "/user/\(id)", method: .get, resultType: UserReposnse.self) { user in
            completionHandler(user)
        }
    }

}
