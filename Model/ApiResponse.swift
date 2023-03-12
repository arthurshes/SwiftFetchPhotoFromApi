//
//  ApiResponse.swift
//  Weather
//
//  Created by Артур Шестаков on 12.03.2023.
//

import Foundation

struct ApiResponse:Codable{
    let total:Int
    let total_pages:Int
    let results:[Results]
}
