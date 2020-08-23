//
//  PatientMedicineRow.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/23/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct PatientMedicineRow: View {
    var object : PatientMedicines
    @EnvironmentObject var appData : AppData

    var body: some View {
        VStack(alignment:.leading){
            NavigationLink(destination: MedicineDetailsView(medicine: getMedicine())) {
                Text(getMedicine().name)
            }
            Text("Dose Form: \(object.doseForm)")
            Text("Dose Strength: \(object.doseStrength) mg")
            Text("Medication Meal Period: \(object.medicationMealPeriod)")
            Text("Schedul: \(object.Schedul)")
            
            if object.Schedul == "Everyday"{
                
            }else if object.Schedul == "Select Days"{
                                
            }
        }
    }
    
    func getMedicine() -> Medicine{
        if let m = self.appData.medicines.first(where: { (m) -> Bool in
            m.id == object.medicine
        }){
            return m
        }
        return generateMedicineExample()
    }
}

struct PatientMedicineRow_Previews: PreviewProvider {
    static let object = gneratePatientMedicine()
    static var previews: some View {
        PatientMedicineRow(object: object)
    }
}
