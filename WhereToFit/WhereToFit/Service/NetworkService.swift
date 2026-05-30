//
//  NetworkService.swift
//  WhereToFit
//
//  Created by 변예린 on 5/29/26.
//

import Foundation
import Alamofire

final class NetworkService {
    
}

extension NetworkService {
    enum API {
        case weather
        case facility
        
        var basrUrl: String {
            switch self {
            case .weather:
                "https://api.openweathermap.org/data/2.5/weather"
            case .facility:
                
            }
        }
    }
}
