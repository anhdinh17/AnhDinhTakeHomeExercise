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
        print("DEBUG: Fetch Data")
        do {
            self.recipesList = try await service.fetchRecipes() 
        } catch {
            guard let error = error as? RecipeError else { return }
            self.recipeError = error
        }
    }
    
    func refresh() async {
        self.recipeError = nil
        await self.fetchRecipes()
    }
    
    func testRefresh() {
        print("DEBUG: Refresh Data")
    }
}
