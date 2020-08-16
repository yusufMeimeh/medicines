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
    @State private var selectedMedcine = ""
    @State private var selectedMedcineType = 0
    @State private var selectedMedcineMealType = 0
    @State private var selectedMedcinePeriodType = 0
    @State private var times = ""
    @State private var showingAlert = false
    
    static let medicineTypes = ["Liquid" , "Tablets" , "Capsules" , "Suppositories" , "Drops" , "Inhalers"]
    static let medicineTimeTypes = ["Before Meal" , "After Meal"]
    static let medicineTimePeriods = ["Daily" , "Weekly" , "Monthly" , "Yearly"]
    var timesLabel : String{
        return ("Times/\(Self.medicineTimePeriods[selectedMedcinePeriodType])")
    }
    
    var selectedMedicineObject : Medicine?{
        return appData.medicines.first { (m) -> Bool in
            m.name == self.selectedMedcine
        }
    }
 
    //    Liquid سائل
    //    Tablets أقراص
    //    Capsules كبسولات
    //    Suppositories تحاميل
    //    Drops قطرات
    //    Inhalers دواء استنشاقي
    //    Injections الحقن
    var body: some View {
        Form{
            Section(header : Text("Medicines")){
                Picker("Select Medicine" , selection: $selectedMedcine){
                    ForEach(self.appData.medicines.compactMap({$0.name}) , id: \.self) { item in
                        Text(item)
                    }
                }
            }
            
            Section(header : Text("Medicine Type")){
                Picker("Select Medicine Type" , selection: $selectedMedcineType){
                    ForEach( 0 ..< Self.medicineTypes.count ){
                        Text(Self.medicineTypes[$0])
                        
                    }
                }
            }
            
            Section(header : Text("Medicine Meal Type")){
                Picker("Select Meal Type" , selection: $selectedMedcineMealType){
                    ForEach( 0 ..< Self.medicineTimeTypes.count){
                        Text(Self.medicineTimeTypes[$0])
                        
                    }
                }
            }
            Section(header : Text("Medicine Period Type")){
                Picker("Select Period Type" , selection: $selectedMedcinePeriodType){
                    ForEach( 0 ..< Self.medicineTimePeriods.count){
                        Text(Self.medicineTimePeriods[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                if self.selectedMedcinePeriodType >= 0{
                    Section(header : Text(timesLabel)){
                        TextField(timesLabel , text: $times).keyboardType(.numberPad)
                    }
                }
            }
            
        }
        .navigationBarTitle("Assign Medicine to Patient" , displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text("Please add missing info"), dismissButton: .default(Text("OK")))
        }
        .navigationBarItems(trailing: Button(action: self.savePatientMedicine){
            HStack {
                Spacer()
                Text("Save")
                Spacer()
            }
        })
            .onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
            })
        
    }
    
    func savePatientMedicine() {
        if let medicine = self.selectedMedicineObject , !times.isEmpty{
            print(medicine)
            print(Self.medicineTypes[selectedMedcineType])
            print(Self.medicineTimeTypes[selectedMedcineMealType])
            print(Self.medicineTimePeriods[selectedMedcinePeriodType])
            print(times)
            
        }else{
            self.showingAlert.toggle()
        }
    }
}

struct AddMedicineToPatientView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        AddMedicineToPatientView().environmentObject(appData)
    }
}
