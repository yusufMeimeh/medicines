//
//  TodayRow.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/24/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct TodayRow: View {
    var object : PatientMedicines
    @EnvironmentObject var appData : AppData
    @State private var medicine : Medicine = generateMedicineExample()
    @State private var time : PatientMedicinesTime?

    var body: some View {
        VStack(alignment:.leading){
            NavigationLink(destination: MedicineDetailsView(medicine: self.medicine)) {
                Text(self.medicine.name)
            }
            if !(self.time?.time.description.isEmpty ?? true){
                Text(self.time!.time.description)
            }
            Text(medicine.name)
            
        }.onAppear {
            self.medicine = self.getMedicine()
            self.getNextTimeMedicine()
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
    
    func getNextTimeMedicine(){
        
        if let times = object.times , let first = times.first(where: { (pt) -> Bool in
            pt.time > Date()
        }){
            self.time = first
        }
    }
}

struct TodayRow_Previews: PreviewProvider {
    static let object = gneratePatientMedicine()
    static var previews: some View {
        TodayRow(object: object)
    }
}
