//
//  ContentViewModel.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var recipesList: [RecipesDetails]?
    @Published var recipeError: RecipeError?
    private let service: NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    
    @MainActor
    func fetchRecipes() async {
        print("DEBUG: Fetch Data")
        do {
            if let recipesList = try await service.fetchRecipes() {
                self.recipesList = recipesList
            }
        } catch {
            guard let error = error as? RecipeError else { return }
            self.recipeError = error
        }
    }
    
    func refresh() async {
        await self.fetchRecipes()
    }
    
    func testRefresh() {
        print("DEBUG: Refresh Data")
    }
}
