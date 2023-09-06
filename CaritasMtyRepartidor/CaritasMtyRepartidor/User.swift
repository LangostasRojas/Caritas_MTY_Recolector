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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(Int.self, forKey: .userId)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.name = try container.decode(String.self, forKey: .name)
        self.role = try container.decode(String.self, forKey: .role)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
    }

}
