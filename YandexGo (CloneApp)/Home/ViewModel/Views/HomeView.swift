//
//  HomeView.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 24.02.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            YandexMapViewRepresentable()
                .ignoresSafeArea()
            LocationSearchActivationView()
                .padding(.top, 72)
            
            MapViewActionButton()
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
