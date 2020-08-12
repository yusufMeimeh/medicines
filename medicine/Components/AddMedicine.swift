//
//  AddMedicine.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct AddMedicine: View {
    @EnvironmentObject var appData : AppData
    
    @State private var medicineName = ""
    @State private var medicineDescription = ""
    @State private var purpose = ""
    @State private var purposes = [String]()
    @State private var showingAlert = false
    @State private var showingExistingAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form{
            Section(header: Text("Medicine Data")){
                TextField("Medicine Name" , text: $medicineName)
                TextField("Medicine Description" , text: $medicineDescription)
            }
            
            Section(header: Text("Purposes")){
                VStack(alignment : .leading){
                    List{
                        ForEach(purposes, id: \.self){ item in
                            Text(item)
                        }.padding()
                    }
                    
                    HStack{
                        TextField("Type here..." , text: $purpose)
                        Button("Add"){
                            self.addPurpose()
                        }.disabled(self.purpose.isEmpty)
                    }
                }
            }
            
            Button(action: self.saveMedicine){
                HStack {
                    Spacer()
                    Text("Save")
                    Spacer()
                }
            }
        }.navigationBarTitle(Text("Add New Medicine") , displayMode: .inline)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("Please add missing info"), dismissButton: .default(Text("OK")))
        }
        .alert(isPresented: $showingExistingAlert) {
            Alert(title: Text("Error"), message: Text("This item already exists"), dismissButton: .default(Text("OK")))
        }
    }
    
    func addPurpose() {
        if !self.purpose.isEmpty{
            if !self.purposes.contains(self.purpose){
                self.purposes.append(self.purpose)
                self.purpose = ""
            }else{
                self.showingExistingAlert.toggle()
            }
        }else{
            self.showingAlert.toggle()
        }
    }
    
    func saveMedicine() {
        if !self.medicineName.isEmpty {
            let item = Medicine(id: UUID(), name: self.medicineName, purposes: self.purposes, description: self.medicineDescription)
            if !appData.medicines.contains(item){
                self.appData.addMedicine(item: item)
                self.presentationMode.wrappedValue.dismiss()
            }else{
                self.showingExistingAlert.toggle()
            }
        }else{
            self.showingAlert.toggle()
        }
    }
}

struct AddMedicine_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        AddMedicine().environmentObject(appData)
    }
}
