//
//  User.swift
//  CaritasMty
//
//  Created by Alumno on 04/09/23.
//

import Foundation

struct User: Codable{
    let userId: Int
    let userName: String
    let name: String
    let lastName: String
    let role: String
    let exp: String
    let refreshToken: String
    let accessToken: String
    
    init(userId: Int, userName: String, name: String, lastName: String, role: String, exp: String, refreshToken: String, accessToken: String) {
        self.userId = userId
        self.userName = userName
        self.name = name
        self.lastName = lastName
        self.role = role
        self.exp = exp
        self.refreshToken = refreshToken
        self.accessToken = accessToken
    }
}
