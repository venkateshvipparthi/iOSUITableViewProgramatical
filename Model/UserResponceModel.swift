//
//  UserResponceModel.swift
//  iOSUITableViewProgramatical
//
//  Created by Admin on 10/03/2022.
//

import Foundation

struct UserResponceModel: Decodable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [User]
    let support: Support
}

struct User: Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String?
}

struct Support: Decodable {
    let url: String
    let text: String
}
