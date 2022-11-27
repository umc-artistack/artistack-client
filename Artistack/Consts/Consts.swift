//
//  Consts.swift
//  Artistack
//
//  Created by 임영준 on 2022/11/27.
//

import Foundation
import Alamofire

struct Const {
    
    
    static let authenticator = MyAuthenticator()
    static let credential = MyAuthenticationCredential(accessToken: acToken!,
                                                refreshToken: UserDefaults.standard.string(forKey: "refreshToken")!,
                                                expiredAt: Date(timeIntervalSinceNow: 60 * 3))
    static let myAuthencitationInterceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                                credential: credential)
    
    static let acToken = UserDefaults.standard.string(forKey: "accessToken")
    static let header : HTTPHeaders = [
        "Contend-Type" : "application/json;charset=UTF-8",
        "Authorization" : "Bearer " + acToken!]
    
    
    
    
    
    struct Url{
        static let baseUrl =  "https://dev.artistack.shop"
        static let singInUrl =  "/users/create"
        static let reissueUrl = "/users/login"
        static let duplicateUrl = "/users/modify"
        static let profileUrl = "/users/modify"
        static let signUpUrl = "/users/modify"
        
    }
    
    
}

