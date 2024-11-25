//
//  MockNetworkService.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

class MockNetworkService: NetworkServiceProtocol {
    var mockData: Data?
    var mockError: RecipeError?
    
    func fetchRecipes() async throws -> [RecipesDetails] {
        if let mockError = mockError {
            throw mockError
        }
        
        do {
            let recipes = try JSONDecoder().decode(Recipe.self, from: mockData ?? mockRecipeData)
            let recipesList = recipes.recipes
            guard recipesList.count > 0 else {
                throw RecipeError.emptyData
            }
            return recipesList
        } catch {
            throw error as? RecipeError ?? .unknownError
        }
    }
}
