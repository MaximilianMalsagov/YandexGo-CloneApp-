//
//  HomeView.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 24.02.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        YandexMapViewRepresentable()
            .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
