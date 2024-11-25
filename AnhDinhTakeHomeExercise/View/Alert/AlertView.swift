//
//  AlertView.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import SwiftUI

struct AlertView: View {
    @StateObject var viewModel: ContentViewModel
    let error: RecipeError
    
    var body: some View {
        VStack {
            Text("Error")
                .fontWeight(.bold)
                .font(.headline)
            
            Text(error.customDescription)
            
            Divider()
            
            Button{
                // Refetch
                Task { await viewModel.refresh() }
            } label: {
                Text("Refresh")
                    .fontWeight(.semibold)
            }
            .padding(.top, 3)
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 3)
        .padding()
    }
}

#Preview {
    AlertView(viewModel: ContentViewModel(service: NetworkService()),
              error: .emptyData)
}
