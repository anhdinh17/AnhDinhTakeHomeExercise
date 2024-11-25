//
//  RecipeView.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    let recipe: RecipesDetails
    
    var body: some View {
        HStack {
            RecipeImageView(recipe: recipe)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .fontWeight(.semibold)
                
                Text(recipe.cuisine)
                    .font(.subheadline)
                
                if let youtubeUrl = recipe.youtubeUrl {
                    Link("Video", destination: URL(string: youtubeUrl)!)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 3))
                }
            }
        }
    }
}

#Preview {
    RecipeView(recipe: MOCK_RECIPE_DETAIL)
}
