//
//  NetworkService.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

class NetworkService {
    let endpoint = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
    let malformedUrl = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"
    let emptyDataURL = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"
    
    func fetchRecipes() async throws -> [RecipesDetails]? {
        guard let url = URL(string: endpoint) else {
            throw RecipeError.requestFailed(description: "Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RecipeError.requestFailed(description: "Request Failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw RecipeError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
            let recipe = try JSONDecoder().decode(Recipe.self, from: data)
            let recipesList = recipe.recipes
//            if recipesList.count == 0 {
//                throw RecipeError.empty
//            }
            print("DEBUG: RECEIVED DATA")
            return recipesList
        } catch {
            print("DEBUG: Error in catch in Service")
            throw RecipeError.unknownError
        }
    }
}
