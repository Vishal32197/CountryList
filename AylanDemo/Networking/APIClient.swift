//
//  APIClient.swift
//  AylanDemo
//
//  Created by Bishal Ram on 19/12/23.
//

import Foundation

enum APIError: Error {
    case failed
}

class APIClient {
    private let environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func request<T: Codable>(route: Route, method: HTTPMethod, completion: @escaping (Result<T, APIError>) -> Void) {
          guard let url = URL(string: environment.baseURL + route.rawValue) else {
              completion(.failure(.failed))
              return
          }

          var request = URLRequest(url: url)
          request.httpMethod = method.rawValue

          URLSession.shared.dataTask(with: request) { data, _, error in
              if let _ = error {
                  completion(.failure(.failed))
                  return
              }

              guard let data = data else {
                  completion(.failure(.failed))
                  return
              }
            
              do {
                  let data = try JSONDecoder().decode(T.self, from: data)
                  completion(.success(data))
              } catch {
                  completion(.failure(.failed))
              }
          }.resume()
      }
}
