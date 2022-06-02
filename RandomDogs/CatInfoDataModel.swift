//
//  RandomDogRootDataModel.swift
//  RandomDogs
//
//  Created by Nguyễn Đương Quang on 5/30/22.
//

import Foundation

struct CatInfoDataModel : Decodable {
    let breeds: [String]
    let id: String
    let url: String?
    let width: Int
    let height: Int
}
