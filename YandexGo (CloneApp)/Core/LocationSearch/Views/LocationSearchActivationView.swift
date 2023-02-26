//
//  LocationSearchActivationView.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 25.02.2023.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            Circle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            
            Text("Куда едем?")
                .foregroundColor(Color(.darkText))
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: .gray, radius: 6)
            )
        
    }
}

struct LocationSearchActivationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchActivationView()
    }
}
