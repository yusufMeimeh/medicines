//
//  AddPatientView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct AddPatientView: View {
    @State private var patientName = ""
    @State private var patientDob = Date()
    @State private var showingAlert = false

    @EnvironmentObject var appData : AppData
    @Environment(\.presentationMode) var presentationMode

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        Form{
            Section(header: Text("Patient Info")){
                TextField("Patient Name" , text: $patientName)
                DatePicker(selection: $patientDob, in: ...Date(), displayedComponents: .date) {
                    Text("Select a date")
                        .onAppear {
                            self.endEditing()
                    }
                    .onTapGesture{self.endEditing()}
                    
                }
            }
            
            Button(action: self.savePatient){
                HStack {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
            }
            
        }.navigationBarTitle(Text("Add New Patient") , displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text("Please add patient info"), dismissButton: .default(Text("OK")))
        }
    }
    func savePatient() {
        if !self.patientName.isEmpty {
            let patient = Patient(id: UUID(), name: self.patientName, dob: self.patientDob)
            self.appData.addPatient(patient: patient)
            self.presentationMode.wrappedValue.dismiss()
        }else{
            self.showingAlert.toggle()
        }
    }

}

struct AddPatientView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        AddPatientView().environmentObject(appData)
    }
}
