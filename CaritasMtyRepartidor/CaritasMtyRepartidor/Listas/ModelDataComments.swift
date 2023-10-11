//
//  ModelDataComments.swift
//  CaritasMtyRepartidor
//
//  Created by Alumno on 11/10/23.
//

import Foundation

var listCommentOptions: Array<CommentOptions> = getCommentOptions()

func getCommentOptions() -> [CommentOptions] {
    var list: [CommentOptions] = []
    
    var request = URLRequest(url: URL(string: "http://10.22.217.63:10204/get-list-comments")!, timeoutInterval: Double.infinity)

    request.httpMethod = "GET"

    let group = DispatchGroup()
    group.enter()

    let task = URLSession.shared.dataTask(with: request) { data, _, error in
        let jsonDecoder = JSONDecoder()

        if let data = data {
            do {
                let commentlist = try jsonDecoder.decode([CommentOptions].self, from: data)
                list = commentlist
            } catch {
                print(error)
            }
        }

        group.leave()
    }

    task.resume()
    group.wait()
    
    print(list)
    return list
}

