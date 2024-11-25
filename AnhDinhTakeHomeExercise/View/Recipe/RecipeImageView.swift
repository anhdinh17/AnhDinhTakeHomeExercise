//
//  RecipeImageView.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import SwiftUI
import Kingfisher

struct RecipeImageView: View {
    let recipe: RecipesDetails
    
    var body: some View {
        if let imageUrl = recipe.photoUrlSmall {
            KFImage(URL(string: imageUrl))
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(radius: 3)
            
        } else {
            Image(systemName: "fork.knife.circle.fill")
                .resizable()
                .frame(width: 64, height: 64)
        }
    }
}

#Preview {
    RecipeImageView(recipe: MOCK_RECIPE_DETAIL)
}
