//
//  Dog.swift
//  DogsApi
//
//  Created by Ayodeji Ayankola on 8/7/20.
//  Copyright © 2020 konga.com. All rights reserved.
//

import Foundation

struct Dog:Decodable {
    let name: String
    let origin: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let url:String?
}
