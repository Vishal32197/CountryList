//
//  NetworkService.swift
//  AylanDemo
//
//  Created by Bishal Ram on 19/12/23.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(completion: @escaping (Result<CountryInfo, APIError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    private let apiClient = APIClient(environment: .test)
    
    func fetchData(completion: @escaping (Result<CountryInfo, APIError>) -> Void) {
        apiClient.request(route: .fetchData, method: .get, completion: completion)
    }
}
