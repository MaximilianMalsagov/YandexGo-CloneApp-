//
//  YandexGo__CloneApp_App.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 24.02.2023.
//

import SwiftUI

@main
struct YandexGo__CloneApp_App: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
