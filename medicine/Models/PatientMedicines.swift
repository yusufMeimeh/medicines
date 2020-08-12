//
//  PatientMedicines.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct PatientMedicines: Codable, Equatable, Identifiable {
    var id: UUID
    var patientID: String
    var medicines: [String]
    var dosePeriod: [String]
    var times: Int
    var totalTablets: Int
}


