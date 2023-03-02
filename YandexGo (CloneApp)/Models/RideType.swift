//
//  RideType.swift
//  YandexGo (CloneApp)
//
//  Created by Максимилиан Мальсагов on 02.03.2023.
//

import Foundation

enum RideType : Int, CaseIterable, Identifiable {
    
    case yandexX
    case black
    case yandexXL
    
    var id: Int { return rawValue}
    
    var description : String {
        switch self {
        case .yandexX: return "YandexX"
        case .black : return "YandexBlack"
        case .yandexXL: return "YandexXL"
        }
    }
    
    var imageName : String {
        switch self {
        case .yandexX : return "yandex-x"
        case .black: return "yandex-black"
        case .yandexXL: return "yandex-x"
        }
    }
}
