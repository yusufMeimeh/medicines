//
//  AddMedicineToPatientView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct AddMedicineToPatientView: View {
    @EnvironmentObject var appData : AppData

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddMedicineToPatientView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        AddMedicineToPatientView().environmentObject(appData)
    }
}
