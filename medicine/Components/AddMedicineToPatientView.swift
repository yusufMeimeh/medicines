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
    @State private var doseStrength = ""
    @State private var showingAlert = false
    @State private var expireDob = Date()
    @State private var count = 1
    @ObservedObject var medicineTimes = Time()
    @ObservedObject var days = Day()
    
    static let medicineTypes = ["Liquid" , "Tablets" , "Capsules" , "Suppositories" , "Drops" , "Inhalers"]
    
    static let medicineTimeTypes = ["Before Meal" , "After Meal"]
    
    static let medicineTimePeriods = ["Everyday" , "Select Days" , "As Needed"]
    
    var timesLabel : String{
        return ("Times/\(Self.medicineTimePeriods[selectedMedcinePeriodType])")
    }
    
    var selectedMedicineObject : Medicine?{
        return appData.medicines.first { (m) -> Bool in
            m.name == self.selectedMedcine
        }
    }
    
    var body: some View {
        Form{
            Section(header : Text("Medicines")){
                Picker("Select Medicine" , selection: $selectedMedcine){
                    ForEach(self.appData.medicines.compactMap({$0.name}) , id: \.self) { item in
                        Text(item)
                    }
                }
            }
            
            Section(header : Text("Dose Form")){
                Picker("Select the dose form" , selection: $selectedMedcineType){
                    ForEach( 0 ..< Self.medicineTypes.count ){
                        Text(Self.medicineTypes[$0])
                        
                    }
                }
            }
            Section(header : Text("Dose Strength")){
                HStack(alignment: .center, spacing: 8){
                    TextField("Dose Strength" , text: $doseStrength).keyboardType(.numberPad)
                    Text("mg")
                }
            }
            
            Section(header : Text("Expire Date")){
                DatePicker(selection: $expireDob, in: Date()..., displayedComponents: .date) {
                    Text("Expire Date")
                        .onAppear {
                            self.endEditing()
                    }
                    .onTapGesture{self.endEditing()}
                }
            }
            
                        Section(header : Text("Medicine Meal Type")){
                            Picker("Select Meal Type" , selection: $selectedMedcineMealType){
                                ForEach( 0 ..< Self.medicineTimeTypes.count){
                                    Text(Self.medicineTimeTypes[$0])
            
                                }
                            }
                        }
            
            Section(header : Text("Schedul")){
                Picker("Schedul" , selection: $selectedMedcinePeriodType.animation()){
                    ForEach( 0 ..< Self.medicineTimePeriods.count){
                        Text(Self.medicineTimePeriods[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            if self.selectedMedcinePeriodType != 2{
                if self.selectedMedcinePeriodType == 1{
                    Section(header : Text("SelectDays")){
                        MultipleSelectionList(days: days)
                        
                    }
                }
                Section(header:
                    HStack{
                        Text("Times")
                        Spacer()
                        Button(action: self.addNewTimeAction){
                            Image(systemName: "plus")
                        }
                    })
                {
                    ForEach(medicineTimes.items){ item in
                        TimeRow(pm: item)
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
        if let medicine = self.selectedMedicineObject{
            print(medicine)
            print(Self.medicineTypes[selectedMedcineType])
            print(self.doseStrength)
            print(Self.medicineTimeTypes[selectedMedcineMealType])
            print(Self.medicineTimePeriods[selectedMedcinePeriodType])
            
            medicineTimes.items.forEach { (m) in
                print(m.time)
                print(m.count)
            }
            
            days.items.filter({ (q) -> Bool in
                q.selected
            }).forEach { (m) in
                print(m.name)
            }
            
        }else{
            self.showingAlert.toggle()
        }
    }
    func addNewTimeAction() {
        medicineTimes.add(item: PatientMedicinesTime(time: Date(), count: 1))
    }
}

struct AddMedicineToPatientView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        AddMedicineToPatientView().environmentObject(appData)
    }
}


//    Liquid سائل
//    Tablets أقراص
//    Capsules كبسولات
//    Suppositories تحاميل
//    Drops قطرات
//    Inhalers دواء استنشاقي
//    Injections الحقن


// select medicine
// select dose form
// select dose strength
// enter expire date
// schedul [ervery day > [add time > home many] ,
// spesifice days > [add time > home many]
// as needed > without time]

struct MultipleSelectionList: View {
    @ObservedObject var days : Day
    
    var body: some View {
        List {
            ForEach(self.days.items) { item in
                MultipleSelectionRow(object : item)
            }
        }
    }
}

struct MultipleSelectionRow: View {
    @ObservedObject var object : WeekDay
    
    var body: some View {
        
        Toggle(isOn : $object.selected.animation()){
            Text(object.name)
        }
    }

}
