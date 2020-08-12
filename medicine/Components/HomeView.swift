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
    
    var body: some View {
        VStack {
            NavigationView{
                List{
                    Section(header: Text("Patients").font(.headline)){
                        if !self.appData.patients.isEmpty{
                            ForEach(self.appData.patients) { item in
                                NavigationLink(destination: PatientDetailsView(patient: item)){
                                    Text(item.name)
                                }
                            }
                        }
                        NavigationLink(destination: AddPatientView()){
                            Text("Add New Patient").bold().foregroundColor(.green)
                        }.buttonStyle(PlainButtonStyle())
                    }
                    
                    Section(header: Text("Medicines").font(.headline)){
                        
                        if !self.appData.medicines.isEmpty{
                            ForEach(self.appData.medicines) { item in
                                NavigationLink(destination: MedicineDetailsView(medicine: item)){
                                    Text(item.name)
                                }
                            }
                        }
                        
                        Section{
                            NavigationLink(destination: AddMedicine()){
                                Text("Add New Medicine").bold().foregroundColor(.orange)
                            }
                        }
                    }
                    
                    
                }.navigationBarTitle("Home")
                    .listStyle(GroupedListStyle())
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static let appData = AppData()
    static var previews: some View {
        HomeView().environmentObject(appData)
    }
}
