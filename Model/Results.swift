//
//  Results.swift
//  Weather
//
//  Created by Артур Шестаков on 12.03.2023.
//

import Foundation

struct Results:Codable{
    let id:String
    let urls:URLS
}

struct URLS:Codable{
    let regular:String
}
