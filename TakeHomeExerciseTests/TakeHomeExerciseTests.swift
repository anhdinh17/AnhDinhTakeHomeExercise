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
            XCTAssertEqual(recipesList, recipesList.sorted(by: { $0.name < $1.name }))
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testViewModelInit() {
        let service = MockNetworkService()
        let viewModel = ContentViewModel(service: service)
        XCTAssertNotNil(viewModel, "The view model should not be Nil.")
    }
    
    func testSuccessfullyFetchRecipes() async {
        let service = MockNetworkService()
        let viewModel = ContentViewModel(service: service)
        await viewModel.fetchRecipes()
        XCTAssertTrue(viewModel.recipesList.count > 0)
    }

    func testFetchRecipesWithInvalidJSON() async {
        let service = MockNetworkService()
        service.mockData = malformedData
        let viewModel = ContentViewModel(service: service)
        await viewModel.fetchRecipes()
        XCTAssertTrue(viewModel.recipesList.isEmpty)
        XCTAssertNotNil(viewModel.recipeError)
        XCTAssertEqual(viewModel.recipeError, RecipeError.unknownError)
    }
    
    func testFetchRecipeWithEmptyData() async {
        let service = MockNetworkService()
        service.mockData = emptyData
        let viewModel = ContentViewModel(service: service)
        await viewModel.fetchRecipes()
        XCTAssertNotNil(viewModel.recipeError)
        XCTAssertEqual(viewModel.recipeError, RecipeError.emptyData)
    }
    
    func testFetchRecipeWithInvalidStatusCode() async {
        let service = MockNetworkService()
        service.mockError = RecipeError.invalidStatusCode(statusCode: 404)
        let viewModel = ContentViewModel(service: service)
        await viewModel.fetchRecipes()
        XCTAssertNotNil(viewModel.recipeError)
        XCTAssertEqual(viewModel.recipeError, RecipeError.invalidStatusCode(statusCode: 404))
    }
    
    func testFetchRecipeWithRequestFailedError() async {
        let service = MockNetworkService()
        service.mockError = RecipeError.requestFailed
        let viewModel = ContentViewModel(service: service)
        await viewModel.fetchRecipes()
        XCTAssertNotNil(viewModel.recipeError)
        XCTAssertEqual(viewModel.recipeError, RecipeError.requestFailed)
    }
    
}
