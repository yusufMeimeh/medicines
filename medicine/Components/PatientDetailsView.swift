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

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    var patient : Patient
    var body: some View {
        Form{
            Section(header : Text("Personal Info")){
                VStack(alignment: .leading , spacing: 16){
                    Text(patient.name)
                    HStack{
                        if patient.dob != nil{
                            Text("DOB: \(self.dateFormatter.string(from: patient.dob!))")
                            Spacer()
                            Text("Age: \(patient.dob!.age) Yrs")
                        }
                    }
                }
            }
//            
//            if !self.patientMedicins.isEmpty{
//                Section(header : Text("Medicins")){
//                    ForEach(self.appData.medicines) { item in
//                        NavigationLink(destination: MedicineDetailsView(medicine: item)){
//                            Text(item.name)
//                        }
//                    }
//                }
//            }
//            
//            Section{
//                NavigationLink(destination: MultipleSelectionList()){
//                    Text("Add New Medicine").bold().foregroundColor(.orange)
//                }
//            }
        }.navigationBarTitle(Text("Patient Info") , displayMode: .inline)
    }
}

struct PatientDetailsView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        PatientDetailsView(patient: patientExample).environmentObject(appData)
    }
}
