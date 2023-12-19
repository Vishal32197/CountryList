//
//  CountryListViewModel.swift
//  AylanDemo
//
//  Created by Bishal Ram on 19/12/23.
//

import Foundation
import RxRelay

protocol CountryListViewModelProtocol {
   var countryDetailDatasource: PublishRelay<[Countries]> { get }
   func fetchData()
}

final class CountryListViewModel: CountryListViewModelProtocol {
    // MARK: // Private Properties
    private let networkService: NetworkServiceProtocol
    
    // MARK: // Protocol Properties
    var countryDetailDatasource = RxRelay.PublishRelay<[Countries]>()
    
    // MARK: // Initializer
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: // Network Call Method
    func fetchData() {
        networkService.fetchData {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let countryDetail = response.rows
                self.countryDetailDatasource.accept(countryDetail)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
