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
            List {
                ForEach(viewModel.recipesList) { recipe in
                    RecipeView(recipe: recipe)
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
        .onChange(of: viewModel.recipeError, {
            showAlert = viewModel.recipeError != nil
        })
        .alert("Alert", isPresented: $showAlert) {
            Button{
                // Refetch
                Task { await viewModel.refresh() }
            } label: {
                Text("Refresh")
                    .fontWeight(.semibold)
            }
        } message: {
            Text("\(viewModel.recipeError?.customDescription ?? "")")
        }
    }
}

#Preview {
    ContentView(service: MockNetworkService())
}
