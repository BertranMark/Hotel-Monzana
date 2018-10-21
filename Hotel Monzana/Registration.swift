//
//  Registration.swift
//  Hotel Monzana
//
//  Created by Bertran on 18.10.2018.
//  Copyright © 2018 Bertran. All rights reserved.
//

import Foundation

struct Registration {
    var firstName : String
    var lastName : String
    var emailAddress: String
    // для баз данных делают много разных мелких сущностей, например, для гостя отдельная, для его детей отдельная, про даты отдельная
    
    var checkinDate: Date
    var chackoutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var roomType: RoomType
    var wifi: Bool
}

struct RoomType: Equatable {
    
    var id: Int
    var name: String
    var shortName: String
    var price : Int
    
    static func ==(lhs: RoomType, rhs: RoomType) -> Bool {
        return lhs.id == rhs.id
    }
    
}

let rooms: [ RoomType ] = [
    RoomType(id: 1, name: "Стандарт", shortName: "Стандарт", price: 100),
    RoomType(id: 2, name: "Полюлюкс", shortName: "Полюлюкс", price: 150),
    RoomType(id: 3, name: "Люкс", shortName: "Люкс", price: 200),
    RoomType(id: 3, name: "Королевский люкс", shortName: "Королевский люкс", price: 300)
]
