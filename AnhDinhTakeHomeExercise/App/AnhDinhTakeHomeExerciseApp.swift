//
//  AnhDinhTakeHomeExerciseApp.swift
//  AnhDinhTakeHomeExercise
//
//  Created by Anh Dinh on 11/25/24.
//

import SwiftUI

@main
struct AnhDinhTakeHomeExerciseApp: App {
    var body: some Scene {
        WindowGroup {
            let service = NetworkService()
            ContentView(service: service)
        }
    }
}
