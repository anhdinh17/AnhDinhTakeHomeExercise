//
//  NetworkService.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation
protocol NetworkServiceProtocol {
    func fetchRecipes() async throws -> [RecipesDetails]
}

class NetworkService: NetworkServiceProtocol {
    let endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    let malformedUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    let emptyDataURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    func fetchRecipes() async throws -> [RecipesDetails] {
        guard let url = URL(string: endpoint) else {
            throw RecipeError.requestFailed
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RecipeError.requestFailed
        }
        
        guard httpResponse.statusCode == 200 else {
            throw RecipeError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            let recipe = try JSONDecoder().decode(Recipe.self, from: data)
            let recipesList = recipe.recipes.sorted(by: { $0.name < $1.name })
            guard recipesList.count > 0 else {
                throw RecipeError.emptyData
            }
            return recipesList
        } catch {
            throw RecipeError.unknownError
        }
    }
}
