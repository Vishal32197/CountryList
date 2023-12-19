//
//  MovieListModel.swift
//  AylanDemo
//
//  Created by Bishal Ram on 19/12/23.
//

import Foundation

struct CountryInfo: Codable {
    let title: String
    let rows: [Countries]
}

struct Countries: Codable {
    let title: String?
    let description: String?
    let imageHref: String?
}
