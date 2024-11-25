//
//  ContentView.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    @State var showAlert = false
    
    init(service: NetworkServiceProtocol) {
        self._viewModel = StateObject(wrappedValue: ContentViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(viewModel.recipesList) { recipe in
                        RecipeView(recipe: recipe)
                    }
                }
                
                // Alert
                if let error = viewModel.recipeError {
                    AlertView(viewModel: self.viewModel, error: error)
                }
            }
        }
        .refreshable {
            // Pull down the list to refetch data.
            Task { await viewModel.fetchRecipes() }
        }
        .task {
            await viewModel.fetchRecipes()
        }
    }
}

#Preview {
    ContentView(service: MockNetworkService())
}
