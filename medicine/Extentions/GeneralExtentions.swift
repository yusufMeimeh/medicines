//
//  GeneralExtentions.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/13/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import Foundation

extension Date {
    var age: Int { Calendar.current.dateComponents([.year], from: self, to: Date()).year! }
}

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
