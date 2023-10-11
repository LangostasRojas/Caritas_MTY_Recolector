//
//  CommentOption.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 11/10/23.
//

import Foundation

struct CommentOptions: Codable, Identifiable {
    let id: Int
    let comment: String
    
    init(id: Int, comment: String) {
        self.id = id
        self.comment = comment
    }
}
