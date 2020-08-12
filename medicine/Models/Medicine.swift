//
//  Medicine.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct Medicine: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var purposes: [String]
    var description: String

    static func == (lhs: Self, rhs: Self) -> Bool{
        return lhs.name == rhs.name
    }
}


