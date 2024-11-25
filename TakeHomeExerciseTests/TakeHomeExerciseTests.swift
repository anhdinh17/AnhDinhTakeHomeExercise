//
//  TakeHomeExerciseTests.swift
//  TakeHomeExerciseTests
//
//  Created by Anh Dinh on 11/25/24.
//

import XCTest
@testable import AnhDinhTakeHomeExercise

final class TakeHomeExerciseTests: XCTestCase {
    
    func testModel() {
        do {
            let recipe = try JSONDecoder().decode(Recipe.self, from: mockRecipeData)
            let recipesList = recipe.recipes
            XCTAssertTrue(recipesList.count > 0)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testViewModelInit() {
        
    }

}
