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
    let role: String
    let lastName: String
    let refreshToken: String
    let accessToken: String

}
