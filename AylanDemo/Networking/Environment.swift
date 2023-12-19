//
//  Environment.swift
//  AylanDemo
//
//  Created by Bishal Ram on 19/12/23.
//

import Foundation

enum Environment {
    case test
}

extension Environment {
    var baseURL: String {
        switch self {
        case .test:
            return "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/"
        }
    }
}
