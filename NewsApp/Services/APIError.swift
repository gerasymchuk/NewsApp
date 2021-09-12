//
//  APIError.swift
//  NewsApp
//
//  Created by Misha on 07.09.2021.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case jsonDecodeFailure
    case invalidData
    case responseUnsuccessful
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return "Request Failed"
        case .invalidData: return "Invalid Data"
        case .responseUnsuccessful: return "Response Unsuccessful"
        case .jsonDecodeFailure: return "JSON Decoding Failure"
        }
    }
}
