//
//  RecipeError.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

enum RecipeError: Error, Equatable {
    case requestFailed
    case invalidStatusCode(statusCode: Int)
    case emptyData
    case unknownError
    
    var customDescription: String {
        switch self {
        case .requestFailed:
            return "Unable to make your request at this time."
        case .invalidStatusCode(let statusCode):
            return "Invalid status code: \(statusCode)"
        case .emptyData:
            return "No recipes are available at this time.\nPlease try again later or refresh the page."
        case .unknownError:
            return "An unknown error occured.\nPlease try again later or refresh the page."
        }
    }
}
