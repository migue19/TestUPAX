//
//  RegisterEntity.swift
//  TestUPAX
//
//  Created by Miguel Mexicano Herrera on 23/12/22.
//

import Foundation

struct UserData: Codable {
    var name: String
    var paternalLastName: String
    var maternalLastName: String
    var gender: Gender
    var birthday: String
}

enum Gender: Int, Codable {
    case male = 0
    case female = 1
}
