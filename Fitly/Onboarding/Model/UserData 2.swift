//
//  UserData 2.swift
//  Fitly
//
//  Created by İrem Sever on 26.09.2024.
//


struct UserData: Codable {
    var name: String = ""
    var age: Int?
    var gender: String = ""
    var height: Double?
    var weight: Double?
    var goalWeight: Double?
    var currentIndex: Int = 0 
}
