//
//  Recipe.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

struct Recipe: Codable {
    let recipes: [RecipesDetails]
}

struct RecipesDetails: Codable, Identifiable {
    var id: String
    let cuisine: String
    let name: String
    let photoUrlSmall: String?
    let youtubeUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case id = "uuid"
        case photoUrlSmall = "photo_url_small"
        case youtubeUrl = "youtube_url"
    }
}
