//
//  UserRequest.swift
//  GreenSpace
//
//  Created by su on 2022/11/22.
//

import Foundation

struct UserRequest: Encodable{
    let nickname: String
    let username: String
    let point: Int
    let open: Bool
}
