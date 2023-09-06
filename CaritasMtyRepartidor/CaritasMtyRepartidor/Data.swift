//
//  ModelData.swift
//  ApiApp
//
//  Created by Alumno on 01/09/23.
//

import Foundation

//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let parameters: [String: Any] = ["key1": "value1", "key2": "value2"] // replace with your parameters
//
//do {
//    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//} catch let error {
//    print(error.localizedDescription)
//}

func login(usernamelog: String, passwordlog: String, completion: @escaping (User?, Error?) -> Void){
    
    
    guard let url = URL(string:"http://10.22.211.207:10201/sign-in") else{
        completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
        return
    }
    
    let body: [String: Any] = [
        "username": "\(usernamelog)",
        "password": "\(passwordlog)"
    ]
    
    let jsonData = try? JSONSerialization.data(withJSONObject: body)
    
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.httpBody = jsonData
    
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    
    
    URLSession.shared.dataTask(with: request){
        data, response, error in
        if let error = error{
            DispatchQueue.main.async {
                completion(nil, error)
            }
            return
        }
        if let data = data {
            let responseString = String(data: data, encoding: .utf8) ?? "Invalid data"
            
            
            do {
                let decoder =  JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                DispatchQueue.main.async {

                    completion(user, nil)
                }
            } catch {
                DispatchQueue.main.async {
                    print("Error: \(responseString)")
                    completion(nil, error)

                }
            }
                
            
            
        }
    }.resume()
        
    return
}



