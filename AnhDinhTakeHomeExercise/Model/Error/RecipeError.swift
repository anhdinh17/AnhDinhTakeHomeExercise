//
//  RecipeError.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

enum RecipeError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case emptyData
    case unknownError
    
    var customDescription: String {
        switch self {
        case .invalidData:
            return "Invalid Data"
        case .jsonParsingFailure:
            return "Failed to parse JSON"
        case .requestFailed(let description):
            return "Request failed: \(description)"
        case .invalidStatusCode(let statusCode):
            return "Invalid status code: \(statusCode)"
        case .emptyData:
            return "No recipes are available at this time.\nPlease try again later or refresh the page."
        case .unknownError:
            return "An unknown error occured.\nPlease try again later or refresh the page."
        }
    }
}
