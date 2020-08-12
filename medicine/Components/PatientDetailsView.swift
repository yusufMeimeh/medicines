//
//  PatientDetailsView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct PatientDetailsView: View {
    @EnvironmentObject var appData : AppData

    var patient : Patient
    var body: some View {
        Text(patient.name)
    }
}

struct PatientDetailsView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        PatientDetailsView(patient: patientExample).environmentObject(appData)
    }
}
