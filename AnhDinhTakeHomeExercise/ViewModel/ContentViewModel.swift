//
//  ContentViewModel.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var recipesList: [RecipesDetails] = []
    @Published var recipeError: RecipeError?
    private let service: NetworkServiceProtocol
    
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    @MainActor
    func fetchRecipes() async {
        do {
            self.recipesList = try await service.fetchRecipes()
        } catch {
            guard let error = error as? RecipeError else { return }
            self.recipeError = error
        }
    }
    
    @MainActor
    func refresh() async {
        self.recipeError = nil
        self.recipesList.removeAll()
        await self.fetchRecipes()
    }
}
