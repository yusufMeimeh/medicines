//
//  HomeView.swift
//  medicine
//
//  Created by Yusuf Meimeh on 8/12/20.
//  Copyright © 2020 Yusuf Meimeh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var appData : AppData
    @State private var patientMedicines = [PatientMedicines]()
    @State private var groupedItems = [UUID : [PatientMedicines]]()
    
    var body: some View {
        VStack {
            NavigationView{
                List{
                    
                    
                    if !self.patientMedicines.isEmpty{
                        Section(header : Text("Today Medications")){
                            ForEach(patientMedicines) { item in
                                TodayRow(object: item)
                            }
                        }
                    }
                    
                    
                    //                    Section(header: Text("Patients").font(.headline)){
                    //                        if !self.appData.patients.isEmpty{
                    //                            ForEach(self.appData.patients) { item in
                    //                                NavigationLink(destination: PatientDetailsView(patient: item)){
                    //                                    Text(item.name)
                    //                                }
                    //                            }
                    //                        }
                    //                        NavigationLink(destination: AddPatientView()){
                    //                            Text("Add New Patient").bold().foregroundColor(.green)
                    //                        }.buttonStyle(PlainButtonStyle())
                    //                    }
                }.navigationBarTitle("Home")
                    .listStyle(GroupedListStyle())
                
                
            }
        }.onAppear {
            self.getTodayMedications()
            self.groupedItems = Dictionary(grouping: self.patientMedicines, by: {$0.patientID})
            
        }
    }
    
    func getTodayMedications() {
        let dayIndex = Calendar.current.component(.weekday, from: Date())
        self.patientMedicines = self.appData.patientMedicines.filter { (pm) -> Bool in
            return (pm.days?.compactMap({$0.id}).contains(dayIndex) ?? false) || pm.Schedul == "Everyday" || pm.Schedul == "As Needed" 
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        HomeView().environmentObject(appData)
    }
}
