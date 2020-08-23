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
    @State private var patientMedicines = [PatientMedicines]()
    @State private var medicines = [Medicine]()
    
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
            
            if !self.patientMedicines.isEmpty{
                Section(header : Text("Medicins")){
                    ForEach(patientMedicines) { item in
                        PatientMedicineRow(object: item)
                    }
                }
            }
//            if !self.medicines.isEmpty{
//                Section(header : Text("Medicins")){
//                    ForEach(medicines) { item in
//                        NavigationLink(destination: MedicineDetailsView(medicine: item)){
//                            Text(item.name)
//                        }
//                    }
//                }
//            }
            
            Section{
                NavigationLink(destination: AddMedicineToPatientView(patient: patient)){
                    Text("Assign New Medicine").bold().foregroundColor(.orange)
                }
            }
        }.navigationBarTitle(Text("Patient Info") , displayMode: .inline)
            .onAppear {
                self.medicines =  self.getMedicines()
        }
    }
    
    private func getPatientMedicines() -> [PatientMedicines]{
        
        let patientMedicines = self.appData.patientMedicines.filter { (pm) -> Bool in
            pm.patientID == self.patient.id
        }
        
        return patientMedicines
        
    }
    
    private func getMedicines() -> [Medicine]{
        self.patientMedicines = self.appData.patientMedicines.filter({ (pm) -> Bool in
            pm.patientID == patient.id
        })//getPatientMedicines()
        
        var array = [Medicine]()
        for pm in patientMedicines {
            if let m = self.appData.medicines.first(where: { (m) -> Bool in
                m.id == pm.medicine
            }){
                array.append(m)
            }
        }

//        for i in 0..<patientMedicines.count{
//            for j in 0..<patientMedicines[i].medicines.count{
//                if let medicine = appData.medicines.first(where: { (m) -> Bool in
//                    m.id == patientMedicines[i].medicines[j]
//                }){
//                    array.append(medicine)
//                }
//            }
//        }
        
        return array
    }
}

struct PatientDetailsView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        PatientDetailsView(patient: patientExample).environmentObject(appData)
    }
}
